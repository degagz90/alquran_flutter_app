import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:quran/app/data/models/quran_model.dart';

class SurahCard extends StatelessWidget {
  final Surah surah;
  const SurahCard({required this.surah, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(height: 200),
        SizedBox(
          height: 190,
          width: 400,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            child: Image.asset('assets/images/frame_33.png', fit: BoxFit.fill),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
                '${surah.name}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '${surah.nameTranslations.ar}',
                style: TextStyle(
                  fontFamily: 'Quran2',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '(${surah.nameTranslations.id})',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '${surah.type.name.capitalizeFirst} • ${surah.numberOfAyah} Ayat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
