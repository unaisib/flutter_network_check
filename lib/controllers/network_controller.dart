import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum ConnectionStatus {
  mobile,
  wifi,
  none,
}

class NetworkController extends GetxController {
  var connectionStatus = ConnectionStatus.none.obs;
  final Connectivity _connectivity = Connectivity();

  var _connectivitySubscription;

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = ConnectionStatus.wifi;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = ConnectionStatus.mobile;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = ConnectionStatus.none;
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get network connection');
    }
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result);
  }

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((event) {
      _updateConnectionStatus(event);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
