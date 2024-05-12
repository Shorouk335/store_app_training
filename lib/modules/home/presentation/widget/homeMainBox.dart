import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/core/utils/extension.dart';
import 'package:store_app/modules/layout/cubit/cubit.dart';
import 'package:store_app/modules/layout/cubit/states.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/textFormField.dart';

import '../../../../shared/widgets/defult_button.dart';

class HomeMainBoxWidget extends StatefulWidget {
  const HomeMainBoxWidget({super.key});

  @override
  State<HomeMainBoxWidget> createState() => _HomeMainBoxWidgetState();
}

class _HomeMainBoxWidgetState extends State<HomeMainBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);
        return Container(
            height: 280 ,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          cubit.changeTabController(5);
                        },
                        child: DefultTextFormField(
                          contentPadding: EdgeInsets.all(20.0),
                          isEnable: false,
                          fillColor: Colors.white,
                          isFilledColor: true,
                          prefix: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintColor: Colors.grey,
                          hintText: "search".tr(),
                        ),
                      )),
                      SizedBox(
                        width: 30.0,
                      ),
                      InkWell(
                        onTap: () {
                          cubit.openCameraToFindProduct();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0) , 
                        color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 110.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0) , 
                        color: Colors.grey.withOpacity(0.5)
                      ),
                            child: Image(
                              fit: BoxFit.contain,
                              image: AssetImage("shose".png() ),
                            ),
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                "most_salary".tr(),
                                color: Colors.black,
                                weight: FontWeight.bold,
                                fontsize: 18.0,
                              ),
                              CustomText(
                                "Air Max 2090",
                                color: Colors.grey,
                                fontsize: 18.0,
                              ),
                              DefaultButton(
                                
                                text: "buy_now".tr(),
                                size: Size(150, 40),
                                fontSize: 15.0,
                                padding: EdgeInsets.zero 
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
