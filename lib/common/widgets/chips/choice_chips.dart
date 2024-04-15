import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_containers.dart';
import 'package:e_commerce_app/utils/theme/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor
            ? const SizedBox()
            : Text(
                text,
                style: TextStyle(color: dark ? TColors.white : TColors.black),
              ),

        selected: selected,

        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor
            ? TcircularContainer(
                width: 50,
                height: 50,
                backgroundcolor: THelperFunctions.getColor(text)!)
            : null,

        labelPadding: isColor ? const EdgeInsets.all(0) : null,

        // making icon in the centre
        padding: isColor ? const EdgeInsets.all(0) : null,

        backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
        shape: isColor ? const CircleBorder() : null,
      ),
    );
  }
}
