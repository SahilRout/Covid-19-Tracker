import 'package:covid_19_tracker/datasource.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatesCharts extends StatelessWidget {
  final List statedata;
  final int index;
  const StatesCharts({Key? key, required this.statedata, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      appBar: AppBar(
        title: Text('PieChart'),
      ),
      body: statedata.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                  color: Colors.blueGrey.shade500,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          statedata[index]['loc'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      PieChart(
                        chartType: ChartType.ring,
                        dataMap: {
                          'CONFIRMED':
                              statedata[index]['totalConfirmed'].toDouble(),
                          // 'ACTIVE': statedata[index]['active'].toDouble(),
                          'RECOVERED':
                              statedata[index]['discharged'].toDouble(),
                          'DEATHS': statedata[index]['deaths'].toDouble()
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
