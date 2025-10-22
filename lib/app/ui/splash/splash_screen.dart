import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/custom_widgets/gradient_background_screen.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return GradientScreenBackground(
      child: Scaffold(
        backgroundColor: AppColors.pistachio,
        body: Center(
          child: Image.asset(
            'images/krish.png',
            height: 350,
          ),
        ),
      ),
    );
  }
}
