import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/widgets/w_stars.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getMains(),
              _getOrderDone(text: "Order Monday, 20 January 2023"),
              _getOrderDone(text: "Shipped Tuesday, 20 January 2023"),
              _getOrderNoDone(text: "Out For Delivery"),
              const SizedBox(
                height: 56,
              ),
              _getOrderNoDone(text: "Arriving Saturday"),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Divider(
                  color: AppColors.lightGray,
                  thickness: 1,
                ),
              ),
              Text(
                "Delivery Information :",
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 40.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: AppColors.lightGray,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Saul Goodmate",
                          style: Styles.getLabelStyle(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            "16 E Birch Hill Road Fairbanks, NY,\n99312 United States",
                            style: Styles.getNodeTitle(),
                          ),
                        ),
                        Text(
                          "865-5585 57587",
                          style: Styles.getNodeTitle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "Order Info :",
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
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
            ],
          ),
        ),
      ),
    );
  }

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

  _getOrderDone({required String text}) => Padding(
        padding: const EdgeInsets.only(bottom: 56.0),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
              child: const Icon(Icons.download_done, color: Colors.white),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: Styles.getLabelStyle().copyWith(fontSize: 16),
            ),
          ],
        ),
      );

  _getOrderNoDone({required String text}) => Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.lightGray),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: Styles.getLabelStyle()
                .copyWith(fontSize: 16, color: AppColors.lightGray),
          ),
        ],
      );

  _getAppBar() => AppBar(
        title: const Center(
            child: Text(
          "Track Order",
          style: TextStyle(color: Colors.black),
        )),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          SizedBox(
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
      );

  _getMains() => Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
              child: Image.asset(
                AppIcons.watch,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    style: Styles.getLabelStyle().copyWith(fontSize: 20),
                  ),
                ),
                Text(
                  "\$120.00",
                  style: Styles.getPriceStyle().copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 26,
                ),
              ],
            ),
          ],
        ),
      );
}
