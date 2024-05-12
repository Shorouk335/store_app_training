import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_utils.dart';

class NavigationService {

  static pushNamed( String name,
      {Object? extra,
      Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{}}) {
    Utils.appRouter.goRoute.pushNamed(
          name,
          extra: extra,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
        );
  }

  static pushReplacement(String name, {Object? extra}) {
    Utils.appRouter.goRoute.pushReplacement(
          name,
          extra: extra,
        );
  }

  static goNamed( String name,
      {Object? extra,
      Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{}}) {
    Utils.appRouter.goRoute.goNamed(
          name,
          extra: extra,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
        );
  }
}
