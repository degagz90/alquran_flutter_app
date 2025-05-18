import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/quran_model.dart';

class ViewJuz extends StatelessWidget {
  final List<Map<String, int>> item;
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
            final indexSurah = listSurah.indexWhere(
              (surah) => surah.numberOfSurah == item[index]['sura'],
            );
            return ListTile(
              onTap: () {},
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
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mulai dari:', style: TextStyle(fontSize: 12)),
                  Text(
                    '${listSurah[indexSurah].name} - Ayat: ${item[index]['aya']}',
                  ),
                ],
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
