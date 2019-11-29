import 'package:flutter/material.dart';
import 'package:muslim_app/model/surah_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurahProvider with ChangeNotifier {
  List<SurahModel> _items;

  List<SurahModel> get items {
    return [..._items];
  }

  Future<void> getSurah(data) async {
    // extractData kita akan decode yang dari data shared prefrence
    final extractData = json.decode(data)['data'];

    _items =
        extractData.map<SurahModel>((i) => SurahModel.fromJson(i)).toList();
    notifyListeners();
  }
}
