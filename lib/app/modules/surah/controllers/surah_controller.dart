import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:flutter/material.dart';
import '../../../data/models/quran_model.dart';
import '../../../data/providers/quran_provider.dart';

class SurahController extends GetxController {
  final quranProv = Get.find<QuranProvider>();
  AutoScrollController scrollC = AutoScrollController();
  List<GlobalKey> itemKeys = [];
  List<Surah> quranData = <Surah>[];
  int currentSurahNumb = 1;
  int currentAyahNumb = 1;
  bool hasScrolledToAyah = false;
  var tafsirVisibleList = <bool>[].obs;

  Future<void> loadQuranData() async {
    final data = await quranProv.loadSurahsData();
    quranData = data;
  }

  void jumpToAyat(int index) {
    final context = itemKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 300),
        alignment: 0.0,
      );
    }
  }

  @override
  void onInit() {
    currentSurahNumb = Get.arguments['surahNumb'];
    currentAyahNumb = Get.arguments['ayahNumb'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
