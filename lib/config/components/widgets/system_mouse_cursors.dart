import 'package:flutter/material.dart';

class SystemMouseCursorsComponent extends StatelessWidget {
  final Widget child;
  final MouseCursor cursor;
  const SystemMouseCursorsComponent({super.key, required this.child, required this.cursor});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: cursor, // SystemMouseCursors.
      child: child,
    );
  }
}
