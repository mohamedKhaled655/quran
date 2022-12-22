/*
class SurahModel {
  SurahModel({
    required this.code,
    required this.status,
    required this.data,
  });
  late final int code;
  late final String status;
  late final Data data;
  
  SurahModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

 
}

class Data {
  Data({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
    required this.ayahs,
    required this.edition,
  });
  late final int number;
  late final String name;
  late final String englishName;
  late final String englishNameTranslation;
  late final String revelationType;
  late final int numberOfAyahs;
  late final List<Ayahs> ayahs;
  late final Edition edition;
  
  Data.fromJson(Map<String, dynamic> json){
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
    ayahs = List.from(json['ayahs']).map((e)=>Ayahs.fromJson(e)).toList();
    edition = Edition.fromJson(json['edition']);
  }

  
}

class Ayahs {
  Ayahs({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });
  late final int number;
  late final String text;
  late final int numberInSurah;
  late final int juz;
  late final int manzil;
  late final int page;
  late final int ruku;
  late final int hizbQuarter;
  late final bool sajda;
  
  Ayahs.fromJson(Map<String, dynamic> json){
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

 
}

class Edition {
  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
    required this.direction,
  });
  late final String identifier;
  late final String language;
  late final String name;
  late final String englishName;
  late final String format;
  late final String type;
  late final String direction;
  
  Edition.fromJson(Map<String, dynamic> json){
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }


}
*/
class SurahModel {
  SurahModel({
    required this.verses,
    required this.meta,
  });
  late final List<Verses> verses;
  late final Meta meta;
  
  SurahModel.fromJson(Map<String, dynamic> json){
    verses = List.from(json['verses']).map((e)=>Verses.fromJson(e)).toList();
    meta = Meta.fromJson(json['meta']);
  }

 
}

class Verses {
  Verses({
    required this.id,
    required this.verseKey,
    required this.textIndopak,
  });
  late final int id;
  late final String verseKey;
  late final String textIndopak;
  
  Verses.fromJson(Map<String, dynamic> json){
    id = json['id'];
    verseKey = json['verse_key'];
    textIndopak = json['text_indopak'];
  }

  
}

class Meta {
  Meta({
    required this.filters,
  });
  late final Filters filters;
  
  Meta.fromJson(Map<String, dynamic> json){
    filters = Filters.fromJson(json['filters']);
  }

 
}

class Filters {
  Filters({
    required this.chapterNumber,
  });
  late final String chapterNumber;
  
  Filters.fromJson(Map<String, dynamic> json){
    chapterNumber = json['chapter_number'];
  }


}