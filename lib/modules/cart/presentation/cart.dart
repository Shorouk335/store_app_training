import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/modules/cart/presentation/widgets/cartBox.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/defult_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "saved_items".tr(),
              color: AppColors.primary,
              weight: FontWeight.bold,
              fontsize: 18.0,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                         if(index == 9){
                           return Column(
                            children: [
                              CartBoxWidget(),
                              SizedBox(height: 160,)
                            ],
                           );
                         } else {
                          return CartBoxWidget();
                         }
                       
                      }),
                  Column( 
                  mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultButton(
                        text: "buy_now".tr(),
                        fontSize: 13.0,
                        onTap: () {
                          NavigationService.pushNamed(AppRouter.addToCartRoute);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DefaultButtonOutLined(
                        text: "add_to_cart".tr(),
                        color: AppColors.onPrimary,
                        fontsize: 13.0,
                        fontColor: AppColors.onPrimary,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
