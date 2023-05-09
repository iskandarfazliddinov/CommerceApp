import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/widgets/w_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WProductItem extends StatelessWidget {
  GestureTapCallback onTab;
  final int index;

  WProductItem({
    Key? key,
    required this.onTab,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
            child: Hero(
              tag: "product_$index",
              child: Image.asset(
                AppIcons.watch,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const WStars(mark: 3),
          const SizedBox(height: 8),
          Text(
            "Smart Watch",
            style: Styles.getLabelStyle(),
          ),
          const SizedBox(height: 6),
          Text(
            "\$120.00",
            style: Styles.getPriceStyle(),
          ),
        ],
      ),
    );
  }
}
