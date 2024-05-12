import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/modules/find_product/presentation/FinsProductBottomSheetWidget.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/defult_button.dart';

class FindProductScreen extends StatefulWidget {
  const FindProductScreen({super.key, required this.image});
  final File image;

  @override
  State<FindProductScreen> createState() => _FindProductScreenState();
}

class _FindProductScreenState extends State<FindProductScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(alignment: Alignment.topLeft, children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height - 60.0,
                      child: Image.file(
                        widget.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            NavigationService.pushNamed(AppRouter.layoutRoute);
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ))
                  ]),
                  InkWell(
                    onTap: () {
                       showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return FinsProductBottomSheetWidget();
                            },
                          );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
