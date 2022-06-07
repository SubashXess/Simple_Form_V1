import 'package:company_form_v1/Screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CompanyForm());
}

class CompanyForm extends StatelessWidget {
  const CompanyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Form Version 1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),
    );
  }
}
