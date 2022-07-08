import 'package:flutter/material.dart';

import '../constants.dart';

class StatsContainer2 extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String stats;
  final dynamic logoColor;

  StatsContainer2(
      {required this.icon,
      required this.logoColor,
      required this.heading,
      required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 100,
      // width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: logoColor,
            size: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 90,
                child: Text(
                  '$heading',
                  style: kHeadingTextStyle,
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Container(
            height: 60,
            width: 2,
            color: Colors.black,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$stats',
                style: kStatsTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
