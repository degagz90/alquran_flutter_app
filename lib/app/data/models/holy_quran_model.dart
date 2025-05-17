// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

List<Surah> surahFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

String surahToJson(List<Surah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Surah {
  final String name;
  final NameTranslations nameTranslations;
  final int numberOfAyah;
  final int numberOfSurah;
  final Place place;
  final List<Recitation> recitations;
  final Type type;
  final List<Verse> verses;
  final Tafsir tafsir;

  Surah({
    required this.name,
    required this.nameTranslations,
    required this.numberOfAyah,
    required this.numberOfSurah,
    required this.place,
    required this.recitations,
    required this.type,
    required this.verses,
    required this.tafsir,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
    name: json["name"],
    nameTranslations: NameTranslations.fromJson(json["name_translations"]),
    numberOfAyah: json["number_of_ayah"],
    numberOfSurah: json["number_of_surah"],
    place: placeValues.map[json["place"]]!,
    recitations: List<Recitation>.from(
      json["recitations"].map((x) => Recitation.fromJson(x)),
    ),
    type: typeValues.map[json["type"]]!,
    verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
    tafsir: Tafsir.fromJson(json["tafsir"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "name_translations": nameTranslations.toJson(),
    "number_of_ayah": numberOfAyah,
    "number_of_surah": numberOfSurah,
    "place": placeValues.reverse[place],
    "recitations": List<dynamic>.from(recitations.map((x) => x.toJson())),
    "type": typeValues.reverse[type],
    "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
    "tafsir": tafsir.toJson(),
  };
}

class NameTranslations {
  final String ar;
  final String en;
  final String id;

  NameTranslations({required this.ar, required this.en, required this.id});

  factory NameTranslations.fromJson(Map<String, dynamic> json) =>
      NameTranslations(ar: json["ar"], en: json["en"], id: json["id"]);

  Map<String, dynamic> toJson() => {"ar": ar, "en": en, "id": id};
}

enum Place { MECCA, MEDINA }

final placeValues = EnumValues({"Mecca": Place.MECCA, "Medina": Place.MEDINA});

class Recitation {
  final RecitationName name;
  final String audioUrl;

  Recitation({required this.name, required this.audioUrl});

  factory Recitation.fromJson(Map<String, dynamic> json) => Recitation(
    name: recitationNameValues.map[json["name"]]!,
    audioUrl: json["audio_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": recitationNameValues.reverse[name],
    "audio_url": audioUrl,
  };
}

enum RecitationName {
  ABDUR_RAHMAN_AS_SUDAIS,
  MISHARI_RASHID_AL_AFASY,
  SAAD_AL_GHAMDI,
}

final recitationNameValues = EnumValues({
  "Abdur-Rahman as-Sudais": RecitationName.ABDUR_RAHMAN_AS_SUDAIS,
  "Mishari Rashid al-`Afasy": RecitationName.MISHARI_RASHID_AL_AFASY,
  "Saad al-Ghamdi": RecitationName.SAAD_AL_GHAMDI,
});

class Tafsir {
  final Id id;

  Tafsir({required this.id});

  factory Tafsir.fromJson(Map<String, dynamic> json) =>
      Tafsir(id: Id.fromJson(json["id"]));

  Map<String, dynamic> toJson() => {"id": id.toJson()};
}

class Id {
  final Kemenag kemenag;

  Id({required this.kemenag});

  factory Id.fromJson(Map<String, dynamic> json) =>
      Id(kemenag: Kemenag.fromJson(json["kemenag"]));

  Map<String, dynamic> toJson() => {"kemenag": kemenag.toJson()};
}

class Kemenag {
  final KemenagName name;
  final Source source;
  final Map<String, String> text;

  Kemenag({required this.name, required this.source, required this.text});

  factory Kemenag.fromJson(Map<String, dynamic> json) => Kemenag(
    name: kemenagNameValues.map[json["name"]]!,
    source: sourceValues.map[json["source"]]!,
    text: Map.from(json["text"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "name": kemenagNameValues.reverse[name],
    "source": sourceValues.reverse[source],
    "text": Map.from(text).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

enum KemenagName { KEMENAG }

final kemenagNameValues = EnumValues({"Kemenag": KemenagName.KEMENAG});

enum Source { APLIKASI_QURAN_KEMENTRIAN_AGAMA_REPUBLIK_INDONESIA }

final sourceValues = EnumValues({
  "Aplikasi Quran Kementrian Agama Republik Indonesia":
      Source.APLIKASI_QURAN_KEMENTRIAN_AGAMA_REPUBLIK_INDONESIA,
});

enum Type { MADANIYAH, MAKKIYAH }

final typeValues = EnumValues({
  "Madaniyah": Type.MADANIYAH,
  "Makkiyah": Type.MAKKIYAH,
});

class Verse {
  final int number;
  final String text;
  final String translationEn;
  final String translationId;

  Verse({
    required this.number,
    required this.text,
    required this.translationEn,
    required this.translationId,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
    number: json["number"],
    text: json["text"],
    translationEn: json["translation_en"],
    translationId: json["translation_id"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "text": text,
    "translation_en": translationEn,
    "translation_id": translationId,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
