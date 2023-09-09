import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<InternetConnectionStatus> get internetConnectionStatus;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImpl(this._internetConnectionChecker);

  @override
  // implement isConnected
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  @override
  // implement isConnected
  Future<InternetConnectionStatus> get internetConnectionStatus => _internetConnectionChecker.connectionStatus;
}
