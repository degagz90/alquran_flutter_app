import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/quran_controller.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QuranView'), centerTitle: true),
      body: FutureBuilder(
        future: controller.loadQuranMeta(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final juzList = controller.getJuzList();
          return ListView.builder(
            itemCount: juzList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(juzList[index]['sura'] ?? ''),
                subtitle: Text(juzList[index]['aya'] ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
