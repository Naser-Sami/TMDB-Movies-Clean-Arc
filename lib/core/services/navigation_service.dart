import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>(debugLabel: '_globalKey');

  push(Widget screen) {
    Navigator.of(navigatorKey.currentContext!)
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
