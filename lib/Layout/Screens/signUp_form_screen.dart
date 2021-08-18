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
      //TODO: this drawer just for test
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.grey.shade300,
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('Images/brunch1.png'),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Amira Ezz',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster'),
                  ),
                  Text('userName@gmail.com', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Container(
              color: Colors.red,
              /*  child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('Images/brunch1.png'),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  Text('user name'),
                  Text('userName@gmail.com'),

                ],
              ),*/
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DSC Shop',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
        ),
      ), // AppBar
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'Images/signup.png',
                      ),
                    )),
                  ),
                  SignInTextFormField(
                    labelText: 'Name',
                    helperText: 'Enter your Name',
                    invisible: false,
                    validateFunction: (var value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter your Name';
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                    height: 25,
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
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title:
                                    Text('Are you sure you want to sign up?'),
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
                                              ' you are successfully sign up'));
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
