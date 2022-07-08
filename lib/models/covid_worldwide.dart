class CovidWorldwide {
  late int? cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active;

  CovidWorldwide({
    required this.cases,
    required this.active,
    required this.deaths,
    required this.recovered,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered,
  });

  factory CovidWorldwide.fromJson(Map<String, dynamic> json) {
    return CovidWorldwide(
      cases: json['cases'] ?? '',
      active: json['active'] ?? '',
      deaths: json['deaths'] ?? '',
      recovered: json['recovered'] ?? '',
      todayCases: json['todayCases'] ?? '',
      todayDeaths: json['todayDeaths'] ?? '',
      todayRecovered: json['todayRecovered'] ?? '',
    );
  }
}
