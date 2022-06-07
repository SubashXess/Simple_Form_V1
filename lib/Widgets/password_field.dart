import 'package:company_form_v1/constants.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String title;
  final String hintText;
  final Function(String) onChanged;
  const PasswordField({
    super.key,
    required this.hintText,
    required this.title,
    required this.onChanged,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController passwordController = TextEditingController();
  RegExp regExp = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool isHiddenPassword = true;

  @override
  void initState() {
    passwordController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    passwordController.removeListener(onListen);
    passwordController.dispose();
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

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
              controller: passwordController,
              obscureText: isHiddenPassword,
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
                    vertical: 10.0, horizontal: 10.0),
                suffixIcon: passwordController.text.isEmpty
                    ? Container(width: 0.0)
                    : IconButton(
                        splashRadius: 5.0,
                        color: Colors.transparent,
                        onPressed: () => togglePasswordVisibility(),
                        icon: isHiddenPassword
                            ? const Icon(Icons.visibility_off_rounded,
                                color: kPrimaryColor)
                            : const Icon(Icons.visibility_rounded,
                                color: kPrimaryColor),
                      ),
              ),
              style: const TextStyle(color: Colors.white),
              cursorColor: kPrimaryColor,
              autofillHints: const [AutofillHints.password],
              onChanged: widget.onChanged,
              validator: passwordValidate,
            ),
          ),
        ],
      ),
    );
  }

  String? passwordValidate(String? value) {
    if (value!.isEmpty) {
      return 'Required password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value.length >= 16) {
      return 'Your password is too long';
    } else {
      bool result = checkPassword(value);
      if (result) {
        // perform actions
        // ignore: avoid_print
        print("Password : $result");
      } else {
        return 'Invalid password';
      }
    }
    return null;
  }

  bool checkPassword(String value) {
    String password = value.trim().replaceAll(' ', '');
    if (regExp.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
