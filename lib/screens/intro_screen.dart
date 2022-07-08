import 'package:covid_info/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_8axjdnts.json')),
          ClipPath(
            clipper: WaveClipperOne(reverse: true),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.49,
              width: double.infinity,
              color: kScrollableSheetColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 110),
                      Text(
                        'covid-19'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'worldmeter'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Get the latest counts of COVID-19 cases ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        'around the world',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
