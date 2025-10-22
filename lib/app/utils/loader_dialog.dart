import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';

class LoaderDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
        key: key,
        backgroundColor: Colors.red,
        child: Container(
          width: 120.0,
          height: 66.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        CircularProgressIndicator(color: AppColors.black,),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Please wait...",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: AppColors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

