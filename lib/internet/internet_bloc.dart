import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/internet/internet_events.dart';
import 'package:weather_app/internet/internet_states.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  ConnectivityResult _result = ConnectivityResult.none;

  void checkConnectivity() async {
    _result = await _connectivity.checkConnectivity();
    print('check $_result');
    updateResult(_result);
  }

  void updateResult(ConnectivityResult result) async {
    // Platform messages are asynchronous
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      add(InternetGainedEvent());
    } else {
      add(InternetLostEvent());
    }
  }

  InternetBloc()
      : super(
          // Call SuperClass "Bloc" constructor and initialise starting state
          InternetInitialState(),
        ) {
    checkConnectivity();

    // When "InternetGainedEvent" occurs,
    // update bloc state to "InternetConnectedState"
    on<InternetGainedEvent>(
      (event, emit) => emit(InternetConnectedState(_result)),
    );

    // When "InternetLostEvent" occurs,
    // update bloc state to "InternetDisconnectedState"
    on<InternetLostEvent>(
      (event, emit) => emit(InternetDisconnectedState()),
    );

    // Start Listening to the Stream
    // On change in Connectivity, fire an InternetBloc event
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      // This is the "onData" function
      (data) {
        updateResult(data);
      },
    );
  }

  @override
  Future<void> close() {
    // Stop listening to Stream
    _connectivitySubscription?.cancel();

    // Close Bloc
    return super.close();
  }
}

/*
  var result = await Connectivity().checkConnectivity();
  switch(result)
  {
    case ConnectivityResult.wifi:
    case ConnectivityResult.mobile:
    case ConnectivityResult.none:
  }
*/
