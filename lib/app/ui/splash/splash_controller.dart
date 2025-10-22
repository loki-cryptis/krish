import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:krish/app/api_calls/api_service.dart';
import 'package:krish/app/beans/response_pojo/ProfileResponse.dart';
import 'package:krish/app/routes/app_routes.dart';
import 'package:krish/app/utils/all_constants/end_points_constants.dart';
import 'package:krish/app/utils/all_constants/store_data_constants.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/common_functions.dart';
import 'package:krish/app/utils/storage_service.dart';


class SplashController extends GetxController {
  final storageService = StorageService();
  final commonFunctions = CommonFunctions();
  late ProfileResponse profileResponse;
  final box = GetStorage();
  final dio = Get.find<Dio>();

  @override
  void onReady() {
    super.onReady();
    _checkAuthentication();
  }

  _checkAuthentication() async {
    final token = await storageService.readString(StoreDataConstants.TOKEN) ?? "";
    await Future.delayed(const Duration(seconds: 2));
    if (token.isEmpty) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      _getProfile(token);
    }
  }

void _getProfile(String token) async {
  try {
    final response = await ApiService(dio).getMyProfile(
      EndPointsConstants.applicationJson, token,
    );
    profileResponse = response;

    if (profileResponse.status == 1 && profileResponse.data != null) {
      commonFunctions.saveUserData(profileResponse);
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
    Get.offAllNamed(AppRoutes.login);
      
      commonFunctions.apiErrorCode(profileResponse.error!);
    }
  } catch (e) {
    commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.SOME_THING_WRONG);
    Get.offAllNamed(AppRoutes.login);
  }
}


}
