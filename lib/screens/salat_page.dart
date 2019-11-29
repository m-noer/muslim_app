import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_app/components/card_salat.dart';
import 'package:muslim_app/components/my_icon.dart';
import 'package:muslim_app/provider/salat_provider.dart';
import 'package:provider/provider.dart';

class SalatPage extends StatelessWidget {
  SalatPage({
    this.location,
    this.shurooq,
    this.dhuhr,
    this.ashr,
    this.maghrib,
    this.isha,
    this.fajr,
  });

  final String location;
  final String shurooq;
  final String dhuhr;
  final String ashr;
  final String maghrib;
  final String isha;
  final String fajr;

  @override
  Widget build(BuildContext context) {
    final salat = Provider.of<SalatProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Jadwal Shalat'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              // height: 198,
              child: ListView(
                // scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  CardSalat(
                    salat: 'Fajr',
                    salatTime: salat.items[0].fajr.split(' ')[0],
                    color: Color(0xffFAB7EAC),
                    vertical: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CardSalat(
                    salat: 'Shurooq',
                    salatTime: shurooq,
                    color: Color(0xffFFA64D),
                    vertical: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CardSalat(
                    salat: 'Dhurh',
                    salatTime: dhuhr,
                    color: Color(0xffCDE5F1),
                    vertical: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CardSalat(
                    salat: 'Ashr',
                    salatTime: ashr,
                    color: Color(0xffA8D1B3),
                    vertical: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CardSalat(
                    salat: 'Maghrib',
                    salatTime: maghrib,
                    color: Color(0xffF38273),
                    vertical: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CardSalat(
                    salat: 'Isha',
                    salatTime: isha,
                    color: Color(0xff4A2465),
                    vertical: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
