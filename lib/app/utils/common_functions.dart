import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:krish/app/api_calls/api_service.dart';
import 'package:krish/app/beans/response_pojo/ErrorResponse.dart';
import 'package:krish/app/ui/auth/signIn/sign_in_screen.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/store_data_constants.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/data_map_service.dart';
import 'package:krish/app/utils/loader_dialog.dart';
import 'package:krish/app/utils/storage_service.dart'; // for kIsWeb


class CommonFunctions {
  final dataMapService = DataMapService();
  final storageService = StorageService();
  late Dio dio;
  late ApiService apiClient;
  var box = GetStorage();

  currencyNumberFormat(amount) {
    var formattedAmount = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
    ).format(amount);
    return formattedAmount;
  }

  void showLoader() {
    Get.dialog(LoaderDialog());
  }

  void hideLoader() {
    Get.back();
  }

  void apiErrorCode(ErrorResponse responseData) {
    if (responseData.code == 401) {
      logoutCall();
    } else {
      final errorMessage = responseData.message ?? StringConstants.SOME_THING_WRONG;
      showSnackBar(StringConstants.APP_NAME, errorMessage);
    }
  }

  logoutCall() async {
    var box = GetStorage();
    final storageService = StorageService();
    // await storageService.remove(StoreDataConstants.TOKEN);
    box.erase();
    await GetStorage().erase();
    Get.offAll(() => SignInScreen());
  }
void saveUserData(var responseData) {
  final userData = responseData.data;

  final consumerName = userData?.consumerName ?? "";
  // final fullName = userData?.fullName ?? "";
  // final phone = userData?.phone ?? "";
  // final subscribed = userData?.subscribed ?? false;

  storageService.saveString(StoreDataConstants.USER_NAME, consumerName);
}

  showSnackBar(String title, String msg) {
    return Get.snackbar(title, msg,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        colorText: AppColors.black,
        backgroundColor: AppColors.white);
  }

  Future<Map<String, dynamic>> getDeviceDetails() async {
    String deviceId = 'unknown';
    bool isMobile = true;

    try {
      final deviceInfo = DeviceInfoPlugin();

      if (kIsWeb) {
        deviceId = getWebDeviceId();
        isMobile = false;
      } else if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? 'unknown';
      } else {
        isMobile = false;
      }
    } catch (e) {
      print("Device info error: $e");
    }

    return {
      'deviceId': deviceId,
      'isMobile': isMobile,
    };
  }

  getWebDeviceId() {
    // final userAgent = html.window.navigator.userAgent;
    // final platform = html.window.navigator.platform ?? 'unknown';
    // final browserInfo = html.window.navigator.appVersion ?? 'unknown';
    //
    // String deviceId = "$platform|$browserInfo|$userAgent";
    // return deviceId.length > 100 ? deviceId.substring(0, 100) : deviceId;
  }

  String getNameByRole(int?role){
    if(role == 1){
      return 'Master Admin';
    }else if(role == 2){
      return 'Super Admin';
    }else{
      return 'Local Admin';
    }
  }

  Color getColorForRole(int? role) {
    if (role == 2) {
      return AppColors.sun;
    } else if (role == 3) {
      return AppColors.studio;
    } else {
      return AppColors.persianRed;
    }
  }
}
