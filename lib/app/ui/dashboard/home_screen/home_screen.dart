import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krish/app/ui/dashboard/home_screen/home_controller.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';
import 'package:krish/app/utils/all_constants/string_constants.dart';
import 'package:krish/app/utils/app_navigation.dart';
import 'package:krish/app/utils/custom_widgets/gradient_background_screen.dart';
import 'package:krish/app/utils/custom_widgets/text_styles_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _bottomNavIndex = 0;
  final PageController _pageController = PageController();
  final appNavigation = AppNavigation();
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _bottomNavIndex = 0;
  }


  Widget buildBanner() {
    return Column(
      children: [
        SizedBox(
          height: 380,

        ),
        const SizedBox(height: 12),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: []
            )),
      ],
    );
  }

  Widget buildSectionTitle(String title, VoidCallback onSeeAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          TextButton(
            onPressed: onSeeAll,
            child: Text(
              StringConstants.SEE_ALL,
              style: TextStylesConstants.textStyleBoldWhite_12,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMovieCard(movie) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(AppRoutes.movieDetail, arguments: {
        //   'contentId': movie.contentId,
        // });
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                movie.thumbnailUrl ?? '',
                height: 160,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? 'Unknown',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        i < (movie.rating ?? 0).round()
                            ? Icons.star
                            : Icons.star_border,
                        size: 14,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMostViewedSection(String title) {
    return Container();
  }


  @override
  Widget build(BuildContext context) {
    return GradientScreenBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: RefreshIndicator(
          onRefresh: () async {
            // await controller.homeTrendingApi();
            // controller.bannersList();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBanner(),
                const SizedBox(height: 20),
                buildMostViewedSection("Trending Now"),
                const SizedBox(height: 20),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
