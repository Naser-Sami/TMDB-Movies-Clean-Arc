// ignore_for_file: constant_identifier_names

enum AppTheme {
  system("System"),
  light("Light"),
  dark("Dark");

  const AppTheme(this.name);
  final String name;
}

enum ScreenType { Desktop,  Tablet, Handset, Watch }

enum RequestState { Loading, Loaded, Error }

