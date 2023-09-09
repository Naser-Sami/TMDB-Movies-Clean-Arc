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

enum LanguageType { ENGLISH, ARABIC }

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}