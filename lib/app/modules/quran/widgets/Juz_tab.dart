import 'package:flutter/material.dart';
import '../../../data/models/quran_model.dart';
import 'package:intl/intl.dart';

class ViewJuz extends StatelessWidget {
  final List<Map<String, int>> item;
  final List<Surah> listSurah;
  const ViewJuz({required this.item, required this.listSurah, super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GridView.builder(
          itemCount: item.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.8 / 1,
          ),
          itemBuilder: (context, index) {
            final indexSurah = listSurah.indexWhere(
              (surah) => surah.numberOfSurah == item[index]['sura'],
            );
            return ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              onTap: () {},
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
                'Juz ${item[index]['index']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mulai dari:', style: TextStyle(fontSize: 12)),
                  Text(
                    '${listSurah[indexSurah].name} - Ayat: ${item[index]['aya']}',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
