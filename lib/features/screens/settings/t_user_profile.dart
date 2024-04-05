import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../common/widgets/images/t_circular_image.dart';
import '../../../utils/theme/constants/colors.dart';

class TUserProfile extends StatelessWidget {
  const TUserProfile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        image: TImages.profile,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Surajgujarathi',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        'Surajgujarathi99@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
