import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/extension.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({Key? key, required this.svg, this.size = 20, this.color})
      : super(key: key);
  final String svg;
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: SvgPicture.asset(
        svg.svg(),
        width: size,
        color: color,
      
      ),
    );
  }
}
