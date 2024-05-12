import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:store_app/core/theme/app_theme.dart';
import 'package:store_app/core/utils/injection.dart';
import 'package:store_app/core/utils/app_utils.dart';
import 'package:store_app/modules/layout/cubit/cubit.dart';
import 'package:store_app/shared/widgets/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await setupLocator();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ar', 'SA'), Locale('en', 'US')],
        startLocale: Locale('ar', 'SA'),
        saveLocale: true,
        path: 'assets/translations',
        child: const StoreApp()),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LayoutCubit())
      ],
      child: MaterialApp.router(
        title: 'MyRepo',
        debugShowCheckedModeBanner: false,
        //router => screens
        routeInformationParser: Utils.appRouter.goRoute.routeInformationParser,
        routeInformationProvider:
            Utils.appRouter.goRoute.routeInformationProvider,
        routerDelegate: Utils.appRouter.goRoute.routerDelegate,
        //easy localization =>
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (context, child) {
          // smart dialog
          final smartDialog = FlutterSmartDialog.init();
          child = smartDialog(context, child);
          //responsive
          
          return  ResponsineWrapper(child: child);
        },
        theme: ThemesManger.appTheme
      ),
    );
  }
}
