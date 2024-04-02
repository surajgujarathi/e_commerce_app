import 'package:e_commerce_app/utils/theme/constants/image_strings.dart';
import 'package:flutter/widgets.dart';

import '../../../../common/widgets/image_texts_widgets/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageText(
              image: TImages.sneakers,
              title: 'Shoes',
              onTap: () {},
            );
          }),
    );
  }
}
