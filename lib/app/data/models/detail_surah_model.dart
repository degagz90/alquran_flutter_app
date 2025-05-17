// To parse this JSON data, do
//
//     final detailSurah = detailSurahFromJson(jsonString);

import 'dart:convert';

DetailSurah detailSurahFromJson(String str) =>
    DetailSurah.fromJson(json.decode(str));

String detailSurahToJson(DetailSurah data) => json.encode(data.toJson());

class DetailSurah {
  final Bismillah bismillah;
  final List<Ayah> ayahs;

  DetailSurah({required this.bismillah, required this.ayahs});

  factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
    bismillah: Bismillah.fromJson(json["bismillah"]),
    ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bismillah": bismillah.toJson(),
    "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
  };
  static List<DetailSurah> listFromJson(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => DetailSurah.fromJson(e)).toList();
  }
}

class Ayah {
  final Number number;
  final String arab;
  final String translation;
  final Audio audio;
  final Tafsir tafsir;
  final Meta meta;

  Ayah({
    required this.number,
    required this.arab,
    required this.translation,
    required this.audio,
    required this.tafsir,
    required this.meta,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
    number: Number.fromJson(json["number"]),
    arab: json["arab"],
    translation: json["translation"],
    audio: Audio.fromJson(json["audio"]),
    tafsir: Tafsir.fromJson(json["tafsir"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "number": number.toJson(),
    "arab": arab,
    "translation": translation,
    "audio": audio.toJson(),
    "tafsir": tafsir.toJson(),
    "meta": meta.toJson(),
  };
}

class Audio {
  final String alafasy;
  final String ahmedajamy;
  final String husarymujawwad;
  final String minshawi;
  final String muhammadayyoub;
  final String muhammadjibreel;

  Audio({
    required this.alafasy,
    required this.ahmedajamy,
    required this.husarymujawwad,
    required this.minshawi,
    required this.muhammadayyoub,
    required this.muhammadjibreel,
  });

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
    alafasy: json["alafasy"],
    ahmedajamy: json["ahmedajamy"],
    husarymujawwad: json["husarymujawwad"],
    minshawi: json["minshawi"],
    muhammadayyoub: json["muhammadayyoub"],
    muhammadjibreel: json["muhammadjibreel"],
  );

  Map<String, dynamic> toJson() => {
    "alafasy": alafasy,
    "ahmedajamy": ahmedajamy,
    "husarymujawwad": husarymujawwad,
    "minshawi": minshawi,
    "muhammadayyoub": muhammadayyoub,
    "muhammadjibreel": muhammadjibreel,
  };
}

class Meta {
  final int juz;
  final int page;
  final int manzil;
  final int ruku;
  final int hizbQuarter;
  final Sajda sajda;

  Meta({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    juz: json["juz"],
    page: json["page"],
    manzil: json["manzil"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    sajda: Sajda.fromJson(json["sajda"]),
  );

  Map<String, dynamic> toJson() => {
    "juz": juz,
    "page": page,
    "manzil": manzil,
    "ruku": ruku,
    "hizbQuarter": hizbQuarter,
    "sajda": sajda.toJson(),
  };
}

class Sajda {
  final bool recommended;
  final bool obligatory;

  Sajda({required this.recommended, required this.obligatory});

  factory Sajda.fromJson(Map<String, dynamic> json) =>
      Sajda(recommended: json["recommended"], obligatory: json["obligatory"]);

  Map<String, dynamic> toJson() => {
    "recommended": recommended,
    "obligatory": obligatory,
  };
}

class Number {
  final int inQuran;
  final int inSurah;

  Number({required this.inQuran, required this.inSurah});

  factory Number.fromJson(Map<String, dynamic> json) =>
      Number(inQuran: json["inQuran"], inSurah: json["inSurah"]);

  Map<String, dynamic> toJson() => {"inQuran": inQuran, "inSurah": inSurah};
}

class Tafsir {
  final Kemenag kemenag;
  final String quraish;
  final String jalalayn;

  Tafsir({
    required this.kemenag,
    required this.quraish,
    required this.jalalayn,
  });

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
    kemenag: Kemenag.fromJson(json["kemenag"]),
    quraish: json["quraish"],
    jalalayn: json["jalalayn"],
  );

  Map<String, dynamic> toJson() => {
    "kemenag": kemenag.toJson(),
    "quraish": quraish,
    "jalalayn": jalalayn,
  };
}

class Kemenag {
  final String short;
  final String long;

  Kemenag({required this.short, required this.long});

  factory Kemenag.fromJson(Map<String, dynamic> json) =>
      Kemenag(short: json["short"], long: json["long"]);

  Map<String, dynamic> toJson() => {"short": short, "long": long};
}

class Bismillah {
  final String arab;
  final String translation;
  final Audio audio;

  Bismillah({
    required this.arab,
    required this.translation,
    required this.audio,
  });

  factory Bismillah.fromJson(Map<String, dynamic> json) => Bismillah(
    arab: json["arab"],
    translation: json["translation"],
    audio: Audio.fromJson(json["audio"]),
  );

  Map<String, dynamic> toJson() => {
    "arab": arab,
    "translation": translation,
    "audio": audio.toJson(),
  };
}
