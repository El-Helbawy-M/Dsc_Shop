import 'package:dsc_shop/Layout/Screens/HomeScreen.dart';
import 'package:dsc_shop/Layout/Screens/signIn_form_screen.dart';
import 'package:dsc_shop/Layout/Screens/signUp_form_screen.dart';
import 'package:dsc_shop/Layout/Tools/SignerManager.dart';
import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Layout/Screens/SplashScreen.dart';
import 'Layout/Tools/TimerManager.dart';

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
      title: 'DSC Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "Home Screen": (context) => ChangeNotifierProvider(create: (context) => StateManager(), child: HomeScreen()),
        "Splash Screen": (context) => ChangeNotifierProvider(create: (context) => TimerManager(), child: SplashScreen()),
        "Sign Up": (context) => ChangeNotifierProvider(create: (context) => Signer(), child: SignUpScreen()),
        "Sign In": (context) => ChangeNotifierProvider(
              create: (contxet) => Signer(),
              child: SignInScreen(),
            )
      },
      initialRoute: "Splash Screen",
    );
  }
}
