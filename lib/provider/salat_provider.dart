import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/salat_model.dart';

class SalatProvider with ChangeNotifier {
  List<SalatModel> _item;

  List<SalatModel> get items {
    return [..._item];
  }

  Future<void> getSalat(String city) async {
    final url = 'https://muslimsalat.com/$city/daily.json';

    final response = await http.get(url);
    final extractData = json.decode(response.body)['items'];

    _item = extractData.map<SalatModel>((i) => SalatModel.fromJson(i)).toList();

    notifyListeners();
  }
}
