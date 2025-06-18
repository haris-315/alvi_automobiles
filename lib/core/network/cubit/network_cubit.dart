import 'dart:developer';

import 'package:alvi_automobiles/core/dio/dio_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit() : super(NetworkInitial());

  void checkForNetwork(
   { required VoidCallback availabilityCallback,
    required VoidCallback inAvailablitiyCallBack,}
  ) async {
    try {
      final res = await DioSettings.checkConnectivity();
      if (res) {
        availabilityCallback.call();
        emit(NetworkAvailable());
      } else {
        inAvailablitiyCallBack.call();

        emit(NetworkNotAvailable());
      }
    } catch (e) {
      inAvailablitiyCallBack.call();

      emit(NetworkNotAvailable());
      log("Network Error!", name: "Dio Settings");
    }
  }
}
