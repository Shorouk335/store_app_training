import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/core/utils/extension.dart';
import 'package:store_app/modules/layout/cubit/cubit.dart';
import 'package:store_app/modules/layout/cubit/states.dart';
import 'package:store_app/shared/widgets/svgIcon.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);
        return BottomAppBar(
            notchMargin: 50.0,
            elevation: 10,
            height: 80,
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.changeTabController(3);
                      },
                      child: SvgIcon(
                        svg: "Profile",
                        color: cubit.tabController?.index == 3
                            ? AppColors.onPrimary
                            : Colors.grey,
                        size: 28.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.changeTabController(2);
                      },
                      child: SvgIcon(
                        svg: "Chat",
                        color: cubit.tabController?.index == 2
                            ? AppColors.onPrimary
                            : Colors.grey,
                        size: 28.0,
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    InkWell(
                        onTap: () {
                          cubit.changeTabController(1);
                        },
                        child: SvgIcon(
                          svg: "Notification",
                          color: cubit.tabController?.index == 1
                              ? AppColors.onPrimary
                              : Colors.grey,
                          size: 28.0,
                        )),
                    InkWell(
                        onTap: () {
                          cubit.changeTabController(0);
                        },
                        child: SvgIcon(
                          svg: "Home",
                          color: cubit.tabController?.index == 0
                              ? AppColors.onPrimary
                              : Colors.grey,
                          size: 28.0,
                        )),
                  ]),
            ));
      },
    );
  }
}
