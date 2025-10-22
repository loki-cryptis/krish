import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:krish/app/ui/profile/editProfile/edit_profile_controller.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/custom_widgets/gradient_background_screen.dart';
import 'package:krish/app/utils/custom_widgets/text_styles_constants.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  final int? consumerLoginId;
  final String? gender;
  final String? mobile;
  const EditProfileScreen({super.key, this.username, this.consumerLoginId, this.gender, this.mobile});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileController editController = Get.put(EditProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScreenBackground(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 24),
          ),
          title: Text(
            StringConstants.EDIT_PROFILE,
            style: TextStylesConstants.textWhiteBold(24),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}