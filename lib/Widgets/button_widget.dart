import 'package:company_form_v1/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  const ButtonWidget({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: kPrimaryColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: child,
        // Text(
        //   buttonText,
        //   style:
        //       const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        // ),
      ),
    );
  }
}
