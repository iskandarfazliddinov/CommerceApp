import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class WBrandName extends StatelessWidget {
  final double fontSize;

  const WBrandName({
    Key? key,
    this.fontSize = 38,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: "Swip",
          children: [
            TextSpan(
              text: "wide",
              style: Styles.getLogoTextStyle().copyWith(
                color: AppColors.black,
                fontSize: fontSize,
              ),
            ),
          ],
          style: Styles.getLogoTextStyle().copyWith(fontSize: fontSize)),
    );
  }
}
