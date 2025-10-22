import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krish/app/ui/dashboard/download_list/download_list_screen.dart';
import 'package:krish/app/ui/dashboard/home_screen/home_controller.dart';
import 'package:krish/app/ui/dashboard/home_screen/home_screen.dart';
import 'package:krish/app/ui/dashboard/live_stream_screen/live_stream_screen.dart';
import 'package:krish/app/ui/dashboard/sports_screen/sports_screen.dart';
import 'package:krish/app/ui/profile/profile_screen.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/custom_widgets/gradient_background_screen.dart';


class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;
  final homeController = Get.put(HomeController());

  final List<Widget> _screens = [
    const HomeScreen(),
    const SportsScreen(),
    const LiveStreamScreen(),
    const DownloadListScreen(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScreenBackground(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              decoration: BoxDecoration(
                gradient:  LinearGradient(
                  colors: [AppColors.pistachio,AppColors.pistachio],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onTabTapped,
                backgroundColor: AppColors.transparent,
                selectedItemColor:AppColors.white,
                unselectedItemColor: AppColors.white,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                unselectedLabelStyle: const TextStyle(fontSize: 12),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: StringConstants.HOME,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports),
                    label: StringConstants.SPORTS,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.live_tv),
                    label: StringConstants.LIVE,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.download),
                    label: StringConstants.MY_LIST,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person),
                    label: StringConstants.PROFILE,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
