import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_file_architecture/utils/const.dart';
import 'package:mvvm_file_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_file_architecture/view/login_view.dart';
import 'package:mvvm_file_architecture/view/widget/custom_elevatedbutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: kwhite),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.lightBlue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Hello'),
            height30,
            CommonElevatedButton(
              name: 'Log Out',
              buttonwidth: 0.5,
              textStyle: const TextStyle(fontSize: 12, color: kwhite),
              ontap: () {
                GetStorage().write('isLoggedIn', null);
                Get.offAll(() => const LoginView());
              },
            )
          ],
        ),
      ),
    );
  }
}
