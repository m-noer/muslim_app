import 'package:flutter/material.dart';

class CardSalat extends StatelessWidget {
  const CardSalat({
    Key key,
    this.salat,
    this.salatTime,
    this.color,
    this.vertical = false,
  }) : super(key: key);

  final String salat;
  final String salatTime;
  final Color color;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          // margin: EdgeInsets.only(left: 0.0),
          child: Card(
            elevation: 8,
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 180.0,
            ),
          ),
        ),
        Positioned(
          bottom: vertical ? 3 : 14,
          right: 0,
          left: 60,
          child: Container(
            height: 160.0,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/mosque.png'),
            ),
          ),
        ),
        Positioned(
          top: 24,
          left: 36,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                salat,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                salatTime,
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
