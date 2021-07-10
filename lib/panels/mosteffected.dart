import 'package:flutter/material.dart';

class Mosteffectedpanel extends StatelessWidget {
  final List countryData;
  const Mosteffectedpanel({Key? key, required this.countryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Image.network(
                      countryData[index]['countryInfo']['flag'],
                      height: 25,
                    ),
                  ),
                  Text(
                    countryData[index]['country'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Container(
                    child: Text(
                      'Active Cases : ' +
                          countryData[index]['active'].toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
