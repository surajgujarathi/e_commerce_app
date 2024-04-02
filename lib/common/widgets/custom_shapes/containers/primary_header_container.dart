import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:flutter/material.dart';

import 'circular_containers.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,

          ///if sizes.isfinite:is  ot true.in stack
          child: Stack(
            children: [
              ///background custom shapes
              Positioned(
                  top: -150,
                  right: -250,
                  child: TcircularContainer(
                      backgroundcolor: TColors.white.withOpacity(0.1))),

              Positioned(
                  top: 100,
                  right: -300,
                  child: TcircularContainer(
                      backgroundcolor: TColors.white.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
