import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shop_now/screens/Productdetailscreen.dart';
import 'package:shop_now/screens/checkoutScreen.dart';
import 'package:shop_now/screens/dukaanstore.dart';
import 'package:shop_now/screens/flashsell.dart';
import 'package:shop_now/screens/homepage.dart';
import 'package:shop_now/screens/papularScreen.dart';
import 'package:shop_now/screens/productpage.dart';

import 'customwidgets/AppSignIn.dart';
import 'customwidgets/GridTilesProducts.dart';
import 'customwidgets/PopularMenuWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(450, 800),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Roboto',
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
            backgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Splash(),
        routes: {
          Hompage.productpage: (context) => ProductScreen(),
          GridTilesProducts.detailpage: (context) => ProductDetail(),
          PopularMenu.popularpage: (context) => PopularScreens(),
          PopularMenu.dukaanestore: (context) => DukaanStoreScreen(),
          PopularMenu.flashsell: (context) => FlashSellScreen(),
          DukaanStoreScreen.detailpage1: (context) => ProductDetail(),
          ProductDetail.checkout: (context) => Checkout(),
        },
      ),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset("assets/images/logo.png"),
        nextScreen: AppSignIn(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white);
  }
}
