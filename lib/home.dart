import 'package:covid_19_tracker/datasource.dart';
import 'package:covid_19_tracker/pages/charts.dart';
import 'package:covid_19_tracker/pages/states.dart';
import 'package:covid_19_tracker/panels/infopanel.dart';
import 'package:covid_19_tracker/panels/mosteffected.dart';
import 'package:covid_19_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchvalue = false;
  Map worlddata = {};
  fetchWorlddata() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));

    setState(() {
      worlddata = json.decode(response.body);
    });
  }

  List countrydata = [];
  fetchCountrydata() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));

    setState(() {
      countrydata = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorlddata();
    fetchCountrydata();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVID-19 TRACKER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              height: 100.0,
              color: Colors.blue[100],
              child: Center(
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      textBaseline: TextBaseline.alphabetic),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WORLDWIDE 🌏',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => States()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryBlack,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'REGIONAL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Charts(worlddata: worlddata)));
              },
              child: worlddata.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : WorldiwidePanel(data: worlddata),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Most Affected Countries 😷',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            countrydata.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Mosteffectedpanel(countryData: countrydata),
            InfoPanel(),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              '😃 We are in this together 😃'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            SizedBox(
              height: 50,
            )
          ],
        )),
      ),
    );
  }
}
