import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  const SurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.loadQuranData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        var surah = controller.quranData[controller.currentSurahNumb - 1];
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          controller.scrollC.scrollToIndex(
            controller.currentAyahNumb - 1,
            preferPosition: AutoScrollPosition.begin,
            duration: Duration(milliseconds: 50),
          );
        });
        return Scaffold(
          appBar: AppBar(
            elevation: 10,
            title: Text('${surah.numberOfSurah}. ${surah.name}'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(height: 320),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/frame_33.png'),
                        ),
                      ),
                      height: 300,
                      width: 400,
                      child: Card(elevation: 10, child: Text('halo')),
                    ),
                  ],
                ),
                Divider(thickness: 3),
                Expanded(
                  child: ListView.separated(
                    itemCount: surah.verses.length,
                    controller: controller.scrollC,
                    separatorBuilder: (context, index) => Divider(thickness: 3),
                    itemBuilder: (context, index) {
                      var tafsirVisible = false.obs;
                      return AutoScrollTag(
                        controller: controller.scrollC,
                        key: ValueKey(index),
                        index: index,
                        child: Column(
                          children: [
                            ListTile(
                              titleAlignment:
                                  ListTileTitleAlignment.titleHeight,
                              leading: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                backgroundImage: AssetImage(
                                  'assets/images/end_of_ayah.png',
                                ),
                                child: Text(
                                  NumberFormat.decimalPattern(
                                    'en',
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
                              color: Theme.of(
                                context,
                              ).primaryColor.withAlpha(30),
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 10),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.play_circle_outline),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.copy),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.share),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 100,
                                    child: TextButton.icon(
                                      onPressed: () {
                                        tafsirVisible.value =
                                            !tafsirVisible.value;
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
                                visible: tafsirVisible.value,
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
                                          tafsirVisible.value =
                                              !tafsirVisible.value;
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
