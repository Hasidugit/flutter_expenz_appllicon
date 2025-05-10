// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_expenz/utils/colors.dart';
import 'package:flutter_application_expenz/widgets/customText.dart';

class IncomeExpenceCard extends StatefulWidget {
  final String title;
  final double amount;
  final String imageUrl;
  final Color bgColor;

  const IncomeExpenceCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.imageUrl,
    required this.bgColor,
  }) : super(key: key);

  @override
  State<IncomeExpenceCard> createState() => _IncomeExpenceCardState();
}

class _IncomeExpenceCardState extends State<IncomeExpenceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: 75,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(kDefaultFontSize - 5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.11,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 252, 252),
                  width: 4,
                ),
              ),
              child: Image.asset(widget.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomText(
                  text: widget.title,
                  size: 12,
                  fontWeight: FontWeight.w300,
                  color: kWhite,
                ),
                SizedBox(height: 2),
                CoustomText(
                  text: "\$ ${widget.amount.toStringAsFixed(0)}",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: kWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
