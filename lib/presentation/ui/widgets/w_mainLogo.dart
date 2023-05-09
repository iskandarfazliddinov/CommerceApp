import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WMainLogo extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;

  const WMainLogo(this.icon,this.title,this.subTitle,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: SvgPicture.asset(
              icon,
              width: 90,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: Styles.getOnBoardingTitle().copyWith(fontSize: 32),
            ),
          ),
          Text(
            subTitle,
            style: Styles.getOnBoardingSubTitle(),
          ),
        ],
      ),
    );
  }
}

