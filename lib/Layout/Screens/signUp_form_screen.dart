import 'package:dsc_shop/Data/DataBase/Firebase.dart';
import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:dsc_shop/Layout/Tools/SignerManager.dart';
import 'package:dsc_shop/Layout/Widgets/login_text_form_field.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:dsc_shop/Layout/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AppUser user;

  File fileImage;
  Uint8List memoryImage;
  bool isFile = false;

  @override
  Widget build(BuildContext signupContext) {
    var manager = Provider.of<Signer>(signupContext);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: SizedBox(),
        title: Text(
          'DSC Shop',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
        ),
      ), // AppBar
      body: Center(
        child: (manager.loading)
            ? CircularProgressIndicator()
            : Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(signupContext).size.width,
                          height: MediaQuery.of(signupContext).size.height / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'Images/signup.png',
                            ),
                          )),
                        ),
                        SignInTextFormField(
                          onChange: (String value) => manager.setName(value),
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

                        SignInTextFormField(
                          onChange: (String value) => manager.setEmail(value),
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
                        //****************************** password text form field
                        //*********************************************************
                        SignInTextFormField(
                          onChange: (String value) => manager.setPassword(value),
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
                        SizedBox(
                          height: 30,
                        ),

                        //************************* signUp button
                        //********************************************

                        BottomButton(
                          buttonTitle: 'sign up',
                          onPress: () {
                            if (formKey.currentState.validate()) {
                              return showDialog(
                                  context: signupContext,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Are you sure you want to sign in?'),
                                      //content: Text('hi'),
                                      actions: [
                                        //********************** cancel button
                                        //*******************************************
                                        TextButton(
                                          onPressed: () {
                                            // Navigator.pop(context);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return SignUpScreen();
                                            }));
                                          },
                                          child: Text('cancel'),
                                        ), // TextButton

                                        //************************ ok button
                                        //*******************************************
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            user = AppUser(manager.name, manager.email, "");
                                            manager.setLoading();
                                            TaskState state = await Auther(user).register(manager.password);
                                            manager.setLoading();
                                            if (state == TaskState.OK) Navigator.pushNamed(signupContext, "Home Screen", arguments: user);
                                          },
                                          child: Text('ok'),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text("Do you have an account ? "),
                              InkWell(
                                child: Text(" Sign in", style: TextStyle(color: Colors.blue)),
                                onTap: () => Navigator.pushNamed(context, "Sign In"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50)
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
