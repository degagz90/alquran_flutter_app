import 'package:get/get.dart';
import 'package:quran/app/data/models/detail_surah_model.dart';

class DetailSurahProvider extends GetConnect {
  Future<List<DetailSurah>> getData(int id) async {
    final response = await get('https://quran-api-id.vercel.app/surahs/$id');
    return DetailSurah.listFromJson(response.body);
  }
}
