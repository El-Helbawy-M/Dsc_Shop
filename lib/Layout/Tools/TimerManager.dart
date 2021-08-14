import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerManager extends ChangeNotifier {
  double size = 200;
  Timer _timer;
  int counter = 0;

  void start(BuildContext context) {
    this._timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if(counter == 10) {
        _stop(context);
        timer.cancel();
      } else {
        size = size == 200 ? 100 : 200;
        counter += 2;

      }
      notifyListeners();
      print(counter);
    });
  }

  void _stop(BuildContext context) {
    // Navigator.pushNamed(context, "Home Screen");
    notifyListeners();
  }
}
