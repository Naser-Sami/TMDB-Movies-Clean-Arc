import 'package:flutter/material.dart';
import 'app.dart';

import '/core/core.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  usePathUrlStrategy();

  // https://medium.com/@mustafatahirhussein/these-quick-tips-will-surely-help-you-to-build-a-better-flutter-app-6db93c1095b6
  // await SystemChannels.platform.invokeMethod<void>(
  //   'SystemChrome.restoreSystemUIOverlays',
  // );

  runApp(const MyApp());
}
