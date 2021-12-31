import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:network_demo/controllers/network_controller.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkController _netController = Get.find<NetworkController>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Network'),
          centerTitle: true,
        ),
        persistentFooterButtons: _netController.connectionStatus.value == ConnectionStatus.none
            ? [
                const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      'Failed to connect to Internet',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ]
            : null,
        body: body,
      ),
    );
  }
}
