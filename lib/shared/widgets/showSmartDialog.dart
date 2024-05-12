import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';

// defult SmartDialig
//  SmartDialog.showToast(msg);
//   SmartDialog.showLoading(msg:"loading");

class ShowSmartDialog {
  // to know that dilaog is show or not
  static bool shown = false;

  static show({bool fullScreen = false}) {
    if (shown == false) {
      SmartDialog.show(
          //if click in background
          clickMaskDismiss: false,
          animationType: SmartAnimationType.scale,
          animationTime: const Duration(milliseconds: 100),
          //(calling [show] multiple times will not generate multiple dialogs, only single dialog will be kept)
          keepSingle: true,
          builder: (context) => fullScreen
              ? loadingWidget()
              : Dialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: SizedBox(height: 200, child: loadingWidget()),
                ));

             shown = true;
    }
  }

  static Center loadingWidget() =>  Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      );

  static dismis() {
    if (shown) {
      SmartDialog.dismiss();
      shown = false;
    } else {}
  }
}
