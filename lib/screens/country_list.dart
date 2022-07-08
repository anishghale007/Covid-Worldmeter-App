import 'package:covid_info/providers/countryStats_provider.dart';
import 'package:covid_info/screens/country_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Your Country',
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final dat = ref.watch(countryStatsProvider);
          return ListView(
            children: [
              SizedBox(height: 20),
              dat.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 320),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.purple,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: dat.length,
                        itemBuilder: (context, index) {
                          final country = dat[index];
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: ClipRRect(
                                    child: Container(
                                      child: Image.network(
                                        country.flag,
                                        fit: BoxFit.contain,
                                      ),
                                      height: 30,
                                      width: 30,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text(
                                    country.countryName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 30),
                                  onTap: () {
                                    Get.to(
                                        () => CountryDetails(
                                              countryName: country.countryName,
                                              flag: country.flag,
                                              cases: country.cases,
                                              todayCases: country.todayCases,
                                              todayDeaths: country.todayDeaths,
                                              todayRecovered:
                                                  country.todayRecovered,
                                              active: country.active,
                                              deaths: country.deaths,
                                            ),
                                        transition: Transition.leftToRight);
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
