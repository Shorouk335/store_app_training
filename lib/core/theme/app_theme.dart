import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'dynamic_theme/colors.dart';
import 'dynamic_theme/themes_color.dart';

class ThemesManger {
  static ThemeData get appTheme {
    return ThemeData(
        fontFamily: 'Cairo',
        unselectedWidgetColor: Colors.grey,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: AppColors.primary

          )
        ),
        primarySwatch: AppThemes().selectedSchema.primary.toMaterialColor(),
          scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColors.background,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
      
       
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColors.background)),
        colorScheme: AppThemes().selectedSchema,
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
        
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0.0,
        ) , 
      
        );
  }
}
