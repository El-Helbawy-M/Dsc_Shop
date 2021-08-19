import 'package:dsc_shop/Data/DataBase/Firebase.dart';
import 'package:dsc_shop/Data/Handlers/UserHandler.dart';
import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:dsc_shop/Layout/Tools/SignerManager.dart';
import 'package:dsc_shop/Layout/widgets/bottom_button.dart';
import 'package:dsc_shop/Layout/widgets/login_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';

class SignInScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AppUser user;
  @override
  Widget build(BuildContext signInContext) {
    var manager = Provider.of<Signer>(signInContext);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DSC Shop',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ), // AppBar
      body: (manager.loading)
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(signInContext).size.width,
                          height: MediaQuery.of(signInContext).size.height / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('Images/login.png'),
                          )),
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
                        ), // LoginTextFormField

                        SizedBox(
                          height: 15,
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
                        ), // LoginTextFormField

                        SizedBox(
                          height: 30,
                        ),

                        //************************* sign in button
                        //********************************************

                        BottomButton(
                          buttonTitle: 'sign in',
                          onPress: () {
                            if (formKey.currentState.validate()) {
                              return showDialog(
                                  context: signInContext,
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
                                              return SignInScreen();
                                            }));
                                          },
                                          child: Text('cancel'),
                                        ), // TextButton

                                        //************************ ok button
                                        //*******************************************
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            manager.setLoading();
                                            TaskState state = await Auther().signIn(manager.email, manager.password);
                                            Map data = await UserHandler().getData(manager.email);
                                            user = AppUser(data["Name"], data["Email"], data["Image"]);
                                            manager.setLoading();
                                            if (state == TaskState.OK) Navigator.pushNamed(signInContext, "Home Screen", arguments: user);
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
