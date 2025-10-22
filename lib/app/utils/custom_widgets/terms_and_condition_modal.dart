import 'package:flutter/material.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';


class TermsAndConditionsPopup extends StatelessWidget {
  final Function(bool) onAccept;

  const TermsAndConditionsPopup({
    Key? key,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(15),
      title: Text(
         StringConstants.TERMS_AND_CONDITIONS,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSectionTitle(StringConstants.INFO_SHARING),
            Text(
             StringConstants.INFO_SHARING_DETAILS
            ),
            _buildBulletPoint('User ID:', StringConstants.USER_ID_CONTENT),
            _buildBulletPoint('Cell Phone Number:', StringConstants.PHONE_NO_CONTENT),
            _buildBulletPoint('Google Location:', StringConstants.GOOGLE_LOC_CONTENT),

            SizedBox(height: 16),
            _buildSectionTitle(StringConstants.DATA_USAGE),
            Text(
             StringConstants.DATA_USAGE_DETAILS,
            ),
            _buildBulletPoint('', StringConstants.DATA_USAGE_PT1),
            _buildBulletPoint('', StringConstants.DATA_USAGE_PT2),
            _buildBulletPoint('', StringConstants.DATA_USAGE_PT3),

            SizedBox(height: 16),
            _buildSectionTitle(StringConstants.USER_CONSENT),
            Text(
              StringConstants.USER_CONSENT_DETAILS
            ),

            SizedBox(height: 16),
            _buildSectionTitle(StringConstants.CHANGE_IN_TERMS),
            Text(
                StringConstants.CHANGE_IN_TERMS_DETAILS
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Close',
            style: TextStyle(color: AppColors.black),
          ),
        ),
        // TextButton(
        //   onPressed: () {
        //     onAccept(true);
        //     Navigator.of(context).pop();
        //   },
        //   child: Text(
        //     'Accept',
        //     style: TextStyle(color: SanthiColors.colorApp, fontWeight: FontWeight.bold),
        //   ),
        // ),
      ],
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  // Helper method to build bullet points
  Widget _buildBulletPoint(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• '),
          Expanded(
            child: Builder(
                builder: (context) {
                  return RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        if (title.isNotEmpty)
                          TextSpan(
                            text: '$title ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        TextSpan(text: content),
                      ],
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }

  // Static method to show the dialog
  static void show(BuildContext context, Function(bool) onAccept) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TermsAndConditionsPopup(onAccept: onAccept);
      },
    );
  }
}