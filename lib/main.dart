import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:dsc_shop/Layout/Screens/HomeScreen.dart';
import 'package:dsc_shop/Layout/Screens/ProductDetailsScreen.dart';
import 'package:dsc_shop/Layout/Screens/WishlistScreen.dart';
import 'package:dsc_shop/Layout/Screens/signIn_form_screen.dart';
import 'package:dsc_shop/Layout/Screens/signUp_form_screen.dart';
import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:dsc_shop/Layout/tools/TimerManager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      title: 'DSC Shop',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark
            )
          )),
      //     routes: {"Home Screen": (context) => ChangeNotifierProvider(create: (context) => StateManager(), child: HomeScreen()),
      // "Splash Screen" : (context)=>ChangeNotifierProvider(create: (context)=>TimerManager(),child: SplashScreen(),)},
      // initialRoute: "Splash Screen",
     home: SignUpScreen(),
    );
  }
}
