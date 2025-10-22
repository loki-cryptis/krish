import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:krish/app/utils/app_navigation.dart';
import 'package:krish/app/utils/common_functions.dart';
import 'package:krish/app/utils/storage_service.dart';


class HomeController extends GetxController {
  var storageService = StorageService();
  var appNavigation = AppNavigation();
  final commonFunctions = CommonFunctions();
  final dio = Get.find<Dio>();
  var token;
  late BuildContext context;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


}
