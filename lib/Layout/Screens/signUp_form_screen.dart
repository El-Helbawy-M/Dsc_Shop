import 'package:dsc_shop/Constants.dart';
import 'package:dsc_shop/Layout/widgets/bottom_button.dart';
import 'package:dsc_shop/Layout/widgets/login_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('DSC Shop'),
        // backgroundColor: Colors.black,
      ), // AppBar
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.9,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('Images/signup.png',),
                        )
                    ),
                  ),
                  SignInTextFormField(
                    labelText: 'Email',
                    helperText: 'Enter your Email',
                    invisible: false,
                    validateFunction: (var value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter your Email';
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  SignInTextFormField(
                    labelText: 'Name',
                    helperText: 'Enter your Name',
                    invisible: false,
                    validateFunction: (var value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter your Email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //****************************** password text form field
                  //*********************************************************
                  SignInTextFormField(
                    labelText: 'password',
                    helperText: 'Enter your password',
                    invisible: true,
                    validateFunction: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter your password';
                      } else {
                        return null;
                      }
                    },
                  ),
         SizedBox(height: 30,),

                  //************************* signUp button
                  //********************************************

                  BottomButton(
                    buttonTitle: 'sign up',
                    onPress: () {
                      if (formKey.currentState.validate()) {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title:
                                Text('Are you sure you want to sign in?'),
                                //content: Text('hi'),
                                actions: [
                                  //********************** cancel button
                                  //*******************************************
                                  TextButton(
                                    onPressed: () {
                                      // Navigator.pop(context);
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return SignUpScreen();
                                          }));
                                    },
                                    child: Text('cancel'),
                                  ), // TextButton

                                  //************************ ok button
                                  //*******************************************
                                  TextButton(
                                    onPressed: () {
                                      final snackBar = SnackBar(
                                          content: Text(
                                              ' you are successfully login, '));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      Navigator.pop(context);
                                    },
                                    child: Text('ok'),
                                  ),
                                ],
                              );
                            });
                      }
                    },
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
