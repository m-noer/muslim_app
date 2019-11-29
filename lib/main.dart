import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/provider/salat_provider.dart';
import 'package:muslim_app/provider/surah_provider.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    // statusBarIconBrightness: Brightness.light,
    // statusBarBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SalatProvider>(
          create: (_) => SalatProvider(),
        ),
        ChangeNotifierProvider<SurahProvider>(
          create: (_) => SurahProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
        ),
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
