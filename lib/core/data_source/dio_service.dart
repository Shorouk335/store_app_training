import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:store_app/shared/widgets/showSmartDialog.dart';

class DioService {
  //object from dio
  Dio mydio = Dio();

  // initialize dio object in constractor
  DioService({String baseUrl = ""}) {
    mydio = Dio(
      BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Accept": "application/json",
        'Content-Type': "application/json",
      },
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ))
      // to print flow of dio (get , post , ....)
      ..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  //General Function of Dio
  
  //1// Get
  Future<ApiResponse> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    bool isLoading = true,
  }) async {
    try {
      //TO SHOW DIALOG OF LOADING WHEN GET DATA
      if (isLoading) {
        ShowSmartDialog.show();
      }

      final response = await mydio.get(url, queryParameters: queryParameters);
      // TO DISMIS DIALOG AFTER GET DATA SUCCESSFULLY
      if (isLoading) {
        ShowSmartDialog.dismis();
      }
      return ApiResponse(response: response , isError  : false);
    } on DioException catch (e) {
      return HandleException(e: e);
    }
  }

  //2// Post
  Future<ApiResponse> postData({
    required String url,
    required Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool isLoading = true,
    // IF WE SENT PIC MUST SEND IN FORM DATA
    bool isFormData = false,
  }) async {
    try {
      //TO SHOW DIALOG OF LOADING WHEN GET DATA
      if (isLoading) {
        ShowSmartDialog.show();
      }

      final response = await mydio.post(url,
          queryParameters: queryParameters,
          data: isFormData ? FormData.fromMap(body ?? {}) : body);
      // TO DISMIS DIALOG AFTER GET DATA SUCCESSFULLY
      if (isLoading) {
        ShowSmartDialog.dismis();
      }
      return ApiResponse(response: response  ,  isError  : false);
    } on DioException catch (e) {
      return HandleException(e: e);
    }
  }

  //3// Update
  Future<ApiResponse> updateData(
      {required String url,
      required Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool isLoading = true,
      // IF WE SENT PIC MUST SEND IN FORM DATA

      bool isFormData = false}) async {
    try {
      //TO SHOW DIALOG OF LOADING WHEN GET DATA
      if (isLoading) {
        ShowSmartDialog.show();
      }

      final response = await mydio.put(url,
          queryParameters: queryParameters,
          data: isFormData ? FormData.fromMap(body ?? {}) : body);
      // TO DISMIS DIALOG AFTER GET DATA SUCCESSFULLY
      if (isLoading) {
        ShowSmartDialog.dismis();
      }
      return ApiResponse(response: response ,  isError  : false);
    } on DioException catch (e) {
      return HandleException(e: e);
    }
  }

  //4// Delete
  Future<ApiResponse> deleteData({
    required String url,
    bool isLoading = true,
  }) async {
    try {
      //TO SHOW DIALOG OF LOADING WHEN GET DATA
      if (isLoading) {
        ShowSmartDialog.show();
      }

      final response = await mydio.delete(url);
      // TO DISMIS DIALOG AFTER GET DATA SUCCESSFULLY
      if (isLoading) {
        ShowSmartDialog.dismis();
      }
      return ApiResponse(response: response  , isError  : false);
    } on DioException catch (e) {
      return HandleException(e: e);
    }
  }

  //Dialog OF ERROR
  showErrorDialog(DioException e) {
    SmartDialog.showToast(e.response?.data["message"] ?? "Unkown error");
  }

  // TO DISMIS AND SHOW DIALOG OF ERROR AND RETURN API RESPONSE
  HandleException({
    required DioException e,
  }) {
    ShowSmartDialog.dismis();
    if (DioExceptionType.receiveTimeout == e.type ||
        DioExceptionType.connectionTimeout == e.type) {
      showErrorDialog(e);
    } else if (DioExceptionType.sendTimeout == e.type) {
      showErrorDialog(e);
    } else if (DioExceptionType.cancel == e.type) {
      showErrorDialog(e);
    } else if (DioExceptionType.badResponse == e.type) {
      SmartDialog.showToast(
          e.response?.data["message"] ?? "لا يمكن الوصول للسيرفير");
      if (e.response!.statusCode == 401) {
        // Utils.removeToken();
      }
    } else if (DioExceptionType.unknown == e.type) {
      if (e.message?.contains('SocketException') ?? false) {
        showErrorDialog(e);
      }
    } else {}

    return ApiResponse(isError: true);
  }
}

// to handle responsive from api
//isError true or false
//Response if isError true
// dioException if isError false
class ApiResponse {
  bool? isError;
  Response? response;
  ApiResponse({this.isError, this.response});
}
