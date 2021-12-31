import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_demo/controllers/network_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkController _controller = Get.find<NetworkController>();
    return Center(
      child: Obx(
        () => _controller.connectionStatus.value == ConnectionStatus.none
            ? const CircularProgressIndicator()
            : const Text('HomeScreen'),
      ),
    );
  }
}
