// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_expenz/utils/colors.dart';

class CoustomText extends StatefulWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const CoustomText({
    Key? key,
    required this.text,
    this.size = 15,
    this.color = kMainColor,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  State<CoustomText> createState() => _CoustomState();
}

class _CoustomState extends State<CoustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.size,
        color: widget.color,
        fontWeight: widget.fontWeight,
      ),
    );
  }
}
