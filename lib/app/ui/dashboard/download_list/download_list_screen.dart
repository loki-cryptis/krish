import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krish/app/ui/dashboard/download_list/download_list_controller.dart';
import 'package:krish/app/ui/profile/profile_controller.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/custom_widgets/gradient_background_screen.dart';
import 'package:krish/app/utils/custom_widgets/text_styles_constants.dart';


class DownloadListScreen extends StatefulWidget {
  const DownloadListScreen({super.key});

  @override
  State<DownloadListScreen> createState() => _DownloadListScreenState();
}

class _DownloadListScreenState extends State<DownloadListScreen> {
  final favoriteController = Get.put(DownloadListController());
  final profileController = Get.put(ProfileController());
  bool isEditMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(!profileController.isFromProfile){
      profileController.isFromProfile = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScreenBackground(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: isEditMode ?  AppColors.pistachio : AppColors.transparent,
          leading: isEditMode
              ? IconButton(
            onPressed: () {
              setState(() {
                isEditMode = false;
              });
            },
            icon: Icon(Icons.close, color: AppColors.white, size: 24),
          )
              : profileController.isFromProfile ?  IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 24),
          ) : SizedBox(),
          title: Text(
            isEditMode ? StringConstants.EDIT : StringConstants.FAVORITE_LIST,
            style: TextStylesConstants.textWhiteBold(18),
          ),
          centerTitle: true,
          actions: [
            if (!isEditMode)
              IconButton(
                onPressed: () {
                  setState(() {
                    isEditMode = true;
                  });
                },
                icon: Icon(Icons.edit, color: AppColors.white, size: 24),
              ),
          ],
        ),
        body: Container(),
      ),
    );
  }

}