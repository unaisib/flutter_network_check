import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:network_demo/ui/screens/about_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('SettingsScreen'),
          TextButton(
            onPressed: () {
              Get.toNamed(AboutScreen.routeName);
            },
            child: const Text('Goto About Screen'),
          ),
        ],
      ),
    );
  }
}
