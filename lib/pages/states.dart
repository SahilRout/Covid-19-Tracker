import 'dart:convert';

import 'package:covid_19_tracker/pages/search.dart';
import 'package:covid_19_tracker/pages/stateschart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class States extends StatefulWidget {
  States({Key? key}) : super(key: key);

  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  List stateData = [];
  fetchstateData() async {
    http.Response response = await http
        .get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));

    setState(() {
      stateData = jsonDecode(response.body)['data']['regional'];
    });
  }

  @override
  void initState() {
    fetchstateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(stateData));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Regional Stats'),
      ),
      body: stateData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: stateData.isEmpty ? 0 : stateData.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatesCharts(
                                  statedata: stateData,
                                  index: index,
                                )));
                  },
                  child: Card(
                    child: Container(
                      height: 130,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 80.0,
                            width: width / 2,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
                                )
                              ],
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              stateData[index]['loc'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Circular',
                                  fontSize: 20.0),
                            )),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CONFIRMED:' +
                                      stateData[index]['totalConfirmed']
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 15.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'RECOVERED:' +
                                      stateData[index]['discharged'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 15.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'DEATHS:' +
                                      stateData[index]['deaths'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Circular',
                                      color: Colors.grey[900],
                                      fontSize: 15.0),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
