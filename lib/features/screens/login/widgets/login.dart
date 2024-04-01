import 'package:e_commerce_app/common/styles/spacing_styles.dart';
import 'package:e_commerce_app/common/widgets_login_signup/form_divider.dart';
import 'package:e_commerce_app/common/widgets_login_signup/social_button.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/sizes.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/text_strings.dart';

import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'login_form.dart';
import 'login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkmode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithappbarHeight,
          child: Column(
            children: [
              TLoginHeader(dark: dark),
              TLoginForm(),

              /// Divider
              Form_Divider(
                dividerText: TTexts.orSignInwith.capitalize!,
              ),
              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),

              ///footer
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
