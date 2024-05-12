import 'package:get_it/get_it.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/core/data_source/dio_service.dart';



GetIt locator = GetIt.instance;

  Future<void> setupLocator () async {  
  
  locator.registerSingleton<AppRouter>(AppRouter());
  locator.registerSingleton<DioService>(DioService(baseUrl: baseUrl));



}



