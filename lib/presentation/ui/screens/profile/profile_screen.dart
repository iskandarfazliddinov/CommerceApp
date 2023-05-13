import 'package:commerce_app/presentation/ui/model/dark.dart';
import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/edit_profile/edit_screen.dart';
import 'package:commerce_app/presentation/ui/screens/my_order/my_order_screen.dart';
import 'package:commerce_app/presentation/ui/screens/payment_method/payment_method_screen.dart';
import 'package:commerce_app/presentation/ui/screens/shipping_addresses/shipping_addresses_screen.dart';
import 'package:commerce_app/presentation/ui/widgets/w_profmain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _switchNote = false;
  bool _switchMode = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dark>(
      create: (BuildContext context) {
        return Dark();
      },
      child: Consumer<Dark>(builder: (context, model, child) {
        AppColors.backgroundColor == AppColors.darkColor
            ? _switchMode = true
            : _switchMode = false;

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            title: Center(
              child: Text(
                "My Account",
                style: Styles.getLabelStyle(),
              ),
            ),
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WProfMain(
                    icon: Icons.edit,
                    onTab: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EditScreen(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notification",
                          style: Styles.getLabelStyle().copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: _switchNote,
                          activeColor: const Color(0xFFF13005).withOpacity(0.5),
                          onChanged: (bool value) {
                            setState(() {
                              _switchNote = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Divider(
                      color: Color(0xFFCCCCCC),
                      thickness: 1,
                    ),
                  ),
                  _getNextButton(
                    txt: "My Orders",
                    onTab: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyOrderScreen(),
                        ),
                      );
                    },
                  ),
                  _getNextButton(
                    txt: "Payment Method",
                    onTab: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PaymentMethodScreen(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dark Mode",
                          style: Styles.getLabelStyle().copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: _switchMode,
                          activeColor: const Color(0xFFF13005).withOpacity(0.5),
                          onChanged: (bool value) {
                            _switchMode = value;
                            model.changeColor();
                            model.dark
                                ? AppColors.backgroundColor =
                                    AppColors.darkColor
                                : AppColors.backgroundColor = Colors.white;
                            model.dark
                                ? AppColors.black = Colors.white
                                : AppColors.black = Colors.black;
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Divider(
                      color: Color(0xFFCCCCCC),
                      thickness: 1,
                    ),
                  ),
                  _getNextButton(
                    txt: "Shipping Addresses",
                    onTab: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShippingAddressesScreen(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 30),
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Logout",
                          style: Styles.getTextNode().copyWith(fontSize: 18),
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _getNextButton({required String txt, required GestureTapCallback onTab}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: GestureDetector(
          onTap: onTab,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    txt,
                    style: Styles.getLabelStyle().copyWith(
                      fontSize: 18,
                    ),
                  ),
                   Icon(
                    Icons.navigate_next_outlined,
                    color: AppColors.black,
                    size: 35,
                  ),
                ],
              ),
              const Divider(
                color: Color(0xFFCCCCCC),
                thickness: 1,
              )
            ],
          ),
        ),
      );
}
