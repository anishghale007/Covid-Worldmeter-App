class CovidCountry {
  late String countryName, flag;
  late int cases, deaths, todayCases, todayDeaths, todayRecovered, active;

  CovidCountry(
      {required this.countryName,
      required this.flag,
      required this.cases,
      required this.todayCases,
      required this.todayDeaths,
      required this.todayRecovered,
      required this.active,
      required this.deaths});

  factory CovidCountry.fromJson(Map<String, dynamic> json) {
    return CovidCountry(
      countryName: json['country'] ?? '',
      flag: json['countryInfo']['flag'] ?? '',
      cases: json['cases'],
      todayCases: json['todayCases'],
      todayDeaths: json['todayDeaths'],
      todayRecovered: json['todayRecovered'],
      active: json['active'],
      deaths: json['deaths'],
    );
  }
}
