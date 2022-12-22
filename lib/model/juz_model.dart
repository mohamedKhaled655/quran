class JuzModel {
  JuzModel({
    required this.code,
    required this.status,
    required this.data,
  });
  late final int code;
  late final String status;
  late final Data data;
  
  JuzModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    data = Data.fromJson(json['data']);
  }


}

class Data {
  Data({
    required this.number,
    required this.ayahs,

    required this.edition,
  });
  late final int number;
  late final List<Ayahs> ayahs;

  late final Edition edition;
  
  Data.fromJson(Map<String, dynamic> json){
    number = json['number'];
    ayahs = List.from(json['ayahs']).map((e)=>Ayahs.fromJson(e)).toList();
    
    edition = Edition.fromJson(json['edition']);
  }


}

class Ayahs {
  Ayahs({
    required this.number,
    required this.text,
    required this.surah,
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
  late final Surah surah;
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
    surah = Surah.fromJson(json['surah']);
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

  
}

class Surah {
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
  });
  late final int number;
  late final String name;
  late final String englishName;
  late final String englishNameTranslation;
  late final String revelationType;
  late final int numberOfAyahs;
  
  Surah.fromJson(Map<String, dynamic> json){
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
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