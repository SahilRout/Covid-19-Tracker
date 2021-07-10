import 'package:covid_19_tracker/datasource.dart';
import 'package:covid_19_tracker/pages/stateschart.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/pages/stateschart.dart';

class Search extends SearchDelegate {
  final List stateData;

  Search(this.stateData);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final suggestionList = query.isEmpty
        ? stateData
        : stateData
            .where((element) => element['loc'].toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
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
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      suggestionList[index]['loc'],
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
                              suggestionList[index]['totalConfirmed']
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
                              suggestionList[index]['discharged'].toString(),
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
                              suggestionList[index]['deaths'].toString(),
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
    );
  }
}
