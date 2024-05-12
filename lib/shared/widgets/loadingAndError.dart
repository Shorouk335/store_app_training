import 'package:flutter/material.dart';
import 'package:store_app/shared/widgets/showSmartDialog.dart';
import '../../core/theme/dynamic_theme/colors.dart';

class LoadingAndError extends StatelessWidget {
  const LoadingAndError(
      {Key? key,
      required this.isError,
      required this.isLoading,
      required this.child,
      this.loadingWidget,
      this.errorWidget})
      : super(key: key);
  final bool isError;
  final bool isLoading;
  final Widget child;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (
      context,
    ) {
      if (isError) {
        return Center(
          child: errorWidget ??
              Text(
                'يوجد مشكله فى البيانات',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.primary,
                ),
              ),
        );
      } else if (isLoading) {
        return loadingWidget ?? ShowSmartDialog.loadingWidget();
      } else {
        return child;
      }
    });
  }
}
