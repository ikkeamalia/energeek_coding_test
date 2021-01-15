import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:energeek_test/utils/v_utils.dart';
import 'package:flutter/cupertino.dart';

class ApiClient {
  get(
      {@required
          String url,
      Map<String, String> params,
      Map<String, dynamic> headers,
      @required
          ValueChanged callback(int code, String message, dynamic res)}) async {
    print("request: $url");
    print(params);

    try {
      Response response = await Dio().get(url,
          queryParameters: params, options: Options(headers: headers));
      print("code: ${response.statusCode}");
      log(VUtils.getPrettyJSONString(response.data));
      callback(response.statusCode, response.statusMessage, response.data);
    } on DioError catch (e) {
      print(e);
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          if (e.response.data is String)
            callback(e.response.statusCode,
                "Server kami sedang dalam perbaikan", e.response.data);
          else
            callback(e.response.statusCode, e.response.data["stat_msg"],
                e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, "Network Error", null);
          break;
      }
    }
  }

  postMultipart(
      {@required
          String url,
      Map<String, dynamic> headers,
      Map<String, dynamic> body,
      File files,
      String type,
      @required
          ValueChanged callback(
              int code, String message, Map<String, dynamic> json)}) async {
    try {
      var len = await files.length();
      headers[Headers.contentTypeHeader] = "multipart/form-data";
      //headers[Headers.contentLengthHeader] = len;

      String fileName = files.path.split('/').last;
      FormData formData = new FormData.fromMap({
        "type": type,
        "file": await MultipartFile.fromFile(files.path, filename: fileName)
      });

      Response response = await Dio()
          .post(url, options: Options(headers: headers), data: formData);

      callback(response.statusCode, response.statusMessage, response.data);
    } on DioError catch (e) {
      print(e.response);
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          callback(e.response.statusCode, e.response.data["stat_msg"],
              e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, "Network Error", null);
          break;
      }
    }
  }

  post(
      {@required String url,
      Map<String, dynamic> headers,
      Map<String, dynamic> body,
      @required ValueChanged callback(int code, String message, res)}) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    print("request: $url");
    print("body: $body");

    log(VUtils.getPrettyJSONString(headers));

    try {
      Response response =
          await Dio().post(url, options: Options(headers: headers), data: body);
      //   log(VUtils.getPrettyJSONString(response.data));
      callback(response.statusCode, response.data["stat_msg"], response.data);
    } on DioError catch (e) {
      print(e);
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          if (e.response.data is String)
            callback(e.response.statusCode,
                "Server kami sedang dalam perbaikan", e.response.data);
          else
            callback(e.response.statusCode, e.response.data["stat_msg"],
                e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, "Mohon cek koneksi internet anda", null);
          break;
      }
    }
  }

  delete(
      {@required String url,
      Map<String, dynamic> headers,
      Map<String, dynamic> body,
      @required ValueChanged callback(int code, String message, res)}) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    print("request: $url");
    print("body: $body");

    try {
      Response response = await Dio()
          .delete(url, options: Options(headers: headers), data: body);
      callback(response.statusCode, response.data["stat_msg"], response.data);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          if (e.response.data is String)
            callback(e.response.statusCode,
                "Server kami sedang dalam perbaikan", e.response.data);
          else
            callback(e.response.statusCode, e.response.data["stat_msg"],
                e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, "Mohon cek koneksi internet anda", null);
          break;
      }
    }
  }

  put(
      {@required String url,
      Map<String, dynamic> headers,
      Map<String, String> params,
      Map<String, dynamic> body,
      @required ValueChanged callback(int code, String message, res)}) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    print("request: $url");
    log(VUtils.getPrettyJSONString(body));

    try {
      Response response = await Dio().put(
        url,
        queryParameters: params,
        options: Options(headers: headers),
        data: body,
      );
      log(VUtils.getPrettyJSONString(response.data));
      callback(response.statusCode, response.data["stat_msg"], response.data);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.CANCEL:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.SEND_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          callback(
              e.response.statusCode, e.response.statusMessage, e.response.data);
          break;
        case DioErrorType.RESPONSE:
          if (e.response.data is String)
            callback(e.response.statusCode,
                "Server kami sedang dalam perbaikan", e.response.data);
          else
            callback(e.response.statusCode, e.response.data["stat_msg"],
                e.response.data);
          break;
        case DioErrorType.DEFAULT:
          callback(503, "Mohon cek koneksi internet anda", null);
          break;
      }
    }
  }
}
