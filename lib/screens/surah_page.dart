import 'package:flutter/material.dart';
import 'package:muslim_app/provider/salat_provider.dart';
import 'package:muslim_app/provider/surah_provider.dart';
import 'package:muslim_app/screens/aya_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({Key key}) : super(key: key);

  @override
  _SurahPageState createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  bool loading = true;
  String dataEncode;

  readDataEncode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dataEncode = prefs.getString('data');
    });
  }

  restoreData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("data");
  }

  @override
  void initState() {
    readDataEncode();
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        loading = true;
      });

      Provider.of<SurahProvider>(context, listen: false)
          .getSurah(dataEncode)
          .then((_) {
        setState(() {
          loading = false;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SurahProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Al-Quran'),
      ),
      body: loading
          ? Text('loading')
          : Container(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.items.length,
                itemBuilder: (ctx, i) => CardSurah(
                  nama: data.items[i].nama,
                  asma: data.items[i].asma,
                  ayat: data.items[i].ayat,
                  arti: data.items[i].arti,
                  id: data.items[i].id,
                ),
              ),
            ),
    );
  }
}

class CardSurah extends StatelessWidget {
  const CardSurah({
    Key key,
    this.nama,
    this.asma,
    this.ayat,
    this.arti,
    this.id,
  }) : super(key: key);

  final String nama;
  final String asma;
  final int ayat;
  final String arti;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        height: 110,
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AyaPage(
                    ayaName: nama,
                    ayaNumber: ayat,
                    surahNumber: id,
                  ),
                ),
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, top: 20.0, right: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            nama,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFFA64D),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            arti,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          // Text('$ayat'),
                        ],
                      ),
                      Text(
                        asma,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFA64D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 35.0,
                height: 110.0,
                // color: Colors.orange,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0))),
                  color: Color(0xffFFA64D),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
