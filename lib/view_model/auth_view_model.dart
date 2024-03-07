import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_file_architecture/data/response/api_response.dart';
import 'package:mvvm_file_architecture/model/timeline_model.dart';
import 'package:mvvm_file_architecture/repository/auth_repository.dart';
import 'package:mvvm_file_architecture/view/home_screen.dart';
import 'package:mvvm_file_architecture/view/login_view.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  //! Login Api

  Future<bool> loginApi(dynamic data, BuildContext context) async {
    try {
      bool loginSuccess = await _myRepo.loginApi(data);
      if (loginSuccess) {
        Get.offAll(() => const HomeScreen());
        GetStorage().write('userLoggedIn', true);
        return true;
      } else {
        if (kDebugMode) {
          Utils.flushBarErrorMessage('Login Failed', context);
        }
      }
      return loginSuccess;
    } catch (e) {
      if (kDebugMode) {
        Utils.flushBarErrorMessage(e.toString(), context);
      }
      rethrow;
    }
  }

  //! SignUp Api

  Future<bool> signUpAPi(dynamic data, BuildContext context) async {
    try {
      dynamic signUpSuccess = await _myRepo.signUpApi(data);
      if (signUpSuccess.containsKey('error')) {
        // Handle the error case
        if (kDebugMode) {
          Utils.flushBarErrorMessage(signUpSuccess['error'], context);
        }
        return false;
      }

      if (signUpSuccess['success'] == true) {
        Get.offAll(() => const LoginView());
        // GetStorage().write('userLoggedIn', true);
        return true;
      } else {
        if (kDebugMode) {
          Utils.flushBarErrorMessage(signUpSuccess['msg'], context);
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        Utils.flushBarErrorMessage(e.toString(), context);
      }

      return false;
    }
  }

  //! TimeLineBar Get Api

  ApiResponse<TimeLineModel> timeLineList = ApiResponse.loading();
  setTimeLineList(ApiResponse<TimeLineModel> response) {
    timeLineList = response;
    notifyListeners();
  }

  Future<void> fetchTimeLineApi() async {
    setTimeLineList(ApiResponse.loading());

    _myRepo.fetchTimeLine().then((value) {
      setTimeLineList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setTimeLineList(ApiResponse.error(error.toString()));
    });
  }
}
