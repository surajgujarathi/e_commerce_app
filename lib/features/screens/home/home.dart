import 'package:e_commerce_app/utils/theme/constants.dart/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TcircularContainer(
              backgroundcolor: TColors.textWhite.withOpacity(0.1),
            ),
          ],
        ),
      ),
    );
  }
}

class TcircularContainer extends StatelessWidget {
  const TcircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundcolor = TColors.white,
  });
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color? backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.primary,
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 400,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                color: TColors.textWhite.withOpacity(0.1)),
          ),
        ],
      ),
    );
  }
}
