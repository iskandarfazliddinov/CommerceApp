import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/track_order/track_order_screen.dart';
import 'package:commerce_app/presentation/ui/widgets/w_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_colors.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: index != 3 ? 30 : 0),
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
                          style: Styles.getPriceStyle().copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TrackOrderScreen(),),);
                          },
                          child: Container(
                            color: AppColors.primaryColor,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18),
                              child: Text("Track Order",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  _getDialog() => showDialog(context: context, builder: (BuildContext context){
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
              child: SvgPicture.asset(AppImages.logoDangers,width: 62,height: 55,),
            ),
            Text("Delete this product?",style: Styles.getOnBoardingTitle().copyWith(fontSize: 20),),
            const SizedBox(height: 10,),
            Text("Are you want to delete this product?",style: Styles.getOnBoardingSubTitle(),),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
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
                      child: Text("Yes",style: Styles.getOnBoardingTitle().copyWith(fontSize: 16,color: Colors.white),),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
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
                      child: Text("No",style: Styles.getOnBoardingTitle().copyWith(fontSize: 16,color: Colors.white),),
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
  _getAppBar() => AppBar(
        title: const Center(
            child: Text(
          "My Orders",
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
}
