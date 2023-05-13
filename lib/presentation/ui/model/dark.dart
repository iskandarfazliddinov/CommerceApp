import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Dark extends ChangeNotifier{
    bool dark = false;

    changeColor(){
        dark = !dark;
        notifyListeners();
    }

    themMode(){
        dark ? AppColors.darkColor : Colors.white;
    }
}