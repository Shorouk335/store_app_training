import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/modules/cart/presentation/cart.dart';
import 'package:store_app/modules/home/presentation/home.dart';
import 'package:store_app/modules/layout/cubit/cubit.dart';
import 'package:store_app/modules/layout/presentation/widget/bottomTabBarWidget.dart';
import 'package:store_app/modules/search/search.dart';
import 'package:store_app/shared/widgets/custom_appbar.dart';
import 'package:store_app/shared/widgets/svgIcon.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key, this.initialPage = 0});
  final int initialPage;

  @override
  State<LayoutScreen> createState() => LayoutScreenState();
}

class LayoutScreenState extends State<LayoutScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final cubit = LayoutCubit.get(context);
    cubit.tabController =
        TabController(length: 6, vsync: this, initialIndex: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {

    bool isShowKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final cubit = LayoutCubit.get(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: cubit.tabController,
        children: [
          MyHome(),
          MyHome(),
          MyHome(),
          MyHome(),
          CartScreen(),
          SearchScreen()
        ],
      ),
      floatingActionButton: Visibility(
        visible: !isShowKeyBoard,
        child: Container(
          width: 80,
             height: 80,
          child: FloatingActionButton(
            
            shape: CircleBorder(),
            onPressed: () {
              cubit.changeTabController(4);
            },
            backgroundColor: Colors.white,
            child: SvgIcon(
              svg: "store",
              color: AppColors.onPrimary,
              size: 38.0,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomTabBar(),
    );
  }
}

