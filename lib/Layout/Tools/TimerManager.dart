import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerManager extends ChangeNotifier {
  double size = 200;
  int counter = 0;

  void start(BuildContext context) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (counter == 14) {
        timer.cancel();
        _stop(context);
      } else {
        size = size == 200 ? 100 : 200;
        counter += 2;
      }
      notifyListeners();
      print(counter);
    });
  }

  void _stop(BuildContext context) {
    Navigator.pushNamed(context, "Home Screen");
    notifyListeners();
  }
}
