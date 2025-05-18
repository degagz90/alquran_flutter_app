import 'package:get/get.dart';
import 'package:xml/xml.dart';

import '../../../data/models/quran_model.dart';
import '../../../data/providers/quran_provider.dart';

class QuranController extends GetxController {
  final quranProv = Get.find<QuranProvider>();
  XmlDocument quranMeta = XmlDocument();
  List<Surah> quranData = <Surah>[];
  List<Map<String, int>> ListJuz = [];

  Future<void> loadQuranMeta() async {
    final data = await quranProv.loadQuranMeta();
    quranMeta = data;
  }

  Future<void> loadQuranData() async {
    final data = await quranProv.loadSurahsData();
    quranData = data;
  }

  List<Map<String, int>> findListXml(String keyword) {
    final element = quranMeta.findAllElements(keyword);
    List<Map<String, int>> result = [];
    for (var child in element) {
      final index = int.parse(child.getAttribute('index')!);
      final sura = int.parse(child.getAttribute('sura')!);
      final aya = int.parse(child.getAttribute('aya')!);
      result.add({'index': index, 'sura': sura, 'aya': aya});
    }
    return result;
  }
}
