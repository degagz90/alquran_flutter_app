import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../data/models/quran_model.dart';
import '../../../data/providers/quran_provider.dart';

class SurahController extends GetxController {
  final quranProv = Get.find<QuranProvider>();
  var scrollC = AutoScrollController();

  List<Surah> quranData = <Surah>[];
  int currentSurahNumb = 1;
  int currentAyahNumb = 1;
  bool hasScrolltoAyat = false;

  Future<void> loadQuranData() async {
    final data = await quranProv.loadSurahsData();
    quranData = data;
  }

  void ScrollToAyat(int index) {
    scrollC.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: Duration(seconds: 1),
    );
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
