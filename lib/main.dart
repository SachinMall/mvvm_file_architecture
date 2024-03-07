import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_file_architecture/controller/dependency_injection.dart';
import 'package:mvvm_file_architecture/view/custom_timeline.dart';
import 'package:mvvm_file_architecture/view/splash_scree.dart';
import 'package:mvvm_file_architecture/view/timeline_bar.dart';

void main() async {
  await GetStorage.init();
  DependencyInjection.init();   //! Network error
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
