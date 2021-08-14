import 'package:dsc_shop/Layout/tools/TimerManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timer = Provider.of<TimerManager>(context);
    if(timer.counter == 0) timer.start(context);
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: timer.size ,
          height: timer.size ,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/brunch1.png'),

          )
        ),

        ),
      ),
    );
  }
}
/*SplashScreenView(
      text: 'DSC Shop!', textStyle:TextStyle(color: Colors.blue),
      navigateRoute: HomeScreen(),
      duration: 6000,
      imageSize: 130,
      imageSrc: "Images/brunch1.png",
      backgroundColor: Colors.grey.shade100,
    );*/