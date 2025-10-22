import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:krish/app/utils/all_constants/store_data_constants.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/common_functions.dart';
import 'package:krish/app/utils/storage_service.dart';


class DownloadListController extends GetxController {

  final commonFunctions = CommonFunctions();
  final storageService = StorageService();
  final dio = Get.find<Dio>();
  var token;
  var isEditMode = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyList();
    // addToFavorite();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getMyList () async {
    isLoading.value = true;
    token = await storageService.readString(StoreDataConstants.TOKEN);
    try {

    } catch(e){
      commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.SOME_THING_WRONG);
    }finally{
      isLoading.value = false;
    }
  }


}