// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
  final int number;
  final int numberOfAyahs;
  final String name;
  final String translation;
  final String revelation;
  final String description;
  final String audio;

  Surah({
    required this.number,
    required this.numberOfAyahs,
    required this.name,
    required this.translation,
    required this.revelation,
    required this.description,
    required this.audio,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
    number: json["number"],
    numberOfAyahs: json["numberOfAyahs"],
    name: json["name"],
    translation: json["translation"],
    revelation: json["revelation"],
    description: json["description"],
    audio: json["audio"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "numberOfAyahs": numberOfAyahs,
    "name": name,
    "translation": translation,
    "revelation": revelation,
    "description": description,
    "audio": audio,
  };
  static List<Surah> listFromJson(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => Surah.fromJson(e)).toList();
  }
}
