import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyle {
  static EdgeInsetsGeometry paddingwithappbarHeight = const EdgeInsets.only(
    top: Tsized.appbarHeight,
    left: Tsized.defaultSpace,
    bottom: Tsized.defaultSpace,
    right: Tsized.defaultSpace,
  );
}
