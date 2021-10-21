import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'Screens/home_screens/home_screen.dart';
import 'constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.courgetteTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.red,
      ),
      home: AnimatedSplashScreen(
        duration: 5000,
        splash: Image.asset("images/splashimg.gif", fit: BoxFit.cover,),
        nextScreen: HomeScreen(),
        backgroundColor: black,
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}

