import 'package:flutter/material.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar(
  String text, {
  bool action = false,
  String? label,
  VoidCallback? onPressed,
  bool? showCloseIcon,
}) {
  return scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(text),
      showCloseIcon: showCloseIcon,
      // closeIconColor: ,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 30,
      margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      action: action
          ? SnackBarAction(
              label: label ?? "",
              onPressed: onPressed ?? () {},
            )
          : null,
    ),
  );
}
