import 'package:covid_info/api.dart';
import 'package:covid_info/models/covid_country.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryStatsProvider =
    StateNotifierProvider<CountryStatsProvider, List<CovidCountry>>(
        (ref) => CountryStatsProvider());

class CountryStatsProvider extends StateNotifier<List<CovidCountry>> {
  CountryStatsProvider() : super([]) {
    getCountryStats();
  }

  Future<void> getCountryStats() async {
    final dio = Dio();
    try {
      final response = await dio.get(Api.getCountries);
      state =
          (response.data as List).map((e) => CovidCountry.fromJson(e)).toList();
    } on DioError catch (err) {
      throw err;
    }
  }
}
