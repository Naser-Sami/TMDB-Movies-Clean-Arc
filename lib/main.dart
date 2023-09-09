
import 'package:flutter/material.dart';
import 'app.dart';

import '/core/core.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  ServiceLocator().init();

  runApp(const MyApp());
}


