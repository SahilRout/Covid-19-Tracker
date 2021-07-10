import 'package:covid_19_tracker/datasource.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Charts extends StatelessWidget {
  final Map worlddata;
  const Charts({Key? key, required this.worlddata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PieChart'),
      ),
      body: worlddata.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF0A0E21),
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
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
                              'WORLDWIDE 🌏',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'CONFIRMED: ' +
                                            worlddata['cases'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Color(0xFFFF7575)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'ACTIVE: ' +
                                            worlddata['active'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Color(0xFF74B7FE)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'RECOVERED: ' +
                                            worlddata['recovered'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Color(0xFF56EFC3)),
                                      ),
                                      Text(
                                        'DEATHS: ' +
                                            worlddata['deaths'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Color(0xFFFFE9A8)),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF0A0E21),
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
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
                              'WORLDWIDE 🌏',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PieChart(
                              chartType: ChartType.ring,
                              dataMap: {
                                'CONFIRMED': worlddata['cases'].toDouble(),
                                'ACTIVE': worlddata['active'].toDouble(),
                                'RECOVERED': worlddata['recovered'].toDouble(),
                                'DEATHS': worlddata['deaths'].toDouble()
                              },
                              animationDuration: Duration(milliseconds: 800),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
