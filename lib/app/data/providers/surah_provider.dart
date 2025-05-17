import 'package:get/get.dart';
import 'package:quran/app/data/models/surah_model.dart';

class SurahProvider extends GetConnect {
  Future<List<Surah>> getData() async {
    final response = await get('https://quran-api-id.vercel.app/surahs');
    return Surah.listFromJson(response.body);
  }
}
