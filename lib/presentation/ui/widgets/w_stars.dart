import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_images.dart';

class WStars extends StatelessWidget {
  final int mark;

  const WStars({Key? key, required this.mark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => SvgPicture.asset(
          AppImages.start,
          colorFilter: ColorFilter.mode(
            index <= mark - 1
                ? AppColors.reviewEnabledColor
                : AppColors.reviewDisabledColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
