import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_file_architecture/data/app_exception.dart';
import 'package:mvvm_file_architecture/data/network/BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {

  //! Get Method

  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            // headers: <String, String>{
            //   'Content-Type': 'application/json; charset=UTF-8',
            // },
          )
          .timeout(const Duration(seconds: 10));
      log("INFO FOR $url");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //! Post Method
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      log('POST Request Payload: $data');

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'An error occurred while communicating with the server with status code ${response.statusCode}');
    }
  }
}
