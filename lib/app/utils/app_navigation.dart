import 'package:get/get.dart';
import 'package:krish/app/ui/auth/signIn/sign_in_screen.dart';


class AppNavigation {

  goToSignInScreen() {
    Get.offAll(() => SignInScreen());
  }

}
