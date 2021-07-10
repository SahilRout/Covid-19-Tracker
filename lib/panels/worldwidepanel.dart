import 'package:flutter/material.dart';

class WorldiwidePanel extends StatelessWidget {
  final Map data;
  const WorldiwidePanel({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          Statuspanel(
              panelColor: Colors.red.shade100,
              textColor: Colors.red,
              title: 'CONFIRMED',
              count: data['cases'].toString()),
          Statuspanel(
            panelColor: Colors.orange.shade100,
            textColor: Colors.orange.shade900,
            title: 'ACTIVE',
            count: data['active'].toString(),
          ),
          Statuspanel(
            panelColor: Colors.green.shade100,
            textColor: Colors.green,
            title: 'RECOVERED',
            count: data['recovered'].toString(),
          ),
          Statuspanel(
            panelColor: Colors.grey.shade400,
            textColor: Colors.grey.shade900,
            title: 'DEATHS',
            count: data['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class Statuspanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  Statuspanel(
      {Key? key,
      required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(10),
        height: 80.0,
        width: width / 2,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
          color: panelColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: textColor),
            ),
            Text(
              count,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
            )
          ],
        ));
  }
}
