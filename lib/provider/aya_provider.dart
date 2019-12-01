import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app/model/aya_model.dart';

class AyaProvider with ChangeNotifier {
  List<AyaModel> _items;

  List<AyaModel> get items {
    return [..._items];
  }

  Future<void> getAya(int surah, int numberAyat) async {
    final url =
        'https://quran.kemenag.go.id/index.php/api/v1/ayatweb/$surah/0/0/$numberAyat';
    final response = await http.get(url);
    final extractData = json.decode(response.body)['data'];

    _items = extractData.map<AyaModel>((i) => AyaModel.fromJson(i)).toList();

    notifyListeners();
  }
}
