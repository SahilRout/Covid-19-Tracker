import 'package:covid_19_tracker/datasource.dart';
import 'package:covid_19_tracker/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular', primaryColor: primaryBlack),
      home: HomePage(),
    );
  }
}
