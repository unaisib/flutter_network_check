import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:network_demo/ui/screens/home_screen.dart';
import 'package:network_demo/ui/screens/notification_screen.dart';
import 'package:network_demo/ui/screens/profile_screen.dart';
import 'package:network_demo/ui/screens/settings_screen.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  List<Widget> screens = const [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];
}
