import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quran/app/routes/app_pages.dart';

import '../../../data/models/quran_model.dart';

class ViewSurah extends StatelessWidget {
  final List<Surah> listSurah;
  const ViewSurah({required this.listSurah, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listSurah.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                final int surahNumb = listSurah[index].numberOfSurah;
                Get.toNamed(
                  Routes.SURAH,
                  arguments: {'surahNumb': surahNumb, 'ayahNumb': 1},
                );
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/surah_number.png'),
                child: Text(
                  NumberFormat.decimalPattern(
                    'EN',
                  ).format(listSurah[index].numberOfSurah),
                  style: TextStyle(
                    fontFamily: 'Quran2',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    listSurah[index].name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '(${listSurah[index].nameTranslations.id})',
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              subtitle: Text(
                '${listSurah[index].type.name.capitalizeFirst} • ${listSurah[index].numberOfAyah} Ayat',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              trailing: Text(
                listSurah[index].nameTranslations.ar,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Quran',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(thickness: 3),
          ],
        );
      },
    );
  }
}
