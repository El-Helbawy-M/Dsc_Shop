import 'package:dsc_shop/Layout/Screens/HomeScreen.dart';
import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Layout/Screens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {"Home Screen": (context) => ChangeNotifierProvider(create: (context) => StateManager(), child: HomeScreen())},
      initialRoute: "Home Screen",
    );
  }
}
