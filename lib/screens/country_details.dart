import 'package:covid_info/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  late String countryName, flag;
  late int cases, deaths, todayCases, todayDeaths, todayRecovered, active;

  CountryDetails(
      {required this.countryName,
      required this.flag,
      required this.cases,
      required this.todayCases,
      required this.todayDeaths,
      required this.todayRecovered,
      required this.active,
      required this.deaths});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.countryName,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Image.network(
                  widget.flag,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: BoxDecoration(
              color: kScrollableSheetColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'COVID-19 STATS',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3.5,
                        offset: Offset(1, 2.5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'TODAY CASES',
                            style: kCovidStatsHeading,
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.todayCases.toString(),
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'RECOVERED',
                            style: kCovidStatsHeading,
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.todayRecovered.toString(),
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'ACTIVE CASES',
                            style: kCovidStatsHeading,
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.active.toString(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'TODAY DEATHS',
                            style: kCovidStatsHeading,
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.todayDeaths.toString(),
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
