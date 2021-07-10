import 'dart:ui';

import 'package:covid_19_tracker/datasource.dart';
import 'package:flutter/material.dart';

class FAQpage extends StatelessWidget {
  const FAQpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              DataSource.questionAnswers[index]['question'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  DataSource.questionAnswers[index]['answer'],
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
