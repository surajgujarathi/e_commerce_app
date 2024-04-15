import 'package:e_commerce_app/features/screens/signup/signup_controller.dart';
import 'package:e_commerce_app/features/screens/signup/widgets/terms_condtions.dart';
import 'package:e_commerce_app/utils/theme/constants/sizes.dart';
import 'package:e_commerce_app/utils/theme/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/theme/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupformKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>
                      TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: Tsized.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      TValidator.validateEmptyText('last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptyText('user name', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.userName,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.phonenumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidepassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidepassword.value =
                          !controller.hidepassword.value,
                      icon: Icon(controller.hidepassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: Tsized.spaceBtwSections,
          ),

          ///terms and conditions
          const TTermsConditionCheckBox(),
          const SizedBox(
            height: Tsized.spaceBtwSections,
          ),

          //signupbutton
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount)),
          )
        ],
      ),
    );
  }
}
