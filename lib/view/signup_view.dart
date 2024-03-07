import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_file_architecture/utils/const.dart';
import 'package:mvvm_file_architecture/utils/utils.dart';
import 'package:mvvm_file_architecture/view/widget/custom_textfield.dart';
import 'package:mvvm_file_architecture/view_model/auth_view_model.dart';

import 'widget/custom_elevatedbutton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _genderController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    nameFocusNode.dispose();
    genderFocusNode.dispose();
    mobileFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Get.put(AuthViewModel());

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   elevation: 0,
      //   title: Text(
      //     'SignUp',
      //     style: TextStyle(fontSize: 20, color: Colors.white),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              padding: const EdgeInsets.only(top: 50, left: 20),
              color: const Color(0xff17232F),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white),
                  height50,
                  Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  height5,
                  Text(
                    'Create your account',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: GlobalKey(),
                child: Column(
                  children: [
                    CustomTextField(
                      hinttext: 'Name',
                      controller: _nameController,
                      keyboardtype: TextInputType.emailAddress,
                      onfieldSubmit: (value) {
                        Utils.fieldFocusChange(
                            context, nameFocusNode, genderFocusNode);
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                    height20,
                    CustomTextField(
                      hinttext: 'Gender',
                      controller: _genderController,
                      keyboardtype: TextInputType.emailAddress,
                      onfieldSubmit: (value) {
                        Utils.fieldFocusChange(
                            context, genderFocusNode, emailFocusNode);
                      },
                    ),
                    height20,
                    CustomTextField(
                      hinttext: 'Email',
                      controller: _emailController,
                      keyboardtype: TextInputType.emailAddress,
                      onfieldSubmit: (value) {
                        Utils.fieldFocusChange(
                            context, emailFocusNode, mobileFocusNode);
                      },
                    ),
                    height20,
                    CustomTextField(
                      hinttext: 'Mobile',
                      controller: _mobileController,
                      keyboardtype: TextInputType.emailAddress,
                      onfieldSubmit: (value) {
                        Utils.fieldFocusChange(
                            context, mobileFocusNode, passwordFocusNode);
                      },
                    ),
                    height20,
                    ValueListenableBuilder(
                      valueListenable: _obsecurePassword,
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        return CustomTextField(
                          controller: _passwordController,
                          hinttext: 'Password',
                          // keyboardtype: TextInputType.visiblePassword,
                          isPassword: true, obscureText: value,
                          suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility),
                          ),
                          onfieldSubmit: (value) {},
                        );
                      },
                    ),
                  ],
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
                Map data = {
                  'email': _emailController.text.toString(),
                  'password': _passwordController.text.toString(),
                  'name': _nameController.text.toString(),
                  'mobile': _mobileController.text.toString(),
                  'gender': _genderController.text.toString(),
                };

                await authViewModel.signUpAPi(data, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
