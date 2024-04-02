import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageurl,
    this.applyImageradius = true,
    this.backgroundcolor = TColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkimage = false,
    this.onpressed,
    this.border,
    this.borderRadius = Tsized.md,
  });
  final double? width, height;
  final String imageurl;
  final bool applyImageradius;
  final BoxBorder? border;
  final Color backgroundcolor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkimage;
  final VoidCallback? onpressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageradius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
              image: isNetworkimage
                  ? NetworkImage(imageurl)
                  : AssetImage(imageurl) as ImageProvider,
              fit: fit),
        ),
      ),
    );
  }
}
