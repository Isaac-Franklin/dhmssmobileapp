import 'dart:convert';

import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> registerUser(Map<String, dynamic> userData) async {
    try {
      Response response = await _dio.post(
        'https://dhms.itservicedeskafrica.com/api/studentreg', // ENDPOINT URL
        data: userData, // REQUEST BODY
        // options: Options(headers: {
        //   'X-LoginRadius-Sott': 'YOUR_SOTT_KEY', // HEADERS
        // }),
      );
      // returns the successful response object
      return response;
    } catch (e) {
      if (e is DioError) {
        // if DioError, return its response or create a new error response
        return e.response ??
            Response(
                requestOptions: e.requestOptions,
                statusCode: 500,
                statusMessage: e.message);
      } else {
        // if the error is not a DioError, return a generic error response
        return Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 500,
            statusMessage: e.toString());
      }
    }
  }

  // ignore: non_constant_identifier_names
  Future<Response> StudentLogin(Map<String, dynamic> userData) async {
    var ErrorMessage;
    //IMPLEMENT USER LOGIN
    try {
      Response response = await _dio.post(
        'https://dhms.itservicedeskafrica.com/api/studentlogin',
        data: userData,
      );
      print('LOGIN API CALL AREA');
      print(response);
      print(response.data['message']);
      // StudentLoginFailure()
      ErrorMessage = response;
      return response;
    } catch (e) {
      print(ErrorMessage);
      if (e is DioError) {
        // if DioError, return its response or create a new error response
        return e.response ??
            Response(
                requestOptions: e.requestOptions,
                statusCode: 400,
                statusMessage: e.message);
      } else {
        print(ErrorMessage);
        // if the error is not a DioError, return a generic error response
        return Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 400,
            statusMessage: e.toString());
      }
    }
  }

  // Future<Response> getUserProfileData() async {
  //   //GET USER PROFILE DATA
  // }

  // Future<Response> logout() async {
  //   //IMPLEMENT USER LOGOUT
  // }
}
