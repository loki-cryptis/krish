import 'package:flutter/material.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/custom_widgets/text_styles_constants.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  @override
  final Size preferredSize;
  final GestureTapCallback onBackPressed;
  final GestureTapCallback onPressed;
  final String title;
  final Color color;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.onBackPressed,
    required this.onPressed,
    required this.title,
    required this.color, this.actions,
  })  : preferredSize = const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: color,
      title: Center(child: Text(title, style: TextStylesConstants.textWhiteBold(20), textAlign: TextAlign.center,)),
      leading: IconButton(icon: const Icon(Icons.arrow_back_ios, size: 22.0, color: AppColors.white,), onPressed: onBackPressed,),
      actions: actions != null && actions!.isNotEmpty
          ? actions
          : [const SizedBox(width: 50)],
    );
  }
}


class CustomAppBarWithAction extends StatelessWidget implements PreferredSizeWidget{

  @override
  final Size preferredSize;
  final GestureTapCallback onBackPressed;
  final GestureTapCallback onPressed;
  final String title;
  final Color color;

  const CustomAppBarWithAction({
    super.key,
    required this.onBackPressed,
    required this.onPressed,
    required this.title,
    required this.color,
  })  : preferredSize = const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: color,
      title: Center(child: Text(title, style: TextStylesConstants.textWhiteBold(24), textAlign: TextAlign.center,)),
      // leading: IconButton(icon: const Icon(Icons.arrow_back_ios, size: 22.0, color: MindMapColors.colorBlack100,), onPressed: widget.onBackPressed,),
      actions: [
        Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.white, // Card color
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(icon: const Icon(Icons.logout, size: 24.0, color: AppColors.persianRed,), onPressed: onPressed,)),
        const SizedBox(width: 15),
      ],
    );
  }
}
