import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:network_demo/bindings/main_binding.dart';
import 'package:network_demo/ui/main_screen.dart';
import 'package:network_demo/ui/screens/about_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: MainBinding(),
      home: const MainScreen(),
      getPages: [
        GetPage(name: MainScreen.routeName, page: () => const MainScreen()),
        GetPage(name: AboutScreen.routeName, page: () => const AboutScreen())
      ],
    );
  }
}
