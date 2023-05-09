import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/login/login_screen.dart';
import 'package:commerce_app/presentation/ui/screens/onboarding/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;
  double screenWith = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWith = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getDots(onboardingData.length, page),
          ),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                if (page != onboardingData.length - 1) {
                  setState(() {
                    page++;
                    controller.animateToPage(
                      page,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  });
                } else {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 30, top: 30),
                child: Text(
                  "Next",
                  style: Styles.getTextActionStyles(),
                ),
              ),
            ),
            _getSpace(),
            SizedBox(
              height: screenHeight*0.7,
              child: PageView(
                controller: controller,
                onPageChanged: (int index) {
                  setState(() {
                    page = index;
                  });
                },
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  onboardingData.length,
                  (index) => _getPage(
                    onboardingData[index],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.06,
            )
          ],
        ),
      ),
    );
  }

  _getPage(OnboardingData data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              data.image,
              width: screenWith * 0.8,
            ),
            _getSpace(),
            Text(
              data.title,
              style: Styles.getOnBoardingTitle(),
            ),
            const SizedBox(height: 24),
            Text(
              data.subtitle,
              textAlign: TextAlign.center,
              style: Styles.getOnBoardingSubTitle(),
            ),
          ],
        ),
      );

  _getSpace() => SizedBox(height: screenHeight * 0.08);
}

_getDots(int n, int activeIndex) => List.generate(
      n,
      (index) {
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == activeIndex
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        );
      },
    );
