import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:krish/app/api_calls/api_service.dart';
import 'package:krish/app/beans/request_pojo/SignInRequest.dart';
import 'package:krish/app/routes/app_routes.dart';
import 'package:krish/app/utils/all_constants/end_points_constants.dart';
import 'package:krish/app/utils/all_constants/store_data_constants.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/app_navigation.dart';
import 'package:krish/app/utils/common_functions.dart';
import 'package:krish/app/utils/network_connection.dart';
import 'package:krish/app/utils/storage_service.dart';



class SignInController extends GetxController {
  final storageService = StorageService();
  final appNavigation = AppNavigation();
  final commonFunctions = CommonFunctions();
  final dio = Get.find<Dio>();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  var isLoading = false.obs;
  var isLogInButtonDisabled = true.obs;
  var isPasswordVisble = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailTextController.addListener(validateForm);
    passwordTextController.addListener(validateForm);
  }

  // Add this method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisble.value = !isPasswordVisble.value;
  }

  void validateForm() {
    isLogInButtonDisabled.value = emailTextController.text.isEmpty || passwordTextController.text.length < 4;
  }

  void loginValidation() {
    // Get.toNamed(AppRoutes.otp, arguments: "token");
    if (emailTextController.text.isEmpty) {
      commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.VALID_USER_NAME_EMPTY);
      return;
    }

    if (passwordTextController.text.isEmpty) {
      commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.VALID_PASSWORD_EMPTY);
      return;
    }

    _attemptLogin();
  }



  void _attemptLogin() async {
    if (!NetworkConnection().connected) {
      commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.NO_INTERNET);
      return;
    }


    final request = SignInRequest()
      ..username = emailTextController.text
      ..password = passwordTextController.text;

    isLoading.value = true;

    try {
      final deviceDetails = await CommonFunctions().getDeviceDetails();
      final response = await ApiService(dio).userLogin(EndPointsConstants.applicationJson, deviceDetails['deviceId'] ?? 'unknown', request,);

      if (response.status == 1 && response.data != null) {
        final token = response.data!.token;
        storageService.saveString(StoreDataConstants.TOKEN, token!);
        storageService.saveString(StoreDataConstants.USER_NAME, emailTextController.text);
       // Get.offAllNamed(AppRoutes.otp);
      } else {
        commonFunctions.apiErrorCode(response.error!);
      }
    } catch (e) {
      commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.SOME_THING_WRONG);
    } finally {
      isLoading.value = false;
    }
  }
}
