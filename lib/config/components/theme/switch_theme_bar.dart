import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../config.dart';

class SwitchThemeBarComponent extends StatelessWidget {
  const SwitchThemeBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ThemeBloc>();
    final ThemeData theme = Theme.of(context);

    return Center(
      child: ToggleButtons(
        direction: Axis.horizontal,
        onPressed: (int index) async {
          context
              .read<ThemeBloc>()
              .add(ThemeChangedEvent(theme: AppTheme.values[index]));
        },
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.r08)),
        // selectedBorderColor: Colors.red[700],
        // selectedColor: Colors.white,
        // fillColor: Colors.red[200],
        // color: Colors.red[400],
        constraints: BoxConstraints(
          minHeight: AppSize.hs30,
          minWidth: AppSize.ws80,
        ),
        isSelected: bloc.selectedAppTheme,
        children: bloc.app_theme,
      ),
    );
  }
}
