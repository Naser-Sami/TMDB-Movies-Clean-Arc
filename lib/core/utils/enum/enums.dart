enum AppTheme {
  system("System"),
  light("Light"),
  dark("Dark");

  const AppTheme(this.name);
  final String name;
}

enum RequestState { loading, loaded, error }

