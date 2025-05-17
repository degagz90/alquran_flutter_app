import 'package:get/get.dart';
import 'package:xml/xml.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuranController extends GetxController {
  late XmlDocument document;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadQuranMeta() async {
    final xmlString = await rootBundle.loadString('assets/meta/quran_meta.xml');
    document = XmlDocument.parse(xmlString);
  }

  List<Map<String, String?>> getSurahList() {
    final surahsElement = document.findAllElements('suras').first;
    final surahs = surahsElement.findElements('sura');
    return surahs.map((sura) {
      return {
        'index': sura.getAttribute("index"),
        "name": sura.getAttribute('name'),
        'tname': sura.getAttribute('tname'),
      };
    }).toList();
  }

  List<Map<String, String?>> getJuzList() {
    final surahsElement = document.findAllElements('juzs').first;
    final surahs = surahsElement.findElements('juz');
    return surahs.map((sura) {
      return {
        'index': sura.getAttribute("index"),
        "sura": sura.getAttribute('sura'),
        'aya': sura.getAttribute('aya'),
      };
    }).toList();
  }
}
