import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class WCategory extends StatelessWidget {

  final String text;
  final String icon;

  const WCategory({Key? key,required this.icon,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.colorE5,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: Styles.getLabelStyle(),
          ),
        ],
      ),
    );
  }
}
