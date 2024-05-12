import 'package:flutter/material.dart';
import 'package:store_app/modules/cart/presentation/widgets/cartBox.dart';
import 'package:store_app/shared/widgets/customtext.dart';

class FinsProductBottomSheetWidget extends StatelessWidget {
  const FinsProductBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       clipBehavior: Clip.antiAliasWithSaveLayer,
        width: double.infinity,
        height: MediaQuery.of(context).size.height /1.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: ListView.builder(
         
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 90.0,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.grey.withOpacity(0.5))),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      "items found 3 ",
                      color: Color(0xff97ADB6),
                    ),
                  ],
                );
              } else {
                return CartBoxWidget();
              }
            }));
  }
}
