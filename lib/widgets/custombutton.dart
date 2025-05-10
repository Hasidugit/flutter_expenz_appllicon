// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_expenz/utils/colors.dart';

class Custombutton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  const Custombutton({
    Key? key,
    required this.buttonName,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: buttonColor,
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
