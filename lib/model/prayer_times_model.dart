import 'package:equatable/equatable.dart';

class PrayerTimesModel extends Equatable{
  PrayerTimesModel({
    required this.code,
    required this.status,
    required this.data,
  });
  late final int code;
  late final String status;
  late final List<Data> data;
  
  PrayerTimesModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    code,status,data
  ];

 
}

class Data extends Equatable{
  Data({
    required this.timings,
    required this.date,
    required this.meta,
  });
  late final Timings timings;
  late final Date date;
  late final Meta meta;
  
  Data.fromJson(Map<String, dynamic> json){
    timings = Timings.fromJson(json['timings']);
    date = Date.fromJson(json['date']);
    meta = Meta.fromJson(json['meta']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [timings,date,meta];


}

class Timings extends Equatable{
  Timings({
    required this.Fajr,
    required this.Sunrise,
    required this.Dhuhr,
    required this.Asr,
    required this.Sunset,
    required this.Maghrib,
    required this.Isha,
    required this.Imsak,
    required this.Midnight,
    required this.Firstthird,
    required this.Lastthird,
  });
  late final String Fajr;
  late final String Sunrise;
  late final String Dhuhr;
  late final String Asr;
  late final String Sunset;
  late final String Maghrib;
  late final String Isha;
  late final String Imsak;
  late final String Midnight;
  late final String Firstthird;
  late final String Lastthird;
  
  Timings.fromJson(Map<String, dynamic> json){
    Fajr = json['Fajr'];
    Sunrise = json['Sunrise'];
    Dhuhr = json['Dhuhr'];
    Asr = json['Asr'];
    Sunset = json['Sunset'];
    Maghrib = json['Maghrib'];
    Isha = json['Isha'];
    Imsak = json['Imsak'];
    Midnight = json['Midnight'];
    Firstthird = json['Firstthird'];
    Lastthird = json['Lastthird'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [Fajr,Sunrise,Dhuhr,Asr,Sunset,Maghrib,Isha];

  
}

class Date {
  Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });
  late final String readable;
  late final String timestamp;
  late final Gregorian gregorian;
  late final Hijri hijri;
  
  Date.fromJson(Map<String, dynamic> json){
    readable = json['readable'];
    timestamp = json['timestamp'];
    gregorian = Gregorian.fromJson(json['gregorian']);
    hijri = Hijri.fromJson(json['hijri']);
  }


}

class Gregorian {
  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });
  late final String date;
  late final String format;
  late final String day;
  late final Weekday weekday;
  late final Month month;
  late final String year;
  late final Designation designation;
  
  Gregorian.fromJson(Map<String, dynamic> json){
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = Weekday.fromJson(json['weekday']);
    month = Month.fromJson(json['month']);
    year = json['year'];
    designation = Designation.fromJson(json['designation']);
  }

 
}

class Weekday {
  Weekday({
    required this.en,
  });
  late final String en;
  
  Weekday.fromJson(Map<String, dynamic> json){
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['en'] = en;
    return _data;
  }
}

class Month {
  Month({
    required this.number,
    required this.en,
  });
  late final int number;
  late final String en;
  
  Month.fromJson(Map<String, dynamic> json){
    number = json['number'];
    en = json['en'];
  }

 
}

class Designation {
  Designation({
    required this.abbreviated,
    required this.expanded,
  });
  late final String abbreviated;
  late final String expanded;
  
  Designation.fromJson(Map<String, dynamic> json){
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }

 
}

class Hijri {
  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
   
  });
  late final String date;
  late final String format;
  late final String day;
  late final Weekday weekday;
  late final Month month;
  late final String year;
  late final Designation designation;
  
  
  Hijri.fromJson(Map<String, dynamic> json){
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = Weekday.fromJson(json['weekday']);
    month = Month.fromJson(json['month']);
    year = json['year'];
    designation = Designation.fromJson(json['designation']);
    
  }


}

class Meta {
  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });
  late final double latitude;
  late final double longitude;
  late final String timezone;
  late final Method method;
  late final String latitudeAdjustmentMethod;
  late final String midnightMode;
  late final String school;
  late final Offset offset;
  
  Meta.fromJson(Map<String, dynamic> json){
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method = Method.fromJson(json['method']);
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset = Offset.fromJson(json['offset']);
  }

  
}

class Method {
  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });
  late final int id;
  late final String name;
  late final Params params;
  late final Location location;
  
  Method.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    params = Params.fromJson(json['params']);
    location = Location.fromJson(json['location']);
  }

  
}

class Params {
  Params({
    required this.Fajr,
    required this.Isha,
  });
  late final int Fajr;
  late final int Isha;
  
  Params.fromJson(Map<String, dynamic> json){
    Fajr = json['Fajr'];
    Isha = json['Isha'];
  }


}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });
  late final double latitude;
  late final double longitude;
  
  Location.fromJson(Map<String, dynamic> json){
    latitude = json['latitude'];
    longitude = json['longitude'];
  }


}

class Offset {
  Offset({
    required this.Imsak,
    required this.Fajr,
    required this.Sunrise,
    required this.Dhuhr,
    required this.Asr,
    required this.Maghrib,
    required this.Sunset,
    required this.Isha,
    required this.Midnight,
  });
  late final int Imsak;
  late final int Fajr;
  late final int Sunrise;
  late final int Dhuhr;
  late final int Asr;
  late final int Maghrib;
  late final int Sunset;
  late final int Isha;
  late final int Midnight;
  
  Offset.fromJson(Map<String, dynamic> json){
    Imsak = json['Imsak'];
    Fajr = json['Fajr'];
    Sunrise = json['Sunrise'];
    Dhuhr = json['Dhuhr'];
    Asr = json['Asr'];
    Maghrib = json['Maghrib'];
    Sunset = json['Sunset'];
    Isha = json['Isha'];
    Midnight = json['Midnight'];
  }

 
}