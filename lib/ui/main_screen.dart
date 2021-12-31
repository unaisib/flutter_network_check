import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:network_demo/controllers/main_controller.dart';
import 'package:network_demo/controllers/network_controller.dart';

class MainScreen extends StatelessWidget {
  static String routeName = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController _controller = Get.find<MainController>();
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
                  padding: EdgeInsets.all(0),
                  child: Center(
                    child: Text(
                      'Failed to connect to Internet',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ]
            : null,
        body: _controller.screens[_controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _controller.selectedIndex.value,
          onTap: (i) => _controller.selectedIndex.value = i,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
