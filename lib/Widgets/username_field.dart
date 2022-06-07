import 'package:company_form_v1/constants.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatefulWidget {
  final String title;
  final String hintText;
  final Function(String) onChanged;
  const UsernameField({
    super.key,
    required this.hintText,
    required this.title,
    required this.onChanged,
  });

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.05),
          Flexible(
            flex: 3,
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white54),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryLightColor)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0)),
              onChanged: widget.onChanged,
              style: const TextStyle(color: Colors.white),
              cursorColor: kPrimaryColor,
              autofillHints: const [AutofillHints.username],
              validator: usernameValidation,
            ),
          ),
        ],
      ),
    );
  }

  String? usernameValidation(String? value) {
    if (value!.isEmpty) {
      // showSnackBar(context, 'Required name');
      return 'Required name';
    } else if (value.length < 4) {
      // showSnackBar(context, 'Enter valid name');
      return 'Enter valid name';
    } else if (value.length > 20) {
      // showSnackBar(context, 'Your name is too long');
      return 'Your password is too long';
    } else {
      return null;
    }
  }
}
