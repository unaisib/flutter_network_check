import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:network_demo/controllers/network_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkController _controller = Get.find<NetworkController>();
    return Center(
      child: Obx(
        () => _controller.connectionStatus.value == ConnectionStatus.none
            ? const CircularProgressIndicator()
            : const Text('NotificationScreen'),
      ),
    );
  }
}
