import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/utils/extension.dart';

class NetworkImagesWidgets extends StatelessWidget {
  const NetworkImagesWidgets(this.url,
      {Key? key, this.fit, this.width, this.height})
      : super(key: key);
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) => Image.asset(
                "LOGO".png(),
                height: height,
                width: width,
                gaplessPlayback: true,
                fit: fit ?? BoxFit.contain,
              ),
          imageUrl: url,
          errorWidget: (context, _, __) => Image.asset(
                "LOGO".png(),
                height: height,
                width: width,
                gaplessPlayback: true,
                fit: fit ?? BoxFit.contain,
              )),
    );
  }
}
