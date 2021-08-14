import 'package:flutter/material.dart';

class SignInTextFormField extends StatelessWidget {
  SignInTextFormField(
      {this.labelText, this.helperText, this.invisible, this.validateFunction});

  final String labelText;
  final String helperText;
  final bool invisible;
  final Function validateFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: invisible,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        helperText: helperText,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      ),
      validator: validateFunction,
    );
  }
}
