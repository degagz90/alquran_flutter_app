import 'package:get/get.dart';
import 'package:xml/xml.dart';

import '../../../data/models/quran_model.dart';
import '../../../data/providers/quran_provider.dart';

class QuranController extends GetxController {
  final quranProv = Get.find<QuranProvider>();
  Rxn<XmlDocument> quranMeta = Rxn<XmlDocument>();
  List<Surah> quranData = <Surah>[];

  Future<void> loadQuranMeta() async {
    final data = await quranProv.loadQuranMeta();
    quranMeta.value = data;
  }

  Future<void> loadQuranData() async {
    final data = await quranProv.loadSurahsData();
    quranData = data;
  }
}
