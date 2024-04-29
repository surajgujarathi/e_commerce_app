import 'package:e_commerce_app/features/screens/product_details/product_reviews/product_details.dart';
import 'package:e_commerce_app/features/screens/signup/signup.dart';
import 'package:e_commerce_app/features/screens/signup/verify_email.dart';
import 'package:e_commerce_app/features/screens/store/store.dart';
import 'package:e_commerce_app/features/screens/wishlist/wishlist.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:get/get.dart';

import '../features/aunthentication/screens/widgets/onboarding.dart';
import '../features/screens/address/address.dart';
import '../features/screens/cart/cart.dart';
import '../features/screens/checkout/checkout.dart';
import '../features/screens/home/widgets/home.dart';
import '../features/screens/login/widgets/login.dart';
import '../features/screens/order/order.dart';
import '../features/screens/password_configurations/forgetpassword.dart';
import '../features/screens/profile/profile.dart';
import '../features/screens/settings/setting.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),

    GetPage(name: TRoutes.store, page: () => const Store()),

    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),

    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),

    GetPage(
        name: TRoutes.productReviews, page: () => const ProductReviewScreen()),

    GetPage(name: TRoutes.order, page: () => const OrderScreen()),

    GetPage(name: TRoutes.checkout, page: () => const CheckOutScreen()),

    GetPage(name: TRoutes.cart, page: () => const CartScreen()),

    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),

    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),

    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),

    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),

    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),

    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),

    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),

// Add more GetPage entries as needed
  ];
}
