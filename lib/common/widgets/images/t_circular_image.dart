import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = Tsized.sm,
    this.overlaycolor,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final Color? overlaycolor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        //if image background color is null then swith it to light and dark mode color design
        color: backgroundColor ??
            (THelperFunctions.isDarkmode(context)
                ? TColors.white
                : TColors.black),

        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(TImages.product3) as ImageProvider,
          color: overlaycolor,
        ),
      ),
    );
  }
}
