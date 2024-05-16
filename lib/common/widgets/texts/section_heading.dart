import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textcolor,
    this.showActionButtton = true,
    required this.title,
    this.buttonTitle = 'Change',
    this.onPressed,
  });
  final Color? textcolor;
  final bool showActionButtton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textcolor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButtton)
          TextButton(onPressed: onPressed, child: const Text('ViewAll'))
      ],
    );
  }
}
