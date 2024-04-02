import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:flutter/material.dart';

class TShadowStyle {
  static final veticalProductionShadow = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2));

  static final HorizontalProductionShadow = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: Offset(0, 2));
}
