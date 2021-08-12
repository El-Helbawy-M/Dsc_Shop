import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(

      text: 'DSC Shop!', textStyle:TextStyle(color: Colors.blue),
      navigateRoute: HomeScreen(),
      duration: 6000,
      imageSize: 130,
      imageSrc: "Images/brunch1.png",
      backgroundColor: Colors.grey.shade100,
    );
  }
}
