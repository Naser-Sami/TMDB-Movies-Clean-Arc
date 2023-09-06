import 'dart:io';

import 'package:flutter/foundation.dart';

bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
bool get isMobileDeviceIOS => !kIsWeb && (Platform.isIOS);
bool get isMobileDeviceAndroid => !kIsWeb && (Platform.isAndroid);

bool get isDesktopDevice =>
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
bool get isDesktopDeviceMacOS => !kIsWeb && (Platform.isMacOS);
bool get isDesktopDeviceWindows => !kIsWeb && (Platform.isWindows);
bool get isDesktopDeviceLinux => !kIsWeb && (Platform.isLinux);

bool get isWeb => kIsWeb;

bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
