import 'package:flutter/material.dart';
import '../../core/theme/dynamic_theme/colors.dart';
import 'customtext.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      this.color,
      this.shape,
      required this.text,
      this.onTap,
      this.padding,
      this.icon,
      this.fontColor,
      this.size,
      this.weight,
      this.fontSize , 
      this.borderRadius , 
      })
      : super(key: key);
  final Color? color;
  final Color? fontColor;
  final OutlinedBorder? shape;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final Widget? icon;
  final Size? size;
  final FontWeight? weight;
  final double? fontSize;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15.0),
      child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
              size ?? Size(double.infinity, 60),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              color ?? AppColors.primary,
            ),
            shadowColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
             
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(  borderRadius ?? 10.0),
              ),
            ),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (icon != null) icon!,
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text,
                textStyleEnum: TextStyleEnum.caption,
                weight: weight ?? FontWeight.bold,
                fontsize: fontSize ?? 20,
                color: fontColor ?? Colors.white,
              ),
            ],
          )),
    );
  }
}

class DefaultButtonOutLined extends StatelessWidget {
  const DefaultButtonOutLined({
    Key? key,
    this.color,
    this.shape,
    required this.text,
    this.onTap,
    this.style,
    this.padding,
    this.icon,
    this.fontColor,
    this.size,
    this.fontsize,
    this.weight,
    this.borderRadius
  }) : super(key: key);
  final Color? color;
  final Color? fontColor;
  final OutlinedBorder? shape;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final TextStyle? style;
  final IconData? icon;
  final Size? size;
  final double? fontsize;
  final FontWeight? weight;
  final double? borderRadius ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15),
      child: OutlinedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
              size ?? Size(double.infinity, 60),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.background,
            ),
            foregroundColor: MaterialStateProperty.all<Color?>(
              fontColor ?? Colors.white,
            ),
            side: MaterialStateProperty.all<BorderSide?>(
                BorderSide(color: color ?? AppColors.primaryContainer , width: 2.0)),
            shadowColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( borderRadius ?? 8.0),
              ),
            ),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text,
                style: style,
                textStyleEnum: TextStyleEnum.caption,
                weight: weight ?? FontWeight.w500,
                color: color ?? AppColors.primaryContainer,
                fontsize: fontsize ?? 20,
              ),
            ],
          )),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    Key? key,
    this.color,
    this.iconColor,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final Color? color;
  final Color? iconColor;
  final VoidCallback? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: color ?? AppColors.primary,
      child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              icon,
              size: 15,
              color: iconColor ?? Colors.white,
            ),
          )),
    );
  }
}

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
      
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 25.0,
        ),
      ),
    );

    // Container(
    //     width: 60,
    //     height: 60,
    //     child: Card(
    //       shape: CircleBorder(),
    //       elevation: 8,
    //       child: InkWell(
    //         onTap: onTap,
    //         child: Padding(
    //           padding: const EdgeInsets.only( left: 8.0, ),
    //           child: Icon(
    //                 Icons.arrow_back_ios,
    //                 color: AppColors.primaryContainer,
    //                 size: 25.0,
    //                ),
    //         ),
    //       ),
    //         // onPressed: onTap ,
    //     ),
    //   );
  
  
  }
}

class MyTextButton extends StatelessWidget {
  MyTextButton({
    super.key,
    required this.function,
    required this.text,
    this.color,
    this.size,
  });
  final Function function;
  final String text;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function();
      },
      child: CustomText(text,
          fontsize: size ?? 12,
          color: color ?? AppColors.primary,
          weight: FontWeight.w500
          //  style: TextStyle(color: AppColors.secondary),
          ),
      // style: TextButton.styleFrom(
      //   elevation: 0,
      //   textStyle: TextStyle(
      //     fontWeight: FontWeight.w600,
      //     fontSize: (width <= 550) ? 13 : 17,
      //   ),
      // ),
    );
  }
}
