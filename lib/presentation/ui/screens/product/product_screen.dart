import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/widgets/w_button.dart';
import 'package:commerce_app/presentation/ui/widgets/w_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatefulWidget {
  final int index;

  const ProductScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;
  int currentColorIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Product"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child:  Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 260,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: controller,
                        onPageChanged: (int index) {
                          setState(
                            () {
                              page = index;
                            },
                          );
                        },
                        physics: const BouncingScrollPhysics(),
                        children: _getImages(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _getDots(5, page),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Smart Watch",
                        style: Styles.getLabelStyle().copyWith(fontSize: 20),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(height: 10),
                      const WStars(mark: 3),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$120.00",
                        style: Styles.getPriceStyle().copyWith(fontSize: 20),
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Avilable in stock",
                        style: Styles.getLabelStyle()
                            .copyWith(color: AppColors.sucCes),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ],
              ),
              _getDivider(),
              Text(
                "Color Variant",
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: _getColorsWidget(currentColorIndex: currentColorIndex),
              ),
              _getDivider(),
              ..._getChar(),
              _getDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ...List.generate(2, (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 48.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/truck.svg",
                              width: 36,
                              height: 27,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Get Free Delivry",
                              style: Styles.getLabelStyle(),
                            ),
                          ],
                        ),
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ...List.generate(2, (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 48.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/images/truck.svg",
                              width: 36,
                              height: 27,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Get Free Delivry",
                              style: Styles.getLabelStyle(),
                            ),
                          ],
                        ),
                      ),),
                    ],
                  ),
                ],
              ),
              Text(
                "About this item",
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                """At vero eos et accusamus et iusto odio dig
ssimos ducimus qui blanditiis praesentium 
voluptatum deleniti atque corrupti quos do
lores et quas molestias excepturi...\n\nAt vero eos et accusamus et iusto odio dig
ssimos ducimus qui blanditiis praesentium 
voluptatum deleniti atque .""",
                style: Styles.getContentStyle(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: WButton(
          text: "Add to Cart",
          onTab: () {},
        ),
      ),
    );
  }

  _getDivider() => const Padding(
        padding: EdgeInsets.only(top: 35.0, bottom: 30),
        child: Divider(
          color: Color(0xFFCCCCCC),
          thickness: 1,
        ),
      );

  _getChar() => List.generate(5, (index) => _getCharItem());

  _getCharItem() => Padding(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Brand",
              style: Styles.getLabelStyle().copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              "Noise",
              style: Styles.getLabelStyle().copyWith(
                fontSize: 18,
                color: const Color(0xFFAAAAAA),
              ),
            ),
          ],
        ),
      );

  List<Color> colors = [
    Color(0xFF396036),
    Color(0xFFCDBD69),
    Color(0xFF3B250F),
    Color(0xFF69ABCE),
    Color(0xFFC0C0C0),
  ];

  _getColorsWidget({required int currentColorIndex}) => List.generate(
        colors.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              this.currentColorIndex = index;
            });
          },
          child: Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
                border: Border.all(
                  color: index == currentColorIndex
                      ? colors[index]
                      : Colors.transparent,
                  width: 2,
                ),
                shape: BoxShape.circle),
            padding: const EdgeInsets.all(4),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: colors[index],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      );

  _getImages() => List.generate(
        5,
        (index) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: "product_${widget.index}",
              child: Image.asset(
                AppIcons.watch,
                width: 260,
                height: 240,
              ),
            ),
          ],
        ),
      );

  _getDots(int n, int activeIndex) => List.generate(
        n,
        (index) {
          return Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: index == activeIndex
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          );
        },
      );
}
