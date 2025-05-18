import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quran_controller.dart';
import '../widgets/Juz_tab.dart';
import '../widgets/quran_tab.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('QuranView'), centerTitle: true),
        body: FutureBuilder(
          future: Future.wait([
            controller.loadQuranMeta(),
            controller.loadQuranData(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              //final listSurah = controller.quranData;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return <Widget>[
                      SliverToBoxAdapter(
                        child: SizedBox(height: 200, child: Placeholder()),
                      ),
                      SliverAppBar(
                        pinned: true,
                        automaticallyImplyLeading: false,
                        elevation: 3,
                        toolbarHeight: 0,
                        bottom: TabBar(
                          dividerColor: Colors.grey[300],
                          tabs: [Tab(text: 'Surat'), Tab(text: 'Juz')],
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      ViewSurah(listSurah: controller.quranData),
                      Builder(
                        builder: (context) {
                          final listJuz = controller.findListXml('juz');
                          return ViewJuz(
                            item: listJuz,
                            listSurah: controller.quranData,
                            keyword: 'Juz',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
