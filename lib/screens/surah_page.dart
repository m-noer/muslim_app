import 'package:flutter/material.dart';
import 'package:muslim_app/provider/salat_provider.dart';
import 'package:muslim_app/provider/surah_provider.dart';
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
    final salat = Provider.of<SurahProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Consumer<SurahProvider>(
          builder: (ctx, data, _) => ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.items.length,
            itemBuilder: (ctx, i) => Text(
              '${data.items[i].asma}',
              style: TextStyle(fontSize: 26.0),
            ),
          ),
        ),
      ),
    );
  }
}
