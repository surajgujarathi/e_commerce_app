import 'package:e_commerce_app/common/widgets_login_signup/form_divider.dart';
import 'package:e_commerce_app/common/widgets_login_signup/social_button.dart';
import 'package:e_commerce_app/features/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/sizes.dart';
import 'package:e_commerce_app/utils/theme/constants.dart/text_strings.dart';
import 'package:e_commerce_app/utils/theme/helpers/helpers_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkmode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),

              ///form
              TSignupForm(),
              const SizedBox(
                height: Tsized.spaceBtwInputFields,
              ),
              //divider

              Form_Divider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: Tsized.spaceBtwInputFields,
              ),
              //social button
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
