
import 'package:company_form_v1/Screens/data_screen.dart';
import 'package:company_form_v1/Widgets/button_widget.dart';
import 'package:company_form_v1/Widgets/password_field.dart';
import 'package:company_form_v1/Widgets/username_field.dart';
import 'package:company_form_v1/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? finalUsername;
  String? finalPassword;
  bool isLoading = false;
  bool isErrorLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/blurred.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      minWidth: 80.0,
                      minHeight: 80.0,
                      maxHeight: 145.0,
                      maxWidth: 145.0,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: kPrimaryLightColor, width: 2.5),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/company-logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.035),
                  UsernameField(
                    title: "Username",
                    hintText: "johndoe",
                    onChanged: (String username) {
                      // ignore: avoid_print
                      print(username);
                      finalUsername = username;
                    },
                  ),
                  SizedBox(height: size.height * 0.008),
                  PasswordField(
                    title: "Password",
                    hintText: "Pass@123",
                    onChanged: (String password) {
                      // ignore: avoid_print
                      print(password);
                      finalPassword = password;
                    },
                  ),
                  SizedBox(height: size.height * 0.015),
                  ButtonWidget(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          isLoading = false;
                          isErrorLoading = false;
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DataScreen(
                                  username: finalUsername.toString().trim(),
                                  password: finalPassword.toString().trim(),
                                ),
                              ),
                            );
                          } else {
                            isErrorLoading = true;
                          }
                        });
                      });
                    },
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: size.width * 0.02),
                              const SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : isErrorLoading
                            ? const Icon(
                                Icons.cancel_rounded,
                                color: Colors.white,
                              )
                            : const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
