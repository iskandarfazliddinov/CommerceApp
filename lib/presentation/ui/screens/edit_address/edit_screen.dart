import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_icons.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress01 = TextEditingController();
  TextEditingController controllerAddress02 = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerCountry = TextEditingController();
  TextEditingController controllerPastcode = TextEditingController();
  TextEditingController controllerAddDelivery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              children: [
                _getContenir(txt: "Full Name", conter: controllerName, input: TextInputType.name, hint: "Enter Full Name"),
                _getContenir(txt: "Phone Number", conter: controllerPhone, input: TextInputType.number, hint: "Enter Phone Name"),
                _getContenir(txt: "Address 01", conter: controllerAddress01, input: TextInputType.text, hint: "Enter Address"),
                _getContenir(txt: "Address 02 (Optional)", conter: controllerAddress02, input: TextInputType.text, hint: "Enter Address"),
                _getContenir(txt: "City", conter: controllerCity, input: TextInputType.text, hint: "Enter City"),
                _getContenir(txt: "Country", conter: controllerCountry, input: TextInputType.text, hint: "Enter Country"),
                _getContenir(txt: "Postcode", conter: controllerPastcode, input: TextInputType.text, hint: "Enter Postcode"),
                _getContenir(txt: "Add Delivery Instructions", conter: controllerAddDelivery, input: TextInputType.text, hint: "Write Something Here"),
              ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
        child: Container(
          width: double.infinity,
          height: 55,
          color: AppColors.primaryColor,
          child: Center(
            child: Text(
              "Save Address",
              style: Styles.getOnBoardingTitle()
                  .copyWith(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
  _getAppBar() => AppBar(
    title: const Center(
        child: Text(
          "Edit Address",
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
    actions: [
      SvgPicture.asset(AppIcons.wishlist),
      const SizedBox(
        width: 12,
      )
    ],
    bottom: PreferredSize(
      preferredSize: const Size(double.infinity, 1),
      child: Container(
        color: const Color(0xFFDEDEDE),
        height: 1,
      ),
    ),
  );
  _getContenir(
      {required String txt,
        required TextEditingController conter,
        required TextInputType input,
        required String hint}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txt,
              style: Styles.getLabelStyle().copyWith(fontSize: 18.0),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              maxLines: 1,
              controller: conter,
              keyboardType: input,
              decoration: InputDecoration(
                hintText: hint,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.1),
                ),
              ),
            ),
          ],
        ),
      );
}
