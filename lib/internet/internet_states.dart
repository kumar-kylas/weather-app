import 'package:connectivity_plus/connectivity_plus.dart';

abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetConnectedState extends InternetState {
  String connectionType = "";

  InternetConnectedState(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      connectionType = "Wifi";
    } else if (result == ConnectivityResult.mobile) {
      connectionType = "Mobile Data";
    }
  }
}

class InternetDisconnectedState extends InternetState {}
