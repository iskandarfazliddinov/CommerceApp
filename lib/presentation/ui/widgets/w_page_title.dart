import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';

class WPageTatile extends StatelessWidget {
  final String text;

  const WPageTatile({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.getLabelStyle().copyWith(fontSize: 18),
    );
  }
}
