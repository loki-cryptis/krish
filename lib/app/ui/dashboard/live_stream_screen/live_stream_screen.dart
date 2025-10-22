import 'package:flutter/material.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/custom_widgets/gradient_background_screen.dart';
import 'package:krish/app/utils/custom_widgets/text_styles_constants.dart';


class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  @override
  Widget build(BuildContext context) {
    return GradientScreenBackground(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: Center(
          child: Container(
            child: Text('Live Stream section coming soon',style: TextStylesConstants.textStyleBoldWhite_18,),
          ),
        ),
      ),
    );
  }
}
