import 'package:flutter/material.dart';

class WTextFiled extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final String textL;
  final TextInputType type ;

  const WTextFiled(this.obscureText,this.controller,this.textL,this.type,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0,left: 24.0,top: 32),
      child: TextField(
        keyboardType: type,
        obscureText: obscureText,
        controller: controller,
        decoration:  InputDecoration(
          label: Text(
            textL,
            style: const TextStyle(fontSize: 18.0),
          ),
          border: const OutlineInputBorder(

          ),
        ),
      ),
    );
  }
}
