import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/custom_widgets/gradient_button.dart';
import 'sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPasswordVisible = false.obs;

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: Obx(
            () => Stack(
          children: [
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06, // 6% of screen width
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.05), // 5% of screen height

                        // Logo with responsive sizing
                        Image.asset(
                          'images/app_logo.png',
                          height: screenHeight * 0.3, // 25% of screen height
                        ),

                        SizedBox(height: screenHeight * 0.03), // 3% spacing

                        // Email field
                        buildInputField(
                            label: StringConstants.EMAIL,
                            controller: controller.emailTextController,
                            hint: StringConstants.EMAIL_ADDRESS,
                            action: TextInputAction.next
                        ),

                        SizedBox(height: screenHeight * 0.025), // 2.5% spacing

                        // Password field with working eye icon
                        Obx(() => buildInputField(
                          label: StringConstants.PASSWORD,
                          controller: controller.passwordTextController,
                          hint: StringConstants.PASSWORD,
                          obscure: !isPasswordVisible.value,
                          action: TextInputAction.done,
                          isPassword: true,
                          onToggleVisibility: () => isPasswordVisible.toggle(),
                        )),

                        SizedBox(height: screenHeight * 0.04), // 4% spacing

                        // Login button
                        GradientButton(
                          text: StringConstants.LOGIN,
                          onPressed: controller.loginValidation,
                        ),

                        SizedBox(height: screenHeight * 0.03), // 3% spacing

                        // Forgot password button
                        TextButton(
                          onPressed: (){},
                          child: const Text(
                            StringConstants.FORGOT_PASSWORD,
                            style: TextStyle(
                              color: AppColors.pistachio,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

                        // Sign up button
                        TextButton(
                          onPressed: (){},
                          child: const Text(
                            StringConstants.NO_ACCOUNT,
                            style: TextStyle(
                              color: AppColors.pistachio,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

                        // Flexible spacer to push content up when needed
                        const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Loading indicator
            if (controller.isLoading.value)
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    required TextInputAction action,
    bool isPassword = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.pistachio)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.white,
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
                color: AppColors.pistachio,
              ),
              onPressed: onToggleVisibility,
            )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.mediumPurple),
            ),
          ),
          textInputAction: action,
        ),
      ],
    );
  }
}