import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_app/components/card_salat.dart';
import 'package:muslim_app/components/my_icon.dart';
import 'package:muslim_app/provider/salat_provider.dart';
import 'package:muslim_app/provider/surah_provider.dart';
import 'package:muslim_app/screens/dawah_page.dart';
import 'package:muslim_app/screens/salat_page.dart';
import 'package:muslim_app/screens/surah_page.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = prefs.getString('city') ?? "${place.subLocality}";
      });

      await prefs.setString('city', _currentAddress);
    } catch (e) {
      print(e);
    }
  }

  readAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentAddress = prefs.getString('city');
    });
  }

  String dataEncode;

  dataUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = 'https://quran.kemenag.go.id/index.php/api/v1/surat/0/114';
    final response = await http.get(url);
    setState(() {
      dataEncode = prefs.getString('data') ?? response.body;
    });
    await prefs.setString('data', dataEncode);
  }

  static DateTime now = DateTime.now();

  final int time = now.hour * 60 + now.minute;

  bool loading = true;

  @override
  void initState() {
    // _getCurrentLocation();
    dataUrl();
    readAddress();
    Future.delayed(Duration(seconds: 2)).then((_) {
      setState(() {
        loading = true;
      });

      Provider.of<SalatProvider>(context, listen: false)
          .getSalat(_currentAddress)
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
    final salat = Provider.of<SalatProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AutoSizeText(
                'Today',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3D3D3D),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _getCurrentLocation();

                  Future.delayed(Duration(seconds: 5)).then((_) {
                    setState(() {
                      loading = true;
                    });

                    Provider.of<SalatProvider>(context, listen: false)
                        .getSalat(_currentAddress)
                        .then((_) {
                      setState(() {
                        loading = false;
                      });
                    });
                  });
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      color: Colors.deepOrangeAccent,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    AutoSizeText(
                      _currentAddress == null
                          ? 'set location'
                          : _currentAddress,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3D3D3D),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              height: 198,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  CardSalat(
                    salat: 'Shurooq',
                    salatTime:
                        loading ? '...' : salat.items[0].shurooq.split(' ')[0],
                    color: Color(0xffFFA64D),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CardSalat(
                    salat: 'Dhurh',
                    salatTime:
                        loading ? '...' : salat.items[0].dhuhr.split(' ')[0],
                    color: Color(0xffCDE5F1),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CardSalat(
                    salat: 'Ashr',
                    salatTime: loading
                        ? '...'
                        : '${int.parse(salat.items[0].asr.split(' ')[0].split(':')[0]) + 1}:${int.parse(salat.items[0].asr.split(' ')[0].split(':')[1])}',
                    color: Color(0xffA8D1B3),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CardSalat(
                    salat: 'Maghrib',
                    salatTime:
                        loading ? '...' : salat.items[0].maghrib.split(' ')[0],
                    color: Color(0xffF38273),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CardSalat(
                    salat: 'Isha',
                    salatTime:
                        loading ? '...' : salat.items[0].isha.split(' ')[0],
                    color: Color(0xff4A2465),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CardSalat(
                    salat: 'Fajr',
                    salatTime:
                        loading ? '...' : salat.items[0].fajr.split(' ')[0],
                    color: Color(0xffFAB7EAC),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyIcon(
                  image: 'assets/icons/010-prayer.png',
                  title: 'Shalat',
                  function: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SalatPage(
                          location: _currentAddress,
                          shurooq: loading
                              ? 'loading'
                              : salat.items[0].shurooq.split(' ')[0],
                          dhuhr: loading
                              ? 'loading'
                              : salat.items[0].dhuhr.split(' ')[0],
                          ashr: loading
                              ? 'loading'
                              : '${int.parse(salat.items[0].asr.split(' ')[0].split(':')[0]) + 1}:${int.parse(salat.items[0].asr.split(' ')[0].split(':')[1])}',
                          maghrib: loading
                              ? 'loading'
                              : salat.items[0].maghrib.split(' ')[0],
                          isha: loading
                              ? 'loading'
                              : salat.items[0].isha.split(' ')[0],
                          fajr: loading
                              ? 'loading'
                              : salat.items[0].fajr.split(' ')[0],
                        ),
                      )),
                ),
                MyIcon(
                  image: 'assets/icons/012-quran-1.png',
                  title: 'Quran',
                  function: () {
                    // dataUrl();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SurahPage()));
                  },
                ),
                MyIcon(
                  image: 'assets/icons/006-muslim-1.png',
                  title: 'Ustadz',
                ),
                MyIcon(
                  image: 'assets/icons/021-gift.png',
                  title: 'Infaq',
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyIcon(
                  image: 'assets/icons/017-salat.png',
                  title: 'Doa',
                ),
                MyIcon(
                  image: 'assets/icons/028-quran.png',
                  title: 'Hadist',
                ),
                MyIcon(
                  image: 'assets/icons/011-tasbih.png',
                  title: 'Tasbih',
                ),
                MyIcon(
                  image: 'assets/icons/016-mosque-2.png',
                  title: 'Masjid',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => print('object'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Featured',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5d5d5d),
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xffFFA64D),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DawahPage())),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      elevation: 4,
                      color: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              width: MediaQuery.of(context).size.width * .3,
                              image:
                                  AssetImage('assets/icons/005-muslim-2.png'),
                            ),
                            Expanded(
                              child: AutoSizeText(
                                'Apakah Syariat Cadar Bertentangan dengan Perintah untuk Saling Mengenal?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff3d3d3d),
                                ),
                                minFontSize: 12,
                                maxLines: 4,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    right: 20,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Color(0xffFFA64D),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Text(
                          'Daily Da`wah',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
