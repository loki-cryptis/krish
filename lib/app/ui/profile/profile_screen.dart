import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krish/app/ui/profile/profile_controller.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/app_navigation.dart';
import 'package:krish/app/utils/common_functions.dart';
import 'package:krish/app/utils/custom_widgets/gradient_background_screen.dart';
import 'package:krish/app/utils/custom_widgets/text_styles_constants.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final appNavigation = AppNavigation();
  final commonFunctions = CommonFunctions();

  @override
  Widget build(BuildContext context) {
    return GradientScreenBackground(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          title: Text(
            StringConstants.PROFILE,
            style: TextStylesConstants.textWhiteBold(24),
          ),
          centerTitle: true,
          
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.white.withOpacity(0.03),
            AppColors.white.withOpacity(0.01),
          ],
        ),
        border: Border.all(
          color: AppColors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        children: [

        ],
      )
    );
  }

  
}