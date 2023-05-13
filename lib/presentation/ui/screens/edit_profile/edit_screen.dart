import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/widgets/w_profmain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_styles.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName =
        TextEditingController(text: "Saul Goodmate");
    TextEditingController controllerGmail =
        TextEditingController(text: "Saulgo35@gmail.com");
    TextEditingController controllerPassword =
        TextEditingController(text: "Password");
    TextEditingController controllerDate =
        TextEditingController(text: "20/02/1995");

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              WProfMain(
                icon: Icons.photo_camera,
                onTab: () {},
              ),
              const SizedBox(
                height: 50,
              ),
              _getFiled(controllerName, TextInputType.name, false, false),
              _getFiled(
                  controllerGmail, TextInputType.emailAddress, false, false),
              _getFiled(controllerPassword, TextInputType.visiblePassword, true,
                  false),
              _getFiled(controllerDate, TextInputType.datetime, false, true),
            ],
          ),
        ),
      ),
    );
  }

  _getAppBar() => AppBar(
        title:  Center(
            child: Text(
          "Edit Profile",
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
          Center(
              child: Text(
            "Save",
            style: Styles.getTextActionStyles(),
          )),
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
      );

  _getFiled(TextEditingController controllers, TextInputType type,
          bool obscureText, bool icon) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: TextField(
          maxLines: 1,
          obscureText: obscureText,
          controller: controllers,
          keyboardType: type,
          style: TextStyle(
            color: AppColors.black.withOpacity(0.8),
          ),
          decoration: InputDecoration(
            suffixIcon: icon
                ? const Icon(
                    Icons.calendar_month,
                    color: AppColors.primaryColor,
                  )
                : null,
            enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 0.1)),
            focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 0.1)),
          ),
        ),
      );
}
