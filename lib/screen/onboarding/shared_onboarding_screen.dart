// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_expenz/utils/colors.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const SharedOnboardingScreen({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultFontSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 300, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: kBlack,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 18,
                color: kGrey,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
