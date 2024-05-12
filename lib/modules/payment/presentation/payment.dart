import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/core/utils/extension.dart';
import 'package:store_app/shared/widgets/custom_appbar.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/defult_button.dart';
import 'package:store_app/shared/widgets/svgIcon.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool? checkBox1 = false;
  bool? checkBox2 = false;

  checkColor(){
    if(checkBox1 == true || checkBox2 == true ){
      return true  ; 
    } else {
      return false ; 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                "payment_rap".tr(),
                color: AppColors.primary,
                fontsize: 18.0,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomText(
                "محمد احمد محمود",
                color: AppColors.primary,
                fontsize: 18.0,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 5.0,
              ),
              CustomText(
                "المنصورة 22 حي الجامعه, الشارع الرئيسي",
                color: Colors.grey,
                fontsize: 18.0,
                weight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      activeColor: AppColors.primary,
                      side: BorderSide(width: 2, color: Colors.grey),
                      value: checkBox1,
                      onChanged: (s) {
                        setState(() {
                          checkBox1 = s;
                        });
                      }),
                  SvgIcon(
                    svg: "card",
                    size: 40.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  CustomText(
                    "كريديت كارد",
                    color: Colors.grey,
                    fontsize: 18.0,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      activeColor: AppColors.primary,
                      side: BorderSide(width: 2, color: Colors.grey),
                      value: checkBox2,
                      onChanged: (s) {
                        setState(() {
                          checkBox2 = s;
                        });
                      }),
                  SizedBox(
                    width: 5.0,
                  ),
                  CustomText(
                    " كاش عند التوصيل",
                    color: Colors.grey,
                    fontsize: 18.0,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  CustomText(
                    "total".tr(),
                    color: Colors.black,
                    fontsize: 18.0,
                  ),
                  Spacer(),
                  CustomText(
                    "340.00  ر . س",
                    color: Colors.black,
                    fontsize: 18.0,
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: DefaultButton(
                        onTap: () {
                          NavigationService.pushNamed(
                              AppRouter.paymentStepRoute);
                        },
                        padding: EdgeInsets.zero,
                        text: "payment".tr(),
                        color:  checkColor() ? AppColors.primary : Colors.grey.withOpacity(0.5) ,
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
                        color: checkColor() ? AppColors.primary : Colors.grey.withOpacity(0.5),
                        borderRadius: 20.0,
                        fontColor: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
