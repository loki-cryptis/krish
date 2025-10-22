
import 'package:flutter/material.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/custom_widgets/text_styles_constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final double? height;

  const CustomTextField({
    super.key,
    required this.controller,
    this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.height,
    this.onChanged, this.textInputAction, this.labelText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.label.toString(),
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(
          height: widget.height,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: widget.obscureText,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(color: AppColors.black),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: AppColors.doveGray),
              suffixIcon: widget.suffixIcon,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: AppColors.pistachio,),
              ),
              filled: false,
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }

  decoration(String hint) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 2, left: 24),
      focusedErrorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        borderSide: BorderSide(color: AppColors.black,),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        borderSide: BorderSide(color: AppColors.black,),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        borderSide: BorderSide(color: AppColors.black,),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        borderSide: BorderSide(color: AppColors.black,),
      ),
      hintText: hint,
      hintStyle: TextStylesConstants.textStyleBoldHint_15,
      filled: true,
      fillColor: AppColors.black,
    );
  }

  decorationPassword(String hint,bool passwordVisible) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 15, left: 24, bottom: 0),
      focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          borderSide: BorderSide(color: AppColors.black,)),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        borderSide: BorderSide(color: AppColors.black,),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        borderSide: BorderSide(color: AppColors.black,),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        borderSide: BorderSide(color: AppColors.black,),
      ),
      hintText: hint,
      hintStyle: TextStylesConstants.textStyleBoldHint_15,
      filled: true,
      fillColor: AppColors.black,
      suffixIcon: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
        child: Icon(
          passwordVisible ? Icons.visibility_off : Icons.visibility,
        ),
      ),

    );
  }
}