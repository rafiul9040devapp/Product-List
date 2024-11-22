import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ConnectivityState { connected, disconnected }

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity connectivity;
  late final StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  ConnectivityCubit({required this.connectivity}) : super(ConnectivityState.connected) {
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if(result.contains(ConnectivityResult.none)){
        emit(ConnectivityState.disconnected);
      }else {
        emit(ConnectivityState.connected);
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
