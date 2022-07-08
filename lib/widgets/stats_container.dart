import 'package:covid_info/constants.dart';
import 'package:flutter/material.dart';

class StatsContainer extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String stats;
  final dynamic logoColor;

  StatsContainer(
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
      height: 175,
      // width: double.infinity,
      margin: EdgeInsets.all(9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: logoColor,
            size: 40,
          ),
          SizedBox(height: 20),
          Text(
            '$heading',
            style: kHeadingTextStyle,
          ),
          Text(
            '$stats',
            style: kStatsTextStyle,
          )
        ],
      ),
    );
  }
}
