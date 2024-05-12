
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/data_source/dio_service.dart';
import 'package:store_app/core/utils/injection.dart';

// all object in application
// to find it easly

class Utils {
  // call object from locator
  static AppRouter appRouter = locator<AppRouter>();
  static DioService dio() => locator<DioService>();
}

// to use object
//Utils.dio().getData(url: url);
