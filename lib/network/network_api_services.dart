import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:technofra/Utils/Helpers/dialogs.dart';
import 'package:technofra/network/base_manager.dart';
import 'package:logger/logger.dart';

class NetworkApiServices {
  Dio dio = Dio();

  String basicAuth = 'Basic ${base64.encode(utf8.encode('admin:Woka@1234'))}';
  var logger = Logger(
  printer: PrettyPrinter(
    // methodCount: 2, // Number of method calls to be displayed
    // errorMethodCount: 8, // Number of method calls if stacktrace is provided
    // lineLength: 120, // Width of the output
    colors: true, // Colorful log messages
    // printEmojis: true, // Print an emoji for each log message
    // printTime: false // Should each log print contain a timestamp
  ),
);
  Future<ResponseData> getApi(String url) async {
    if (kDebugMode) {
      print("api url is >>> $url");
    }
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();
    try {
      response = await dio.get(url,
          options: Options(headers: {
            "authorization": basicAuth,
            'access-token': token,
            // "device-id": deviceId
          }));
    } on Exception catch (e) {
      // log(e.toString());
      if (e is DioException) {
        logger.e(e.response.toString());
        if (e.response == null) {
          return ResponseData(
            'Oops something Went Wrong, Please try again!',
            ResponseStatus.FAILED,
          );
        }
        if (e.response!.statusCode == 401) {
          if (e.response!.data['message'] == 'Invalid token') {
            // prefs.remove('access-token');
            // await prefs.clear();
            // Get.offNamed(RouteName.loginScreen);
            Utils.showToast('Please login again');
          } else {
            return ResponseData(
              'Oops something Went Wrong, Please try again!',
              ResponseStatus.FAILED,
            );
          }
        }
        if (e.response!.statusCode == 403) {
          if (e.response!.data['message'] is List) {
            return ResponseData(
                e.response!.data['message'][0]!, ResponseStatus.FAILED,
                data: e.response!.data);
          } else {
            return ResponseData(
                e.response!.data['message'], ResponseStatus.FAILED,
                data: e.response!.data);
          }
        }
      }
      return ResponseData(
          'Oops something Went Wrong', ResponseStatus.FAILED);
    }
    if (response.statusCode == 200) {
      return ResponseData(
        "success",
        data: response.data,
        ResponseStatus.SUCCESS,
      );
    } else {
      try {
        return ResponseData(
            response.data['message'].toString(), ResponseStatus.FAILED);
      } catch (_) {
        return ResponseData(
            response.statusMessage!, ResponseStatus.FAILED);
      }
    }
  }

  @override
  Future<ResponseData> postApi(data, String url) async {
    if (kDebugMode) {
      print("data >>> $data");
      print("api url is >>> $url");
    }
    Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      response = await dio.post(url,
          data: data,
          options: token != null
              ? Options(headers: {
                  "authorization": basicAuth,
                  'access-token': token,
                })
              : Options(headers: {
                  "authorization": basicAuth,
                }));
    } on Exception catch (e) {
      if (e is DioException) {
        logger.e(e.response.toString());
        if (e.response == null) {
          return ResponseData(
            'Oops something Went Wrong, Please try again!',
            ResponseStatus.FAILED,
          );
        }
        if (e.response!.statusCode == 401) {
          if (e.response!.data['message'] == 'Invalid token') {
            prefs.remove('access-token');
            await prefs.clear();
           // Get.offNamed(RouteName.loginScreen);
            Utils.showToast('Please login again');
          } else {
            return ResponseData(
              'Oops something Went Wrong, Please try again!',
              ResponseStatus.FAILED,
            );
          }
          // Get.toNamed(RouteName.login);
          // return ResponseData(
          //   'Oops something Went Wrong, Please try again!',
          //   ResponseStatus.FAILED,
          // );
        }
        if (e.response!.statusCode == 403) {
          if (e.response!.data['message'] is List) {
            return ResponseData(
                e.response!.data['message'][0]!, ResponseStatus.FAILED,
                data: e.response!.data);
          } else {
            return ResponseData(
                e.response!.data['message'], ResponseStatus.FAILED,
                data: e.response!.data);
          }
        }
      }
      return ResponseData(
        'Oops something Went Wrong',
        ResponseStatus.FAILED,
      );
    }

    if (response.statusCode == 200) {
      return ResponseData("success", ResponseStatus.SUCCESS,
          data: response.data);
    } else {
      try {
        return ResponseData(
            response.data['message'].toString(), ResponseStatus.FAILED);
      } catch (_) {
        return ResponseData(
            response.statusMessage!, ResponseStatus.FAILED);
      }
    }
  }
}
