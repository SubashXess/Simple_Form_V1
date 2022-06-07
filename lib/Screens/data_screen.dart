import 'package:company_form_v1/constants.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  final String username;
  final String password;
  const DataScreen({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Welcome to Peru")),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 2.0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Username : $username"),
            Text("Your Password : $password"),
          ],
        ),
      ),
    );
  }
}
