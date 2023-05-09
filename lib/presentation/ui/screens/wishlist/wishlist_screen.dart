import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/product/product_screen.dart';
import 'package:commerce_app/presentation/ui/widgets/w_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "WishList Screen",
            style: Styles.getLabelStyle(),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 1),
          child: Container(
            color: const Color(0xFFDEDEDE),
            height: 1,
          ),
        ),
      ),
      body: Padding (
        padding: const EdgeInsets.only(top:16,bottom: 16,left: 24),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 260,
          ),
          children: List.generate(
            8,
            (index) => Stack(
              children: [
                WProductItem(
                  index: index,
                  onTab: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductScreen(index: index),
                      ),
                    );
                  },
                ),
                Positioned(
                  right: 36,
                  top: 12,
                  child: GestureDetector(
                    onTap: (){},
                    child: SvgPicture.asset(
                      AppIcons.wishlistSel,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
