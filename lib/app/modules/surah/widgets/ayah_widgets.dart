import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quran/app/modules/surah/controllers/surah_controller.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../data/models/quran_model.dart';

class AyahWidgets extends StatelessWidget {
  final controller = Get.find<SurahController>();
  final Surah surah;
  AyahWidgets({required this.surah, super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: surah.verses.length,
      controller: controller.scrollC,
      separatorBuilder: (context, index) => Divider(thickness: 3),
      itemBuilder: (context, index) {
        final formater = NumberFormat('000');
        final String ayatAudioUrl =
            'https://static.qurano.com/dist/audio/${formater.format(surah.numberOfSurah)}${formater.format(surah.verses[index].number)}.mp3';
        return AutoScrollTag(
          controller: controller.scrollC,
          key: ValueKey(index),
          index: index,
          highlightColor: Colors.deepPurple.withAlpha(100),
          child: Column(
            children: [
              ListTile(
                titleAlignment: ListTileTitleAlignment.titleHeight,
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  backgroundImage: AssetImage('assets/images/end_of_ayah.png'),
                  child: Text(
                    NumberFormat.decimalPattern(
                      'fa',
                    ).format(surah.verses[index].number),
                    style: TextStyle(
                      fontFamily: 'Quran2',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  textAlign: TextAlign.right,
                  surah.verses[index].text,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Quran',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(surah.verses[index].translationId),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Theme.of(context).primaryColor.withAlpha(100),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),

                        IconButton(
                          onPressed: () {
                            controller.playAudio(ayatAudioUrl, index);
                          },
                          icon: Obx(
                            () => Icon(
                              controller.playingAyahIndex.value == index &&
                                      controller.isPlaying.value
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ),

                        IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_outline),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                      ],
                    ),
                    Container(
                      width: 100,
                      child: TextButton.icon(
                        onPressed: () {
                          controller.tafsirVisibleList[index].value =
                              !controller.tafsirVisibleList[index].value;
                        },
                        iconAlignment: IconAlignment.end,
                        label: Text('Tafsir:'),
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.tafsirVisibleList[index].value,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${surah.tafsir.id.kemenag.text['${index + 1}'] ?? ''} \n(Sumber: Kemenag Id)',
                        ),
                        TextButton(
                          onPressed: () {
                            controller.tafsirVisibleList[index].value =
                                !controller.tafsirVisibleList[index].value;
                          },
                          child: Text('(Close)'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
