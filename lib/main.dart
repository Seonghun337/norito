import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'src/app.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Norito',
    theme: ThemeData(
      fontFamily: "Cabin",
      primaryColor: Color(0xffA3EEFF),
      primaryColorDark: Color(0xff0090E1),
    ),
    home: new Splash(),
  ));
}

class Splash extends StatefulWidget {
  @override
  _Splash createState() => new _Splash();
}

class _Splash extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new TimeBasedSplash().build(context);
  }
}


class TimeBasedSplash extends State<Splash>{
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,          // Load Splash screen for 10 seconds.
      navigateAfterSeconds: new App(),       // Navigate to HomeScreen after defined duration.
      image: new Image.asset('assets/images/logo.png'),   // Load this image in the splash screen
      photoSize: 200,       // Size of the photo
      loaderColor: Colors.white,      // Color of Loading spinner
      styleTextUnderTheLoader : const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      loadingText: new Text('Loading...'),
      gradientBackground: LinearGradient(   // Background color
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Colors.lightBlue,
          Colors.indigo
        ],
      ),
    )!;
  }
}