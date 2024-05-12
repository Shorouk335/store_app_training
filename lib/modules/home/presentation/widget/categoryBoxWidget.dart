import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/svgIcon.dart';

class CategoryBoxWidget extends StatelessWidget {
  const CategoryBoxWidget({super.key, required this.icon, required this.title});
  final String? title;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xffCCD1DC)),
            child: SvgIcon(
              svg: icon ?? "",
              color: AppColors.primary,
              size: 35.0,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(title ?? '' , color: Colors.black87, fontsize: 13.0,)
        ]
      ),
    );
  }
}
