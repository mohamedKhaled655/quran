/*
class AudioModel {
  AudioModel({
    required this.audioFiles,
  });
  late final List<AudioFiles> audioFiles;
  
  AudioModel.fromJson(Map<String, dynamic> json){
    audioFiles = List.from(json['audio_files']).map((e)=>AudioFiles.fromJson(e)).toList();
  }


}

class AudioFiles {
  AudioFiles({
    required this.id,
    required this.chapterId,
   
    required this.audioUrl,
  });
  late final int id;
  late final int chapterId;
  late final String audioUrl;
  
  AudioFiles.fromJson(Map<String, dynamic> json){
    id = json['id'];
    chapterId = json['chapter_id'];
 
    audioUrl = json['audio_url'];
  }

 
}
*/
class AudioModel {
  AudioModel({
    required this.audioFile,
  });
  late final AudioFile audioFile;
  
  AudioModel.fromJson(Map<String, dynamic> json){
    audioFile = AudioFile.fromJson(json['audio_file']);
  }


}

class AudioFile {
  AudioFile({
    required this.id,
    required this.chapterId,
    required this.audioUrl,
  });
  late final int id;
  late final int chapterId;
  late final String audioUrl;
  
  AudioFile.fromJson(Map<String, dynamic> json){
    id = json['id'];
    chapterId = json['chapter_id'];
    audioUrl = json['audio_url'];
  }

 
}