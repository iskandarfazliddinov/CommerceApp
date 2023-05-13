import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WAppBar extends StatelessWidget {
  const WAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child:  Icon(
          Icons.arrow_back_ios,
          color: AppColors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        SvgPicture.asset(
          AppIcons.wishlist,
          width: 20,
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
