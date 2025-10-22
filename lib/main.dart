import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krish/app/routes/app_pages.dart';
import 'package:krish/app/routes/app_routes.dart';
import 'package:krish/app/ui/splash/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/network_connection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<Dio>(Dio());

  // Lock portrait orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: AppColors.pistachio,
  ));

  NetworkConnection().initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget builds(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
        primaryColor: AppColors.black,
        primaryColorDark: AppColors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
    );
  }
}
