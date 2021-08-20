import 'package:dsc_shop/Layout/Tools/TimerManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timer = Provider.of<TimerManager>(context);
    if (timer.counter == 0) timer.start(context);
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1950),
          width: timer.size,
          height: timer.size,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('Images/brunch1.png'),
          )),
        ),
      ),
    );
  }
}
