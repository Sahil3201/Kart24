import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kart24/controllers/provider.dart';
import 'package:kart24/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Kart();
  runApp(ChangeNotifierProvider(
      create: (context) => Kart.getInstance, child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Poppins',
              )),
      home: AnimatedSplashScreen(
        splash: 'assets/images/splashscreen_small.png',
        duration: 2000,
        nextScreen: Home(),
        //       screenFunction: () async{
        //   return Home();
        // },
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.topToBottom,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
