import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/utils/extension.dart';
import 'package:store_app/modules/home/presentation/widget/categoryBoxWidget.dart';
import 'package:store_app/modules/home/presentation/widget/homeMainBox.dart';
import 'package:store_app/modules/home/presentation/widget/itemCardBox.dart';
import 'package:store_app/modules/layout/cubit/cubit.dart';
import 'package:store_app/modules/layout/cubit/states.dart';
import 'package:store_app/shared/widgets/custom_appbar.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/defult_button.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
           
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(

            horizontal: 20.0,
          ),
          child: CustomScrollView(
            slivers: [
              SizedBox(
                height: 15.0,
              ).toBoxAdApter(),
              HomeMainBoxWidget().toBoxAdApter(),
              SizedBox(
                height: 15.0,
              ).toBoxAdApter(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryBoxWidget(
                    title: "men".tr(),
                    icon: "man",
                  ),
                  CategoryBoxWidget(
                    title: "womens".tr(),
                    icon: "women",
                  ),
                  CategoryBoxWidget(
                    title: "children".tr(),
                    icon: "baby",
                  ),
                  CategoryBoxWidget(
                    title: "discont".tr(),
                    icon: "setting",
                  ),
                ],
              ).toBoxAdApter(),
              SizedBox(
                height: 25.0,
              ).toBoxAdApter(),
              Row(
                children: [
                  CustomText(
                    "last_version".tr(),
                    color: Colors.black,
                    fontsize: 22.0,
                  ),
                  Spacer(),
                  DefaultButton(
                    text: "more_item".tr(),
                    size: Size(120, 50),
                    fontSize: 12,
                  ),
                ],
              ).toBoxAdApter(),
              SizedBox(
                height: 15.0,
              ).toBoxAdApter(),
              Container(
                  height: 300,
                  color: Color(0xffF7F7F7),
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ItemCardBoxWidget();
                      })).toBoxAdApter(),
            ],
          ),
        );
      },
    );
  }
}

