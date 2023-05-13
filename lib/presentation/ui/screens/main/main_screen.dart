import 'package:commerce_app/presentation/ui/model/dark.dart';
import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/screens/cart/cart_screen.dart';
import 'package:commerce_app/presentation/ui/screens/home/home_screen.dart';
import 'package:commerce_app/presentation/ui/screens/profile/profile_screen.dart';
import 'package:commerce_app/presentation/ui/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider<Dark>(
      create: (BuildContext context) {
        return Dark();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: TabBarView(
          controller: tabController,
          children: const [
            HomeScreen(),
            WishListScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: Consumer<Dark>(builder: (context, model, child) {
          getDef();
          return Container(
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: const [
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
                  currentTabIndex == 1
                      ? AppIcons.wishlistSel
                      : AppIcons.wishlist,
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
          );
        }),

      ),
    );

  }
  getDef(){
    String link = "assets/images/";
    if (AppColors.backgroundColor == AppColors.darkColor) {
      AppIcons.home = "${link}home_dark.svg";
      AppIcons.wishlistSel = "${link}wishlist_dark.svg";
      AppIcons.cartSel = "${link}cart_dark.svg";
      AppIcons.accountSel = "${link}account_dark.svg";
    } else {
      AppIcons.home = "${link}home.svg";
      AppIcons.wishlistSel = "${link}wishlist_sel.svg";
      AppIcons.cartSel = "${link}cart_sel.svg";
      AppIcons.accountSel = "${link}account_sel.svg";
    }
  }
}
