import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';

class CategoryData {
  final String text;
  final String icon;

  const CategoryData({
    required this.text,
    required this.icon,
  });
}

List<CategoryData> categories = const [
  CategoryData(text: "Clothes", icon: AppIcons.logClothes),
  CategoryData(text: "Laptop", icon: AppIcons.logLaptop),
  CategoryData(text: "Bag", icon: AppIcons.logoBag),
  CategoryData(text: "Shoes", icon: AppIcons.logShoes),
];
