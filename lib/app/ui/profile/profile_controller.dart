import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:krish/app/api_calls/api_service.dart';
import 'package:krish/app/beans/response_pojo/ProfileResponse.dart';
import 'package:krish/app/utils/all_constants/end_points_constants.dart';
import 'package:krish/app/utils/all_constants/store_data_constants.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/common_functions.dart';
import 'package:krish/app/utils/storage_service.dart';

class ProfileController extends GetxController {
  // Editing state variables
  var isEditing = false.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var mobile = ''.obs;
  var gender = ''.obs;
  var consumerLoginId = 0.obs;
  var hasChanges = false.obs;
  var profileImage = Rx<File?>(null);
  File? originalImage;
  var isProfileUpdated = false.obs;
  var isFromProfile = false;

  // Image picker instance
  final ImagePicker _picker = ImagePicker();
  final commonFunctions = CommonFunctions();
  final storageService = StorageService();
  final dio = Dio();
  late ProfileResponse profileResponse;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final menuItems = [
    {
      'icon': Icons.movie_outlined,
      'title': 'My List',
      'subtitle': 'Movies and shows you want to watch',
      'color': const Color(0xFF667eea),
    },
    {
      'icon': Icons.history,
      'title': 'Watch History',
      'subtitle': 'Recently watched content',
      'color': const Color(0xFFf093fb),
    },
    {
      'icon': Icons.download_for_offline,
      'title': 'Downloads',
      'subtitle': 'Offline content available',
      'color': const Color(0xFF4facfe),
    },
    // {
    //   'icon': Icons.star_rate,
    //   'title': 'My Reviews',
    //   'subtitle': 'Rate and review content',
    //   'color': const Color(0xFF43e97b),
    // },
    {
      'icon': Icons.language,
      'title': 'Languages',
      'subtitle': 'Change your language preferences',
      'color': const Color(0xFFFF6B6B),
    },
    // {
    //   'icon': Icons.notifications_active,
    //   'title': 'Notifications',
    //   'subtitle': 'Manage your notifications',
    //   'color': const Color(0xFF4ECDC4),
    // },
    {
      'icon': Icons.security,
      'title': 'Privacy & Security',
      'subtitle': 'Account security settings',
      'color': const Color(0xFF9B59B6),
    },
    // {
    //   'icon': Icons.help_center,
    //   'title': 'Help & Support',
    //   'subtitle': 'Get help and contact support',
    //   'color': const Color(0xFFFF8C00),
    // },
  ];
  // Pick image from camera or gallery
  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.PROFILE_PIC_UPDATED);
      }
    } catch (e) {
      commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.SOME_THING_WRONG);
    }
  }

  void getProfile() async {
    final token = await storageService.readString(StoreDataConstants.TOKEN) ?? "";
    try {
      final response = await ApiService(dio).getMyProfile(
        EndPointsConstants.applicationJson, token,
      );
      profileResponse = response;
      if (profileResponse.status == 1 && profileResponse.data != null) {
        commonFunctions.saveUserData(profileResponse);
        userName.value = profileResponse.data!.fullName ?? 'User';
        userEmail.value = profileResponse.data!.consumerName ?? '';
        mobile.value = profileResponse.data!.phone ?? '';
        gender.value = profileResponse.data!.gender ?? '';
        consumerLoginId.value = profileResponse.data!.consumerLoginId ?? 0;

      } else {
        commonFunctions.apiErrorCode(profileResponse.error!);
      }
    } catch (e) {
      commonFunctions.showSnackBar(StringConstants.APP_NAME, StringConstants.SOME_THING_WRONG);
    }
  }
}