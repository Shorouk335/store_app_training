import 'package:flutter/material.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/core/utils/extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.0,
      leadingWidth: 100,
      leading: InkWell(
        onTap: () {
          // NavigationService.pushNamed(AppRouter.home1Route);
        },
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage("LOGO".png()),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            onTap: () {
              // NavigationService.pushNamed(AppRouter.settingRoute);
            },
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.primary,
              size: 25.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80.0);
}
