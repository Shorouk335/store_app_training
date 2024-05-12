import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/core/utils/extension.dart';
import 'package:store_app/shared/widgets/customtext.dart';

class CartBoxWidget extends StatelessWidget {
  const CartBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 130,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: Color(0xffF7F7F7).withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0),
            border:
                Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5))),
        child: Row(
          children: [
          Image(
            fit: BoxFit.contain,
            image: AssetImage("shose".png()),
          ),
          SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                "منتج 1",
                color: Colors.black87,
                fontsize: 18.0,
              ),
              CustomText(
                "170.00 ر.س",
                color: Colors.black,
                weight: FontWeight.bold,
                fontsize: 16.0,
              ),
            ],
          ),
          Spacer(),
          Container(
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                    width: 1.0, color: Colors.grey.withOpacity(0.5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 1.0, color: Colors.grey.withOpacity(0.5)),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 15.0,
                  ),
                ),
                CustomText(
                  "1",
                  color: Colors.black,
                  fontsize: 18.0,
               
                ),
                Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1.0, color: Colors.grey.withOpacity(0.5))),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Icon(
                      Icons.minimize,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
