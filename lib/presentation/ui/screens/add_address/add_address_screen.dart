import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
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
      backgroundColor: AppColors.backgroundColor,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add New Address",
                style: Styles.getLabelStyle().copyWith(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0, bottom: 40.0),
                child: Text(
                  "Fill The Given Details And Create New\nShipping Address",
                  style: Styles.getOnBoardingSubTitle().copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              _getContenir(
                  txt: "Full Name",
                  conter: controllerName,
                  input: TextInputType.name,
                  hint: "Enter Full Name"),
              _getContenir(
                  txt: "Phone Number",
                  conter: controllerPhone,
                  input: TextInputType.number,
                  hint: "Enter Phone Name"),
              _getContenir(
                  txt: "Address 01",
                  conter: controllerAddress01,
                  input: TextInputType.text,
                  hint: "Enter Address"),
              _getContenir(
                  txt: "Address 02 (Optional)",
                  conter: controllerAddress02,
                  input: TextInputType.text,
                  hint: "Enter Address"),
              _getContenir(
                  txt: "City",
                  conter: controllerCity,
                  input: TextInputType.text,
                  hint: "Enter City"),
              _getContenir(
                  txt: "Country",
                  conter: controllerCountry,
                  input: TextInputType.text,
                  hint: "Enter Country"),
              _getContenir(
                  txt: "Postcode",
                  conter: controllerPastcode,
                  input: TextInputType.text,
                  hint: "Enter Postcode"),
              _getContenir(
                  txt: "Add Delivery Instructions",
                  conter: controllerAddDelivery,
                  input: TextInputType.text,
                  hint: "Write Something Here"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
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
                hintStyle: TextStyle(color: AppColors.black.withOpacity(0.5),),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 0.1),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 0.1),
                ),
              ),
            ),
          ],
        ),
      );

  _getAppBar() => AppBar(
        title:  Center(
            child: Text(
          "Add Address",
          style: TextStyle(color: AppColors.black),
        )),
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
}
