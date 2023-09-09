import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/config.dart';
import 'movies/movie.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var x = getFormFactor(context);
    // print('xxxx $x');
    // print('Web platform $isWeb');
    // print('Desktop platform $isDesktopDevice');
    // print('Linux platform $isDesktopDeviceLinux');
    // print('MacOS platform $isDesktopDeviceMacOS');
    // print('IOS platform $isMobileDeviceIOS');

    return Scaffold(
      appBar: isHandset(context) ? null : AppBar(),
      drawer: const Drawer(),
      body: const Body(),
      bottomNavigationBar:
          isHandset(context) ? const NavigationBarComponent() : null,
      resizeToAvoidBottomInset: true,
      extendBody: false,
      extendBodyBehindAppBar: false,
      // bottomSheet: ,
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<NavigationBarCubit>(context);

        if (state is NavigationBarIndexState) {
          return cubit.pages[state.index];
        }

        if (state is NavigationBarCurrentPageState) {
          return cubit.pages[state.index];
        }

        // .. default page
        return const MoviesPage();
      },
    );
  }
}
