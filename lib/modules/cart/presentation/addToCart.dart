import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/core/utils/extension.dart';
import 'package:store_app/modules/cart/presentation/widgets/cartBox.dart';
import 'package:store_app/shared/widgets/custom_appbar.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/textFormField.dart';

import '../../../shared/widgets/defult_button.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox(
             width: double.infinity,
            height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               CustomText(
                 "saved_items".tr(),
                    color: Colors.black,
                    fontsize: 18.0,
                    weight: FontWeight.bold,
               ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomText(
                    "add_items_to_card".tr(),
                    color: Colors.black87,
                    fontsize: 15.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefultTextFormField(
                    fillColor: Color(0xffF7F7F7),
                    isFilledColor: true,
                    prefix: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ) , 
                    hintColor: Colors.grey,
                    hintText: "search".tr(),
                  ) , 
                  SizedBox(
                    height: 10.0,
                  ),
                 Expanded(
                   child: CustomScrollView(
                     slivers: [
                      SliverList.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CartBoxWidget();
                        }) ,
                        SizedBox(
                      height: 15.0,
                    ).toBoxAdApter(),
                    Row(
                      children: [
                        Expanded(
                          child: DefultTextFormField(
                            fillColor: Color(0xffF7F7F7),
                            isFilledColor: true,
                            prefix: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintColor: Colors.grey,
                            hintText: "enter_discount_code".tr(),
                            
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        DefaultButton(
                           padding: EdgeInsets.zero,
                            text: "use".tr(),
                            color: Color(0xffD5DDE0),
                            borderRadius: 25.0,
                            fontSize: 15.0,
                            fontColor: Colors.white),
                      ],
                    ).toBoxAdApter(),
                    SizedBox(
                      height: 15.0,
                    ).toBoxAdApter(),
                    Row(
                      children: [
                        CustomText(
                          "total".tr(),
                          color: Colors.black,
                          fontsize: 18.0,
                        ),
                        Spacer(),
                        CustomText("340.00  ر . س", color: Colors.black , fontsize: 18.0, weight: FontWeight.bold,)
                      ],
                    ).toBoxAdApter(),
                    SizedBox(
                      height: 15.0,
                    ).toBoxAdApter(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: DefaultButton(
                            onTap: (){
                              NavigationService.pushNamed(AppRouter.paymentRapRoute);
                            },
                              padding: EdgeInsets.zero,
                              text: "payment".tr(),
                              color: AppColors.primary,
                              borderRadius: 20.0,
                              fontSize: 15.0,
                              fontColor: Colors.white),
                        ),
                      SizedBox(width: 8.0,) , 
                        Expanded(
                         
                          flex: 1,
                          child: DefaultButtonOutLined(
                            padding: EdgeInsets.zero,
                            fontsize: 15.0,
                              text: "back".tr(),
                              color: AppColors.primary,
                              borderRadius: 20.0,
                              fontColor: Colors.white),
                        ),
                      ],
                    ).toBoxAdApter() ,
                   
                    ],
                   ),
                 )
             ],
          
          ),
        ),
      ),
    );
  }
}
