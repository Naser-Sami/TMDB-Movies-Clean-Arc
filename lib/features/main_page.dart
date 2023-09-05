import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/config.dart';
import 'movies/movie.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Body(),
        bottomNavigationBar: const NavigationBarComponent(),
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
