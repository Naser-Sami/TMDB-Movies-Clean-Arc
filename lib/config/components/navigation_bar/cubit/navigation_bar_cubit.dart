import 'package:bloc/bloc.dart';
import 'package:clean_architecture_structure/features/frosted_glass_design/frosted_glass_design.dart';
import 'package:clean_architecture_structure/features/movies/movie.dart';
import 'package:clean_architecture_structure/features/profile/profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarInitial());

  int selectedIndex = 0;

  void changeSelectedIndex(int index) {
    if (selectedIndex == index) {
      emit(NavigationBarCurrentPageState(selectedIndex));
    } else {
      selectedIndex = index;
      emit(NavigationBarIndexState(selectedIndex));
    }
  }

  List<Destination> allDestinations = const <Destination>[
    Destination(0, 'home', Icons.home, Colors.teal),
    Destination(1, 'business', Icons.business, Colors.cyan),
    Destination(2, 'school', Icons.school, Colors.orange),
    Destination(3, 'flight', Icons.flight, Colors.blue),
  ];

  List<Widget> pages = [
    const MoviesPage(),
    const Center(child: Text("Business")),
    const Center(child: Text("Wallet")),
    const FrostedGlassPage(),
    const ProfilePage(),
  ];
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);

  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}
