// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_expenz/screen/main_screen.dart';
import 'package:flutter_application_expenz/screen/onboarding_screen.dart';

class Wrapper extends StatefulWidget {
  final bool showMainScreen;
  const Wrapper({Key? key, required this.showMainScreen}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.showMainScreen ? MainScreen() : OnBoardingScreen();
  }
}
