import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/core/utils/extension.dart';
import 'package:store_app/shared/widgets/custom_appbar.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/defult_button.dart';
import 'package:store_app/shared/widgets/textFormField.dart';

class PaymentStepScreen extends StatefulWidget {
  const PaymentStepScreen({super.key});

  @override
  State<PaymentStepScreen> createState() => _PaymentStepScreenState();
}

class _PaymentStepScreenState extends State<PaymentStepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomText("payment_step".tr()),
              ),
              SizedBox(height: 15.0,) , 
              Image.asset("payment".png()),
              SizedBox(height: 15.0,) , 
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    DefultTextFormField(
                     enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5)
                      ),
                      hintText: "card_number".tr(),
                      hintColor: Colors.black,
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 10,) , 
                    DefultTextFormField(
                     enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5)
                      ),
                      hintText: "name".tr(),
                      hintColor: Colors.black,
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 10,) , 
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DefultTextFormField(
                           enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5)
                      ),
                            hintText: "expiry_month".tr(),
                            hintColor: Colors.black,
                            textStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 2,
                          child: DefultTextFormField(
                            enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5)
                      ),
                            hintText: "expiry_year".tr(),
                            hintColor: Colors.black,
                            textStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,) , 
                    DefultTextFormField(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5)
                      ),
                      hintText: "verification_code".tr(),
                      hintColor: Colors.black,
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 50.0,) , 

                    Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: DefaultButton(
                        onTap: () {
                          NavigationService.pushNamed(
                              AppRouter.sucessPaymentRoute);
                        },
                        padding: EdgeInsets.zero,
                        text: "buy".tr(),
                        color:  AppColors.primary ,
                        borderRadius: 20.0,
                        fontSize: 15.0,
                        fontColor: Colors.white),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: DefaultButtonOutLined(
                        padding: EdgeInsets.zero,
                        fontsize: 15.0,
                        text: "back".tr(),
                        color:AppColors.primary ,
                        borderRadius: 20.0,
                        fontColor: Colors.white),
                  ),
                ],
              ),
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
