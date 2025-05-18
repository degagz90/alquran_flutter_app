import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:xml/xml.dart';

import '../models/quran_model.dart';

class QuranProvider extends GetConnect {
  Future<XmlDocument> loadQuranMeta() async {
    final xmlString = await rootBundle.loadString('assets/meta/quran_meta.xml');
    final XmlDocument document = XmlDocument.parse(xmlString);
    return document;
  }

  Future<List<Surah>> loadSurahsData() async {
    final jsonString = await rootBundle.loadString('assets/json/quran.json');
    final List<Surah> surahs = surahFromJson(jsonString);
    return surahs;
  }
}
