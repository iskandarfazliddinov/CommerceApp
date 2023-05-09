import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class WProfMain extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onTab;

  const WProfMain({required this.icon,required this.onTab, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
          child: Center(
            child: Stack(
              children: [
                const SizedBox(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://myhomereview.co/images/3.jpg",
                      ),
                    )),
                Positioned(
                  right: 0,
                  top: 4,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                        border:
                        Border.all(color: Colors.white, width: 4)),
                    child:  GestureDetector(
                      onTap: onTab,
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            "Saul Goodmate",
            style: Styles.getOnBoardingTitle().copyWith(
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Text(
            "saulgo35@gmail.com",
            style: Styles.getOnBoardingSubTitle(),
          ),
        ),
      ],
    );
  }
}
