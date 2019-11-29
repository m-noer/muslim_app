import 'package:flutter/material.dart';
import 'package:muslim_app/screens/salat_page.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({Key key, this.image, this.title, this.function})
      : super(key: key);

  final String image;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Column(
        children: <Widget>[
          Container(
            height: 70.0,
            width: 70.0,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image(
                  // fit: BoxFit.fill,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(title)
        ],
      ),
    );
  }
}
