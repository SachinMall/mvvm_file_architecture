import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_file_architecture/view/home_screen.dart';
import 'package:mvvm_file_architecture/view/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = GetStorage().read('isLoggedIn') ?? false;
    print('isLoggedIn: $isLoggedIn');

    await Future.delayed(
      const Duration(microseconds: 600),
      () {
        if (isLoggedIn) {
          Get.off(() => const HomeScreen());
        } else {
          Get.off(() => const LoginView());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
