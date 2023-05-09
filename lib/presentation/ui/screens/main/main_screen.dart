import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/screens/cart/cart_screen.dart';
import 'package:commerce_app/presentation/ui/screens/home/home_screen.dart';
import 'package:commerce_app/presentation/ui/screens/profile/profile_screen.dart';
import 'package:commerce_app/presentation/ui/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 4, vsync: this, initialIndex: currentTabIndex);
  }

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          HomeScreen(),
          WishListScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                spreadRadius: 3,
                blurRadius: 7,
              )
            ]),
        height: 94,
        child: TabBar(
          indicatorColor: Colors.transparent,
          controller: tabController,
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          tabs: [
            SvgPicture.asset(
              currentTabIndex == 0 ? AppIcons.home : AppIcons.homeDef,
              width: 24,
              height: 24,
            ),
            SvgPicture.asset(
              currentTabIndex == 1 ? AppIcons.wishlistSel : AppIcons.wishlist,
              width: 24,
              height: 24,
            ),
            SvgPicture.asset(
              currentTabIndex == 2 ? AppIcons.cartSel : AppIcons.cart,
              width: 24,
              height: 24,
            ),
            SvgPicture.asset(
              currentTabIndex == 3 ? AppIcons.accountSel : AppIcons.account,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
