import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/core/utils/extension.dart';
import 'package:store_app/shared/widgets/custom_appbar.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/defult_button.dart';

class SucessPaymentScreen extends StatelessWidget {
  const SucessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("sucess".png())),
            SizedBox(
              height: 20,
            ),
            CustomText("end_payment".tr()),
            SizedBox(
              height: 50,
            ),
            DefaultButton(
                onTap: () {
                  NavigationService.pushNamed(AppRouter.layoutRoute);
                },
                padding: EdgeInsets.zero,
                text: "order_follow".tr(),
                color: AppColors.primary,
                borderRadius: 20.0,
                fontSize: 15.0,
                fontColor: Colors.white),
            SizedBox(
              height: 10,
            ),
            DefaultButtonOutLined(
                onTap: () {
                  NavigationService.pushNamed(AppRouter.paymentStepRoute);
                },
                fontsize: 15.0,
                padding: EdgeInsets.zero,
                text: "back_shopping".tr(),
                color: AppColors.onPrimary,
                borderRadius: 20.0,
                fontColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
