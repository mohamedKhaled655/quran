
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';



int bookmarkedAyah = 1;
int bookmarkedSura = 1;
bool fabIsClicked = true;

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =ItemPositionsListener.create();


String arabicFont = 'quran';
double arabicFontSize = 28;
double mushafFontSize = 40;
Uri quranAppUrl = Uri.parse('https://github.com/mohamedKhaled655');

Future<void>saveSettings()async{
  final sharedPreferences=await SharedPreferences.getInstance();
  await sharedPreferences.setInt("arabicFontSize", arabicFontSize.toInt());
  await sharedPreferences.setInt("mushafFontSize", mushafFontSize.toInt());
}

Future getSettings()async{
  try{
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = await prefs.getInt('arabicFontSize')!.toDouble();
    mushafFontSize = await prefs.getInt('mushafFontSize')!.toDouble();
  }catch(_){
    arabicFontSize = 28;
    mushafFontSize = 40;
  }
}

saveBookMark (surah,ayah)async{
  final prefs=await SharedPreferences.getInstance();
  await prefs.setInt("surah", surah);
  await prefs.setInt("ayah", ayah);
}

readBookmark() async {
  print("read book mark called");
  final prefs = await SharedPreferences.getInstance();
  try {
    bookmarkedAyah = prefs.getInt('ayah')!;
    bookmarkedSura = prefs.getInt('surah')!;
    return true;
  } catch (e) {
    return false;
  }
}
// bool isLastRead=false;
// saveLastRead ()async{
//   final prefs=await SharedPreferences.getInstance();
//   if(readBookmark()==true){
//     isLastRead=true;
//     await prefs.setBool("isLastRead", true);
//   }
//
//
// }
//
// readLastRead() async {
//   print("read Last Read called");
//   final prefs = await SharedPreferences.getInstance();
//   try {
//
//     isLastRead = prefs.getBool('isLastRead')!;
//     return true;
//   } catch (e) {
//     return false;
//   }
// }

List<Map> arabicName = [
  {"surah": "1",  "name": "الفاتحة", "nameEN": "Al-Fatihah"},
  {"surah": "2",  "name": "البقرة", "nameEN": "Al-Baqarah"},
  {"surah": "3",  "name": "آل عمران", "nameEN": "Al-Imran"},
  {"surah": "4",  "name": "النساء", "nameEN": "An-Nisa'	"},
  {"surah": "5",  "name": "المائدة", "nameEN": "Al-Ma'idah"},
  {"surah": "6",  "name": "الأنعام", "nameEN": "Al-An`am"},
  {"surah": "7",  "name": "الأعراف", "nameEN": "Al-A`raf"},
  {"surah": "8",  "name": "الأنفال", "nameEN": "Al-Anfal"},
  {"surah": "9",  "name": "التوبة", "nameEN": "Al-Taubah"},
  {"surah": "10", "name": "يونس", "nameEN": "Yunus"},
  {"surah": "11", "name": "هود", "nameEN": "Hud"},
  {"surah": "12", "name": "يوسف", "nameEN": "Yusuf"},
  {"surah": "13", "name": "الرعد", "nameEN": "Ar-Ra`d"},
  {"surah": "14", "name": "ابراهيم", "nameEN": "Ibrahim"},
  {"surah": "15", "name": "الحجر", "nameEN": "Al-Hijr"},
  {"surah": "16", "name": "النحل", "nameEN": "An-Nahl"},
  {"surah": "17", "name": "الإسراء", "nameEN": "Al-Isra"},
  {"surah": "18", "name": "الكهف", "nameEN": "Al-Kahf"},
  {"surah": "19", "name": "مريم", "nameEN": "Maryam"},
  {"surah": "20", "name": "طه", "nameEN": "Ta Ha"},
  {"surah": "21", "name": "الأنبياء", "nameEN": "al-Anbiya'"},
  {"surah": "22", "name": "الحج", "nameEN": "Al-Hajj"},
  {"surah": "23", "name": "المؤمنون", "nameEN": "Al-Mu'minun"},
  {"surah": "24", "name": "النور", "nameEN": "An-Nur"},
  {"surah": "25", "name": "الفرقان", "nameEN": "Al-Furqan"},
  {"surah": "26", "name": "الشعراء", "nameEN": "ash-Shu`ara'"},
  {"surah": "27", "name": "النمل", "nameEN": "an-Naml"},
  {"surah": "28", "name": "القصص", "nameEN": "Al-Qasas"},
  {"surah": "29", "name": "العنكبوت", "nameEN": "al-`Ankabut"},
  {"surah": "30", "name": "الروم", "nameEN": "Ar-Rum"},
  {"surah": "31", "name": "لقمان", "nameEN": "Luqman"},
  {"surah": "32", "name": "السجدة", "nameEN": "Al-Sajdah"},
  {"surah": "33", "name": "الأحزاب", "nameEN": "Al-Ahzab"},
  {"surah": "34", "name": "سبإ", "nameEN": "Saba'"},
  {"surah": "35", "name": "فاطر", "nameEN": "Fatir"},
  {"surah": "36", "name": "يس", "nameEN": "Ya Sin"},
  {"surah": "37", "name": "الصافات", "nameEN": "Al-Saffat"},
  {"surah": "38", "name": "ص", "nameEN": "Sad"},
  {"surah": "39", "name": "الزمر", "nameEN": "az-Zumar"},
  {"surah": "40", "name": "غافر", "nameEN": "Ghafir"},
  {"surah": "41", "name": "فصلت", "nameEN": "Fussilat"},
  {"surah": "42", "name": "الشورى", "nameEN": "al-Shura"},
  {"surah": "43", "name": "الزخرف", "nameEN": "az-Zukhruf"},
  {"surah": "44", "name": "الدخان", "nameEN": "ad-Dukhan"},
  {"surah": "45", "name": "الجاثية", "nameEN": "al-Jathiyah"},
  {"surah": "46", "name": "الأحقاف", "nameEN": "al-Ahqaf"},
  {"surah": "47", "name": "محمد", "nameEN": "Muhammad"},
  {"surah": "48", "name": "الفتح", "nameEN": "al-Fath"},
  {"surah": "49", "name": "الحجرات", "nameEN": "al-Hujurat"},
  {"surah": "50", "name": "ق", "nameEN": "Qaf"},
  {"surah": "51", "name": "الذاريات", "nameEN": "al-Dhariyat"},
  {"surah": "52", "name": "الطور", "nameEN": "at-Tur"},
  {"surah": "53", "name": "النجم", "nameEN": "an-Najm"},
  {"surah": "54", "name": "القمر", "nameEN": "al-Qamar"},
  {"surah": "55", "name": "الرحمن", "nameEN": "Ar-Rahman"},
  {"surah": "56", "name": "الواقعة", "nameEN": "al-Waqi`ah"},
  {"surah": "57", "name": "الحديد", "nameEN": "al-Hadid"},
  {"surah": "58", "name": "المجادلة", "nameEN": "al-Mujadilah"},
  {"surah": "59", "name": "الحشر", "nameEN": "al-Hashr"},
  {"surah": "60", "name": "الممتحنة", "nameEN": "al-Mumtahanah"},
  {"surah": "61", "name": "الصف", "nameEN": "as-Saff"},
  {"surah": "62", "name": "الجمعة", "nameEN": "al-Jumu`ah"},
  {"surah": "63", "name": "المنافقون", "nameEN": "al-Munafiqun"},
  {"surah": "64", "name": "التغابن", "nameEN": "at-Taghabun"},
  {"surah": "65", "name": "الطلاق", "nameEN": "at-Talaq,"},
  {"surah": "66", "name": "التحريم", "nameEN": "at-Tahrim"},
  {"surah": "67", "name": "الملك", "nameEN": "al-Mulk"},
  {"surah": "68", "name": "القلم", "nameEN": "al-Qalam"},
  {"surah": "69", "name": "الحاقة", "nameEN": "al-Haqqah"},
  {"surah": "70", "name": "المعارج", "nameEN": "al-Ma`arij"},
  {"surah": "71", "name": "نوح", "nameEN": "Nuh"},
  {"surah": "72", "name": "الجن", "nameEN": "al-Jinn"},
  {"surah": "73", "name": "المزمل", "nameEN": "al-Muzammil"},
  {"surah": "74", "name": "المدثر", "nameEN": "al-Mudathir"},
  {"surah": "75", "name": "القيامة", "nameEN": "al-Qiyamah"},
  {"surah": "76", "name": "الانسان", "nameEN": "al-Insane"},
  {"surah": "77", "name": "المرسلات", "nameEN": "al-Mursalat"},
  {"surah": "78", "name": "النبإ", "nameEN": "an-Naba'"},
  {"surah": "79", "name": "النازعات", "nameEN": "an-Nazi`at"},
  {"surah": "80", "name": "عبس", "nameEN": "`Abasa"},
  {"surah": "81", "name": "التكوير", "nameEN": "at-Takwir"},
  {"surah": "82", "name": "الإنفطار", "nameEN": "al-Infitar"},
  {"surah": "83", "name": "المطففين", "nameEN": "Al-Mutaffifeen"},
  {"surah": "84", "name": "الإنشقاق", "nameEN": "al-Inshiqaq"},
  {"surah": "85", "name": "البروج", "nameEN": "al-Buruj"},
  {"surah": "86", "name": "الطارق", "nameEN": "at-Tariq"},
  {"surah": "87", "name": "الأعلى", "nameEN": "al-A`la"},
  {"surah": "88", "name": "الغاشية", "nameEN": "al-Ghashiya"},
  {"surah": "89", "name": "الفجر", "nameEN": "Al-Fajr"},
  {"surah": "90", "name": "البلد", "nameEN": "al-Balad"},
  {"surah": "91", "name": "الشمس", "nameEN": "ash-Shams"},
  {"surah": "92", "name": "الليل", "nameEN": "al-Layl"},
  {"surah": "93", "name": "الضحى", "nameEN": "ad-Duha"},
  {"surah": "94", "name": "الشرح", "nameEN": "ash-Sharh"},
  {"surah": "95", "name": "التين", "nameEN": "at-Tin"},
  {"surah": "96", "name": "العلق", "nameEN": "al-`Alaq"},
  {"surah": "97", "name": "القدر", "nameEN": "al-qadr"},
  {"surah": "98", "name": "البينة", "nameEN": "al-Bayyinah"},
  {"surah": "99", "name": "الزلزلة", "nameEN": "Az-Zalzala"},
  {"surah": "100","name": "العاديات", "nameEN": "al-`Adiyat"},
  {"surah": "101","name": "القارعة", "nameEN": "al-Qari`ah"},
  {"surah": "102","name": "التكاثر", "nameEN": "at-Takathur"},
  {"surah": "103","name": "العصر", "nameEN": "al-`Asr"},
  {"surah": "104","name": "الهمزة", "nameEN": "al-Humazah"},
  {"surah": "105","name": "الفيل", "nameEN": "al-Fil"},
  {"surah": "106","name": "قريش", "nameEN": "al-Quraish"},
  {"surah": "107","name": "الماعون", "nameEN": "al-Ma`un"},
  {"surah": "108","name": "الكوثر", "nameEN": "al-Kauthar"},
  {"surah": "109","name": "الكافرون", "nameEN": "al-Kafirun"},
  {"surah": "110","name": "النصر", "nameEN": "an-Nasr"},
  {"surah": "111","name": "المسد", "nameEN": "Al-Masad"},
  {"surah": "112","name": "الإخلاص", "nameEN": "al-Ikhlas"},
  {"surah": "113","name": "الفلق", "nameEN": "al-Falaq"},
  {"surah": "114","name": "الناس", "nameEN": "an-Nas"}
];

List<int> noOfVerses = [
  7,
  286,
  200,
  176,
  120,
  165,
  206,
  75,
  129,
  109,
  123,
  111,
  43,
  52,
  99,
  128,
  111,
  110,
  98,
  135,
  112,
  78,
  118,
  64,
  77,
  227,
  93,
  88,
  69,
  60,
  34,
  30,
  73,
  54,
  45,
  83,
  182,
  88,
  75,
  85,
  54,
  53,
  89,
  59,
  37,
  35,
  38,
  29,
  18,
  45,
  60,
  49,
  62,
  55,
  78,
  96,
  29,
  22,
  24,
  13,
  14,
  11,
  11,
  18,
  12,
  12,
  30,
  52,
  52,
  44,
  28,
  28,
  20,
  56,
  40,
  31,
  50,
  40,
  46,
  42,
  29,
  19,
  36,
  25,
  22,
  17,
  19,
  26,
  30,
  20,
  15,
  21,
  11,
  8,
  8,
  19,
  5,
  8,
  8,
  11,
  11,
  8,
  3,
  9,
  5,
  4,
  7,
  3,
  6,
  3,
  5,
  4,
  5,
  6
];

List arabic =[];
List malayalam =[];
List quran =[];

Future readJson ()async{
  final String response =await rootBundle.loadString("assets/hafs_smart_v8.json");
  final data=json.decode(response);
  arabic=data["quran"];
  malayalam=data["malayalam"];
  return quran=[arabic,malayalam];
}