import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>(debugLabel: '_globalKey');

  push(BuildContext context, Widget screen) {
    Navigator.of(navigatorKey.currentContext ?? context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return screen;
    }));
  }

  pop() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }

  pushReplacement(Widget screen) {
    Navigator.of(navigatorKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return screen;
    }));
  }
}
