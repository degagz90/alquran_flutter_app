import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quran/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/models/quran_model.dart';

class ViewJuz extends StatelessWidget {
  final List<Map<String, int>> item; //juz, manzil, dll
  final List<Surah> listSurah;
  final String keyword;
  const ViewJuz({
    required this.item,
    required this.listSurah,
    required this.keyword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            final indexSurah = item[index]['sura']! - 1;
            return ListTile(
              onTap: () {
                Get.toNamed(
                  Routes.SURAH,
                  arguments: {
                    'surahNumb': item[index]['sura'],
                    'ayahNumb': item[index]['aya'],
                  },
                );
              },
              isThreeLine: true,
              style: ListTileStyle.list,
              titleAlignment: ListTileTitleAlignment.center,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                backgroundImage: AssetImage('assets/images/surah_number.png'),
                child: Text(
                  NumberFormat.decimalPattern(
                    'EN',
                  ).format(item[index]['index']),
                  style: TextStyle(
                    fontFamily: 'Quran2',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                '$keyword ${item[index]['index']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Mulai dari: ${listSurah[indexSurah].name} - Ayat: ${item[index]['aya']}',
              ),
              trailing: Icon(
                Icons.navigate_next_rounded,
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        );
      },
    );
  }
}
