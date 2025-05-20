import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../data/models/quran_model.dart';
import '../../../data/providers/quran_provider.dart';

class SurahController extends GetxController {
  final quranProv = Get.find<QuranProvider>();
  var scrollC = AutoScrollController();
  final player = AudioPlayer();
  var tafsirVisibleList = <RxBool>[].obs;
  List<Surah> quranData = <Surah>[];
  int currentSurahNumb = 1;
  int currentAyahNumb = 1;
  bool hasScrolltoAyat = false;
  RxInt playingAyahIndex = (-1).obs;
  RxBool isPlaying = false.obs;

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

  @override
  void onClose() {
    isPlaying.value = false;
    playingAyahIndex.value = -1;
    player.stop();
    scrollC.dispose();
    player.dispose();
    super.onClose();
  }

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

  void initTafsirVisibility(int length) {
    if (tafsirVisibleList.length != length) {
      tafsirVisibleList.value = List.generate(length, (index) => false.obs);
    }
  }

  Future<void> playAudio(String url, int index) async {
    if (playingAyahIndex.value == index) {
      if (isPlaying.value) {
        isPlaying.value = false;
        await player.pause();
      } else {
        isPlaying.value = true;
        await player.play();
        if (player.playerState.processingState == ProcessingState.completed) {
          playingAyahIndex.value = -1;
        }
      }
    } else {
      ScrollToAyat(index);
      playingAyahIndex.value = index;
      isPlaying.value = true;
      try {
        await player.stop();
        await player.setUrl(url);
        await player.play();
        if (player.playerState.processingState == ProcessingState.completed) {
          playingAyahIndex.value = -1;
        }
      } catch (e) {
        print("Error playing audio: $e");
      }
    }
  }
}
