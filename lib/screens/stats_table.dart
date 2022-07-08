import 'package:covid_info/providers/countryStats_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsTable extends StatefulWidget {
  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats Table'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          FittedBox(
            child: Consumer(
              builder: (context, ref, child) {
                final dat = ref.watch(countryStatsProvider);
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('Country'),
                      ),
                      DataColumn(
                        label: Text('New Cases'),
                      ),
                      DataColumn(
                        label: Text('New Deaths'),
                      ),
                      DataColumn(
                        label: Text('Total Cases'),
                      ),
                    ],
                    rows: List.generate(
                      dat.length,
                      (index) {
                        final country = dat[index];
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(country.countryName),
                            ),
                            DataCell(
                              Text(country.todayCases.toString()),
                            ),
                            DataCell(
                              Text(country.todayDeaths.toString()),
                            ),
                            DataCell(
                              Text(country.cases.toString()),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// DataTable(
// columns: [
// DataColumn(
// label: Text('Name'),
// ),
// DataColumn(
// label: Text('Age'),
// ),
// ],
// rows: [
// DataRow(
// cells: [
// DataCell(
// Text('Anish'),
// ),
// DataCell(
// Text('22'),
// ),
// ],
// ),
// DataRow(
// cells: [
// DataCell(
// Text('Anish'),
// ),
// DataCell(
// Text('22'),
// ),
// ],
// ),
// ],
// );
