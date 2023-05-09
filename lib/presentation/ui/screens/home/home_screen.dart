import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/home/category_data.dart';
import 'package:commerce_app/presentation/ui/screens/product/product_screen.dart';
import 'package:commerce_app/presentation/ui/widgets/w_brand_name.dart';
import 'package:commerce_app/presentation/ui/widgets/w_category.dart';
import 'package:commerce_app/presentation/ui/widgets/w_page_title.dart';
import 'package:commerce_app/presentation/ui/widgets/w_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();


  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _key,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              _getSearchBox(),
              const SizedBox(
                height: 34,
              ),
              const WPageTatile(text: "Shop by Category"),
              const SizedBox(
                height: 22,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                          right: categories.length - 1 != index ? 30.0 : 0),
                      child: WCategory(
                        icon: categories[index].icon,
                        text: categories[index].text,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const WPageTatile(
                text: "Newest Arrival",
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: screenHeight*0.5,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 260,
                  ),
                  children: List.generate(
                    8,
                    (index) => WProductItem(
                      index: index,
                      onTab: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductScreen(index: index),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      drawer: _getDrawer(),
    );
  }

  _getDrawer() => Drawer(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppImages.logoMain,
                    width: 89,
                  ),
                ),
                const SizedBox(height: 28),
                const WBrandName(
                  fontSize: 28,
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFCCCCCC),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
            _getMenuItem(text: "Rewards", icon: AppIcons.gift),
            _getMenuItem(text: "Help", icon: AppIcons.help),
            _getMenuItem(text: "Contact Us", icon: AppIcons.attention),
            _getMenuItem(text: "Privacy Policy", icon: AppIcons.privacy),
            _getMenuItem(text: "Logout", icon: AppIcons.logout),
          ],
        ),
      );

  _getMenuItem({
    required String text,
    required String icon,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: SvgPicture.asset(
                icon,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          title: Text(
            text,
            style: Styles.getLabelStyle(),
          ),
        ),
      );

  _getAppBar() => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppImages.logoMenu,
                  ),
                ),
              ),
              const WBrandName(fontSize: 28),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://myhomereview.co/images/3.jpg",
                ),
              )
            ],
          ),
        ),
      );

  _getSearchBox() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 7,
                spreadRadius: 1,
              )
            ]),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20.0,
              ),
              child: SvgPicture.asset(
                AppImages.logoSearch,
              ),
            ),
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(90),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(90),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            hintText: "Search \"Smartphone\"",
            hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.lightGray,
                fontFamily: 'MainFont'),
            suffixIcon: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: SvgPicture.asset(
                AppImages.logoScan,
              ),
            ),
          ),
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              fontFamily: 'MainFont'),
          textInputAction: TextInputAction.search,
        ),
      );
}
