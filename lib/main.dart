import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/screens/forget_password/forget_password.dart';
import 'package:commerce_app/presentation/ui/screens/home/home_screen.dart';
import 'package:commerce_app/presentation/ui/screens/login/login_screen.dart';
import 'package:commerce_app/presentation/ui/screens/main/main_screen.dart';
import 'package:commerce_app/presentation/ui/screens/reset/reset_screen.dart';
import 'package:commerce_app/presentation/ui/screens/sign_up/sign_up.dart';
import 'package:commerce_app/presentation/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/ui/model/dark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context) {
        return Dark();

      },
      child: Consumer<Dark>(
        builder: (context,model,child) {
          return  MaterialApp(
            theme: ThemeData(
              backgroundColor: model.dark ? AppColors.darkColor : Colors.white
            ),
            debugShowCheckedModeBanner: false,
            title: 'Ecommerce',
            home: const SplashScreen(),
          );
        }
      ),
    );
  }
}

