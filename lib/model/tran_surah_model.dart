class TranSurahModel {
  TranSurahModel({
    required this.translations,
    required this.meta,
  });
  late final List<Translations> translations;
  late final Meta meta;
  
  TranSurahModel.fromJson(Map<String, dynamic> json){
    translations = List.from(json['translations']).map((e)=>Translations.fromJson(e)).toList();
    meta = Meta.fromJson(json['meta']);
  }


}

class Translations {
  Translations({
    required this.resourceId,
    required this.text,
  });
  late final int resourceId;
  late final String text;
  
  Translations.fromJson(Map<String, dynamic> json){
    resourceId = json['resource_id'];
    text = json['text'];
  }

}

class Meta {
  Meta({
    required this.translationName,
    required this.authorName,
    required this.filters,
  });
  late final String translationName;
  late final String authorName;
  late final Filters filters;
  
  Meta.fromJson(Map<String, dynamic> json){
    translationName = json['translation_name'];
    authorName = json['author_name'];
    filters = Filters.fromJson(json['filters']);
  }

 
}

class Filters {
  Filters({
    required this.resourceId,
    required this.chapterNumber,
  });
  late final int resourceId;
  late final String chapterNumber;
  
  Filters.fromJson(Map<String, dynamic> json){
    resourceId = json['resource_id'];
    chapterNumber = json['chapter_number'];
  }

 
}