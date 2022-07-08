import 'package:covid_info/api.dart';
import 'package:covid_info/models/covid_worldwide.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final worldwideProvider =
    StateNotifierProvider<WorldwideProvider, CovidWorldwide>(
        (ref) => WorldwideProvider());

class WorldwideProvider extends StateNotifier<CovidWorldwide> {
  WorldwideProvider()
      : super(CovidWorldwide(
            cases: null,
            active: null,
            deaths: null,
            recovered: null,
            todayCases: null,
            todayDeaths: null,
            todayRecovered: null)) {
    getWorldwide();
  }

  Future<void> getWorldwide() async {
    final dio = Dio();
    try {
      final response = await dio.get(Api.getWorldWide);
      final cases = (response.data['cases']);
      final active = (response.data['active']);
      final deaths = (response.data['deaths']);
      final recovered = (response.data['recovered']);
      final todayCases = (response.data['todayCases']);
      final todayDeaths = (response.data['todayDeaths']);
      final todayRecovered = (response.data['todayRecovered']);

      state = CovidWorldwide(
          cases: cases,
          active: active,
          deaths: deaths,
          recovered: recovered,
          todayCases: todayCases,
          todayDeaths: todayDeaths,
          todayRecovered: todayRecovered);
    } on DioError catch (err) {
      throw (err);
    }
  }
}
