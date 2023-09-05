import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/navigation_bar_cubit.dart';


class NavigationBarComponent extends StatelessWidget {
  const NavigationBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {

        final cubit = BlocProvider.of<NavigationBarCubit>(context);

        return NavigationBar(
          selectedIndex: cubit.selectedIndex,
          onDestinationSelected: (int index) {
              cubit.changeSelectedIndex(index);
          },
          destinations: cubit.allDestinations.map((Destination destination) {
            return NavigationDestination(
              icon: Icon(destination.icon, color: destination.color),
              label: destination.title,
            );
          }).toList(),
        );
      },
    );
  }
}
