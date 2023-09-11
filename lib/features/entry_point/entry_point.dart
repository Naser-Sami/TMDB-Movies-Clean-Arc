import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../config/config.dart';
import '../../core/core.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectedBottomNav = bottomNavs.first;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    LoggerDebug.loggerInformationMessage(Func.isSystemDarkMode());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: false,
      body: BlocProvider.of<NavigationBarCubit>(context).pages[pageIndex],
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is LoadedThemeState) {
              return Container(
                padding: EdgeInsets.all(AppPadding.p12),
                margin: EdgeInsets.fromLTRB(AppMargin.m24, 0, AppMargin.m24,
                    isMobileDeviceIOS ? 0 : AppMargin.m24),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 3),
                        color: LTColors.backgroundColor2,
                        blurRadius: 20)
                  ],
                  color: state.isDarkMode
                      ? DTColors.fall
                      : LTColors.backgroundColor2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.r24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      bottomNavs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          if (bottomNavs[index] != selectedBottomNav) {
                            setState(() {
                              selectedBottomNav = bottomNavs[index];
                              pageIndex = index;
                            });
                          }

                          bottomNavs[index].input?.change(true);
                          Future.delayed(const Duration(seconds: 1), () {
                            bottomNavs[index].input?.change(false);
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBar(
                                isActive:
                                    bottomNavs[index] == selectedBottomNav),
                            SizedBox(
                              height: AppSize.ws36,
                              width: AppSize.ws36,
                              child: Opacity(
                                opacity: bottomNavs[index] == selectedBottomNav
                                    ? 1.00
                                    : 0.50,
                                child: RiveAnimation.asset(
                                  bottomNavs.first.src,
                                  artboard: bottomNavs[index].artboard,
                                  onInit: (artboard) {
                                    StateMachineController controller =
                                        RiveUtils.getRiveController(
                                      artboard,
                                      stateMachineName:
                                          bottomNavs[index].stateMachineName,
                                    );

                                    bottomNavs[index].input =
                                        controller.findSMI("active") as SMIBool;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("Theme not loaded"),
              );
            }
          },
        ),
      ),
    );
  }
}
