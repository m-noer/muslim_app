import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app/model/audio_model.dart';

class AudioProvider with ChangeNotifier {
  var item;

  getAudio(surah, ayah) async {
    final url = 'http://api.alquran.cloud/v1/ayah/$surah:$ayah/ar.alafasy';
    final response = await http.get(url);

    final extractData = json.decode(response.body);

    item = extractData;
    notifyListeners();
  }
}
