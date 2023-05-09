import 'package:commerce_app/presentation/ui/screens/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

class WBottomTitle extends StatelessWidget {
  final String textFirst;
  final String textSecond;
  final bool centar;
  final String screen;

  const WBottomTitle(this.screen, this.textFirst, this.textSecond, this.centar,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (centar) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textFirst,
            style: const TextStyle(
              color: Color(0xAA797777),
              fontSize: 16.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (screen == "SignUp") {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => SignUp()));
              } else if (screen == "Login") {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              textSecond,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(
                  0xAAF13005,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Text(
            textFirst,
            style: const TextStyle(
              color: Color(0xAA797777),
              fontSize: 16.0,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              textSecond,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(
                  0xAAF13005,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
