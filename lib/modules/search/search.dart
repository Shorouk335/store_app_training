import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/defult_button.dart';
import 'package:store_app/shared/widgets/textFormField.dart';

import '../../core/theme/dynamic_theme/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        
        children: [
          DefultTextFormField(
            fillColor: Color(0xffF7F7F7).withOpacity(0.5),
            borderSideColor: AppColors.primary,
            isFilledColor: true,
            prefix: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintColor: Colors.grey,
            hintText: "search".tr(),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              CustomText(
                "last_search".tr(),
                color: AppColors.primary,
                fontsize: 25.0,
              ),
              Spacer(),
              DefaultButtonOutLined(
                padding: EdgeInsets.zero,
                text: "حذف الكل".tr(),
                size: Size(115, 50),
                color: AppColors.primary,
                fontColor: AppColors.primary,
                fontsize: 13,
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context , index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                    "Champion Beachshort",
                    color: AppColors.primary,
                    fontsize: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  ],
                );
            
            
            
              }),
          ),
            
          SizedBox(height: 20,) , 
          
          Row(
                children: [
                
                  Expanded(
                    child: DefaultButton(
                      padding: EdgeInsets.zero,
                      text: "search".tr(),
                      // size: Size(120, 50),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Color(0xffD5DDE0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                
                ],
              ) , 
          SizedBox(height: 30.0,) , 
        ],
      ),
    );
  }
}
