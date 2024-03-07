import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_file_architecture/utils/const.dart';
import 'package:mvvm_file_architecture/utils/utils.dart';
import 'package:mvvm_file_architecture/view/signup_view.dart';
import 'package:mvvm_file_architecture/view/widget/custom_elevatedbutton.dart';
import 'package:mvvm_file_architecture/view/widget/custom_textfield.dart';
import 'package:mvvm_file_architecture/view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final authViewModel = Get.put(AuthViewModel());

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();



  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kred,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/login.png'),
            height20,
            CustomTextField(
              controller: _emailController,
              hinttext: 'Email',
              keyboardtype: TextInputType.emailAddress,
              onChanged: (value) {},
              validator: (value) {},
              onfieldSubmit: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            height20,
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (BuildContext context, bool value, Widget? child) {
                return CustomTextField(
                  controller: _passwordController,
                  hinttext: 'Password',
                  // keyboardtype: TextInputType.visiblePassword,
                  isPassword: true, obscureText: value,
                  suffixIcon: InkWell(
                    onTap: () {
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                    child: Icon(_obsecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                  ),
                  onfieldSubmit: (value) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const SignUpPage());
                  },
                  child: const Text("Sign UP"),
                ),
              ),
            ),
            height30,
            CommonElevatedButton(
              name: 'Login',
              buttonwidth: 0.5,
              textStyle: const TextStyle(
                  fontSize: 14, color: kwhite, fontWeight: FontWeight.w500),
              ontap: () async {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'Please Enter Your Email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'Please Enter Your Password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      "Please Enter 6 digit password", context);
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  if (kDebugMode) {
                    log(json.encode(data));
                  }
                  authViewModel.loginApi(data, context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
