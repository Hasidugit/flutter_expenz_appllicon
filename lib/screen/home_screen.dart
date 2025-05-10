import 'package:flutter/material.dart';
import 'package:flutter_application_expenz/services/user_service.dart';
import 'package:flutter_application_expenz/utils/colors.dart';
import 'package:flutter_application_expenz/widgets/customText.dart';
import 'package:flutter_application_expenz/widgets/imcome_expence_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "";
  @override
  void initState() {
    super.initState();
    UserServices.getUserData().then((value) {
      if (value["username"] != null) {
        setState(() {
          username = value["username"]!;
        });
        print(username);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          // main colum
          Column(
            children: [
              //bg color column
              Container(
                height: 190,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kMainColor,
                            border: Border.all(color: kWhite, width: 3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "asstes/images/onboard_1.png",
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        CoustomText(
                          text: "Welcome, $username",
                          color: kBlack,
                          size: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications,
                            color: const Color.fromARGB(255, 81, 51, 12),
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IncomeExpenceCard(
                          title: "income",
                          amount: 12000,
                          imageUrl: "asstes/images/bag.png",
                          bgColor: kGrey,
                        ),
                        IncomeExpenceCard(
                          title: "income",
                          amount: 12000,
                          imageUrl: "asstes/images/bag.png",
                          bgColor: kGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
