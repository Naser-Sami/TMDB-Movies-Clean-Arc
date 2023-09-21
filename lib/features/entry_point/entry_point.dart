import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../config/config.dart';
import '../../core/core.dart';

ScrollController scrollBottomBarController =
    ScrollController(); // set controller on scrolling

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  RiveAsset selectedBottomNav = bottomNavs.first;
  int pageIndex = 0;

  // 1. Initialize all the variables
  bool _showAppbar = true; //this is to show app bar

  bool isScrollingDown = false;
  bool _show = true;
  double bottomBarHeight = 75; // set bottom bar height
  final double _bottomBarOffset = 0;

  // 2. Call initSate() method:
  @override
  void initState() {
    super.initState();
    myScroll();
  }

  // 3. Call dispose() method:
  @override
  void dispose() {
    scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  // 4. Create two methods to show or hide
  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  // 5. To handle the scrolling we have to add the listener
  //    to scroll controller so we have to create one method called myScroll():
  void myScroll() async {
    scrollBottomBarController.addListener(() {
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          hideBottomBar();
        }
      }
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          showBottomBar();
        }
      }
    });
  }

  // 6. Build widget:

  @override
  Widget build(BuildContext context) {
    LoggerDebug.loggerInformationMessage(Func.isSystemDarkMode());

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: false,
        // appBar: _showAppbar
        //     ? AppBar()
        //     : const PreferredSize(
        //         preferredSize: Size(0.0, 0.0),
        //         child: SizedBox(),
        //       ),
        body: BlocProvider.of<NavigationBarCubit>(context).pages[pageIndex],
        bottomNavigationBar: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _show ? 1 : 0,
          child: SafeArea(
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
                                    opacity:
                                        bottomNavs[index] == selectedBottomNav
                                            ? 1.00
                                            : 0.50,
                                    child: RiveAnimation.asset(
                                      bottomNavs.first.src,
                                      artboard: bottomNavs[index].artboard,
                                      onInit: (artboard) {
                                        StateMachineController controller =
                                            RiveUtils.getRiveController(
                                          artboard,
                                          stateMachineName: bottomNavs[index]
                                              .stateMachineName,
                                        );

                                        bottomNavs[index].input = controller
                                            .findSMI("active") as SMIBool;
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
                  return const Center(
                    child: Text("Theme not loaded"),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
