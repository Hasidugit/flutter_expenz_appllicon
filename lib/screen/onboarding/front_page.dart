import 'package:flutter/material.dart';
import 'package:flutter_application_expenz/utils/colors.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "asstes/images/logo (2).png",
          fit: BoxFit.fill,
          height: 200,
          width: 200,
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            "Expenz",
            style: TextStyle(color: kMainColor, fontSize: 30),
          ),
        ),
      ],
    );
  }
}
