import 'dart:convert';

import 'package:mvvm_file_architecture/data/network/BaseApiServices.dart';
import 'package:mvvm_file_architecture/data/network/NetworkApiServices.dart';
import 'package:mvvm_file_architecture/res/app_url.dart';

import '../model/timeline_model.dart';

//! Login Auth

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<bool> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndpoint, data);
      bool loginSuccess = response['success'] ?? false;

      return loginSuccess;
    } catch (e) {
      rethrow;
    }
  }


//! SignUp Auth

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      var response =
          await _apiServices.getPostApiResponse(AppUrl.signUpEndpoint, data);
      print(json.encode(response));
      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      print(e);
      // return false;
    }
  }


//! TimeLine Auth

  Future<TimeLineModel> fetchTimeLine() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.timeLineEndpoint);
      return response = TimeLineModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
