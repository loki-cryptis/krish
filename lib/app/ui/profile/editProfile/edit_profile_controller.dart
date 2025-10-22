import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:krish/app/ui/profile/profile_controller.dart';
import 'package:krish/app/utils/all_constants/store_data_constants.dart';
import 'package:krish/app/utils/app_navigation.dart';
import 'package:krish/app/utils/common_functions.dart';
import 'package:krish/app/utils/storage_service.dart';

class EditProfileController extends GetxController {
  // Text Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  // Reactive Variables
  var selectedGender = ''.obs;
  var isUpdateEnabled = false.obs;
  var isLoading = false.obs;

  // Gender options
  final List<String> genderOptions = ['Male', 'Female'];
  final commonFunctions = CommonFunctions();
  final storageSession = StorageService();

  // Initial values to track changes
  var initialUsername = '';
  var initialMobile = '';
  var initialGender = '';
  var consumerLoginId = 0;

  final dio = Dio();
  final arguments = Get.arguments;
  final appNavigation = AppNavigation();
  final profileController = Get.put(ProfileController());




  @override
  void onInit() {
    super.onInit();
    _initializeUserData();

    // Add listeners to track changes
    usernameController.addListener(_checkForChanges);
    mobileController.addListener(_checkForChanges);
    ever(selectedGender, (_) => _checkForChanges());
  }

  void _initializeUserData() {
    if (arguments != null && arguments is Map) {
      initialUsername = arguments['username'] ?? '';
      initialMobile = arguments['mobile'] ?? '';
      initialGender = arguments['gender'] ?? '';
      consumerLoginId = arguments['consumerLoginId'] ?? 0;
    } else {}

    usernameController.text = initialUsername;
    mobileController.text = initialMobile;
    selectedGender.value = initialGender.isEmpty ? genderOptions.first : initialGender;
    _checkForChanges();
  }

  void _checkForChanges() {
    bool hasChanges = usernameController.text != initialUsername ||
        mobileController.text != initialMobile ||
        selectedGender.value != initialGender;

    isUpdateEnabled.value = hasChanges &&
        usernameController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        selectedGender.value.isNotEmpty &&
        _isValidMobile(mobileController.text);
  }

  bool _isValidMobile(String mobile) {
    // Basic mobile validation - adjust according to your requirements
    String cleanMobile = mobile.replaceAll(RegExp(r'[^\d+]'), '');
    return cleanMobile.length >= 10 && RegExp(r'^[+]?[0-9]+$').hasMatch(cleanMobile);
  }

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  updateProfile() async {
  }

  void refreshData() {
    _initializeUserData();
  }

  @override
  void onClose() {
    usernameController.dispose();
    mobileController.dispose();
    super.onClose();
  }
}