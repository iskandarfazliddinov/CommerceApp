import 'package:commerce_app/presentation/ui/resources/app_images.dart';

class OnboardingData {
  final String title;
  final String subtitle;
  final String image;

  const OnboardingData(
      {required this.title, required this.subtitle, required this.image});
}

List<OnboardingData> onboardingData = const[
  OnboardingData(
    title: "Discover New Products",
    subtitle:
    "Many new products are discovered by people simply happening upon them while being out and about in the world.",
    image: AppImages.onBoarding1,
  ),
  OnboardingData(
    title: "Earn Points For Shopping",
    subtitle:
    "Many new products are discovered by people simply happening upon them while being out and about in the world.",
    image: AppImages.onBoarding2,
  ),
  OnboardingData(
    title: "Get Fast Local Delivery",
    subtitle:
    "Many new products are discovered by people simply happening upon them while being out and about in the world.",
    image: AppImages.onBoarding3,
  ),
];
