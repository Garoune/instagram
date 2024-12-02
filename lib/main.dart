import 'package:flutter/material.dart';
import 'package:flutter_instagram/screens/activityy_screen.dart';
import 'package:flutter_instagram/screens/add_content_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            headlineMedium: TextStyle(
          fontFamily: 'GB',
          fontSize: 18,
          color: Colors.white,
        ),),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffF35383),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              textStyle: TextStyle(
                  fontFamily: 'GB', fontSize: 16),),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:ActivityyScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/pattern1.png'),
            repeat: ImageRepeat.repeat),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Center(
                child: Image(
                  image: AssetImage('images/logo_splash.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    'From',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'ExpertFlutter',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
