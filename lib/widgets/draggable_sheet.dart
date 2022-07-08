import 'package:covid_info/constants.dart';
import 'package:covid_info/screens/country_list.dart';
import 'package:covid_info/screens/stats_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_info/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../providers/worldwide_provider.dart';

class DraggableSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final dat = ref.watch(worldwideProvider);
      return Stack(
        children: [
          DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: kScrollableSheetColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    controller: scrollController,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10),
                          SizedBox(
                            width: 100,
                            child: Divider(
                              thickness: 5,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'COVID-19 Worldwide Stats',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: StatsContainer(
                                icon: FontAwesomeIcons.virusCovid,
                                logoColor: Colors.red,
                                heading: 'Today New Cases',
                                stats: dat.todayCases.toString(),
                              ),
                            ),
                            Expanded(
                              child: StatsContainer(
                                icon: FontAwesomeIcons.skull,
                                logoColor: Colors.grey,
                                heading: 'Today New Deaths',
                                stats: dat.todayDeaths.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: StatsContainer(
                                icon: FontAwesomeIcons.bedPulse,
                                logoColor: Colors.blueAccent,
                                heading: 'Active Cases',
                                stats: dat.active.toString(),
                              ),
                            ),
                            Expanded(
                              child: StatsContainer(
                                icon: FontAwesomeIcons.heartPulse,
                                logoColor: Colors.green,
                                heading: 'Today Recovered',
                                stats: dat.todayRecovered.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: StatsContainer2(
                                icon: FontAwesomeIcons.circleCheck,
                                logoColor: Colors.lightGreen,
                                heading: 'Total Cases',
                                stats: dat.cases.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: StatsContainer2(
                                icon: FontAwesomeIcons.lungsVirus,
                                logoColor: Colors.deepPurple,
                                heading: 'Total Deaths',
                                stats: dat.deaths.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: StatsContainer2(
                                icon: FontAwesomeIcons.shieldVirus,
                                logoColor: Colors.pink,
                                heading: 'Total Recovered',
                                stats: dat.recovered.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      DraggableSheetButton(
                        buttonTitle: 'view country list',
                        onPress: () {
                          Get.to(() => CountryList(),
                              transition: Transition.leftToRight);
                        },
                      ),
                      SizedBox(height: 20),
                      DraggableSheetButton(
                        buttonTitle: 'covid-19 stats table',
                        onPress: () {
                          Get.to(() => StatsTable(),
                              transition: Transition.leftToRight);
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                );
              }),
        ],
      );
    });
  }
}
