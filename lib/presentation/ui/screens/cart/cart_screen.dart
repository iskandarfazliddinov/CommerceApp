import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/delivery_information/deliver_info.dart';
import 'package:commerce_app/presentation/ui/screens/shipping_addresses/shipping_addresses_screen.dart';
import 'package:commerce_app/presentation/ui/widgets/w_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_icons.dart';
import '../delivery_information/delivery_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int currentText = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Shopping Cart",
            style: Styles.getLabelStyle(),
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
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 1),
          child: Container(
            color: const Color(0xFFDEDEDE),
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: index != 3 ? 30 : 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration:
                                  const BoxDecoration(color: Color(0xFFF7F7F7)),
                              child: Image.asset(
                                AppIcons.watch,
                              ),
                            ),
                            Positioned(
                              right: 12,
                              top: 12,
                              child: GestureDetector(
                                onTap: () {
                                  _getDialog();
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const WStars(mark: 3),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Smart Watches",
                                style:
                                    Styles.getLabelStyle().copyWith(fontSize: 20),
                              ),
                            ),
                            Text(
                              "\$120.00",
                              style:
                                  Styles.getPriceStyle().copyWith(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentText > 1
                                          ? currentText -= 1
                                          : currentText;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    width: 26,
                                    height: 26,
                                    child: const Center(
                                      child: Icon(
                                        Icons.minimize,
                                        color: Colors.black,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "$currentText",
                                    style: Styles.getLabelStyle(),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentText += 1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    width: 26,
                                    height: 26,
                                    child: const Center(
                                        child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 12,
                                    )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightGray,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Text(
                          "Promocodes",
                          style: Styles.getLabelStyle(),
                        ),
                      ),
                      const SizedBox(),
                      const SizedBox(),
                      Text(
                        "Apply",
                        style: Styles.getTextNode()
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Order Info",
                  style: Styles.getLabelStyle().copyWith(fontSize: 20),
                ),
              ),
              _getTitle(subTitle: "Subtotal", money: "\$890.00"),
              _getTitle(subTitle: "Shipping Charge", money: "+ \$10.00"),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: Styles.getOnBoardingSubTitle(),
                    ),
                    Text(
                      "\$900.00",
                      style: Styles.getLogoTextStyle().copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DeliveryInfoScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: Styles.getTextActionStyles()
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getDialog() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: SvgPicture.asset(
                    AppImages.logoDangers,
                    width: 62,
                    height: 55,
                  ),
                ),
                Text(
                  "Delete this product?",
                  style: Styles.getOnBoardingTitle().copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Are you want to delete this product?",
                  style: Styles.getOnBoardingSubTitle(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF13005),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          width: 144,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "Yes",
                            style: Styles.getOnBoardingTitle()
                                .copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFA305),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          width: 144,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "No",
                            style: Styles.getOnBoardingTitle()
                                .copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });

  _getTitle({required String subTitle, required String money}) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subTitle,
              style: Styles.getOnBoardingSubTitle(),
            ),
            Text(
              money,
              style: Styles.getOnBoardingSubTitle(),
            ),
          ],
        ),
      );
}
