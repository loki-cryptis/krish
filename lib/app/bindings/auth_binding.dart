import 'package:get/get.dart';
import 'package:krish/app/ui/auth/signIn/sign_in_controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
