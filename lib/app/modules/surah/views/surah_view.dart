import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/surah_controller.dart';
import '../widgets/ayah_widgets.dart';
import '../widgets/surah_card.dart';

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

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          controller.ScrollToAyat(controller.currentAyahNumb - 1);
        });
        return PageView.builder(
          reverse: true,
          controller: PageController(
            initialPage: controller.currentSurahNumb - 1,
          ),
          itemCount: controller.quranData.length,
          onPageChanged: (index) {
            controller.currentSurahNumb = index + 1;
            controller.currentAyahNumb = 1;
            controller.update();
          },
          itemBuilder: (context, index) {
            final surah = controller.quranData[index];
            return Scaffold(
              appBar: AppBar(
                elevation: 10,
                title: Text('${surah.numberOfSurah}. ${surah.name}'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SurahCard(surah: surah),
                    Divider(thickness: 3),
                    Expanded(
                      child: AyahWidgets(
                        surah: surah,
                        scrollC: controller.scrollC,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
