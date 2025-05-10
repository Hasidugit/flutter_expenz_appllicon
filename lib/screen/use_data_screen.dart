import 'package:flutter/material.dart';
import 'package:flutter_application_expenz/screen/main_screen.dart';
import 'package:flutter_application_expenz/services/user_service.dart';
import 'package:flutter_application_expenz/utils/colors.dart';
import 'package:flutter_application_expenz/utils/contants.dart';
import 'package:flutter_application_expenz/widgets/custombutton.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //form Key for the form validations
  final _formKey = GlobalKey<FormState>();

  //controllers for save the states in the inputs
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordContorller = TextEditingController();
  final TextEditingController _confirmPasswordContorller =
      TextEditingController();

  bool _rememberMe = false;

  bool _passwordVisible = false;
  bool _comfirmPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordContorller.dispose();
    _emailController.dispose();
    _confirmPasswordContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefalutPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          //check weather the username is entered
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      //password
                      TextFormField(
                        controller: _passwordContorller,
                        obscureText: _passwordVisible ? true : false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter A Valid Password";
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            child: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _confirmPasswordContorller,
                        obscureText: _comfirmPasswordVisible ? true : false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter A Valid Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _comfirmPasswordVisible =
                                    !_comfirmPasswordVisible;
                              });
                            },
                            child: Icon(
                              _comfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off_rounded,
                            ),
                          ),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Text(
                            "Remember Me for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // Form is valid, process data
                            String username = _usernameController.text;
                            String email = _emailController.text;
                            String password = _passwordContorller.text;
                            String confirmPassword =
                                _confirmPasswordContorller.text;

                            // Store the user details in shared preferences
                            await UserServices.storeUSerDetails(
                              username,
                              email,
                              password,
                              confirmPassword,
                              context,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                          }
                        },
                        child: const Custombutton(
                          buttonName: "Next",
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
