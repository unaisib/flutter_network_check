import 'package:get/get.dart';
import 'package:network_demo/controllers/main_controller.dart';
import 'package:network_demo/controllers/network_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.lazyPut<NetworkController>(
      () => NetworkController(),
    );
  }
}
