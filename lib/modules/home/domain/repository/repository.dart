import 'dart:html';

import 'package:store_app/core/data_source/dio_service.dart';
import 'package:store_app/core/utils/app_utils.dart';
import 'package:store_app/modules/home/domain/model/model.dart';
import 'package:store_app/modules/home/domain/repository/endpoints.dart';

class HomeRepo {
  static Future<HomeModel?> list() async {
    ApiResponse apiResponse = await Utils.dio().getData(url: HomeEndPoints.get);
    if (apiResponse.isError != true) {
      return HomeModel.fromjson(apiResponse.response?.data);
    } else {
      return null;
    }
  }

  static Future<HomeModel?> show({required int id}) async {
    final ApiResponse apiResponse =
        await Utils.dio().getData(url: HomeEndPoints.show(id), isLoading: false);

    if (apiResponse.isError != true) {
      return HomeModel.fromjson(apiResponse.response?.data);
    } else {
      return null;
    }
  }

  static Future add({
    required HomeModel homeModel,
  }) async {
    ApiResponse apiResponse = await Utils.dio()
    .postData(
        url: HomeEndPoints.post, body: homeModel.toJson());
    if (apiResponse.isError != true) {
      return apiResponse.response?.data;
    } else {
      return null;
    }
  }

  static Future update({required int id, required HomeModel homeModel}) async {
    ApiResponse apiResponse = await Utils.dio().updateData(
        url: HomeEndPoints.update(id), body: homeModel.toJson());
    if (apiResponse.isError != true) {
      return apiResponse.response?.data;
    } else {
      return null;
    }
  }

  static Future delete({
    required int id,
  }) async {
    ApiResponse apiResponse =
        await Utils.dio().deleteData(url: HomeEndPoints.delete(id));
    if (apiResponse.isError != true) {
      return apiResponse.response?.data;
    } else {
      return null;
    }
  }
}
