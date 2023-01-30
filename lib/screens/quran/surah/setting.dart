import 'package:flutter/material.dart';
import 'package:quran_app/screens/search_screen.dart';
import 'package:quran_app/shared/component/constains.dart';
import 'package:quran_app/widget/custom_app_bar.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    searchOnPress: () {
                      showSearch(
                          context: context, delegate: DataSearch(arabicName: arabicName));
                    },
                    isDrawer: false,
                    url: "assets/images/arrow.png",
                    imageH: 22,
                    text: "Settings       ",
                    onPress: () {
                      print("arrow backed");
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    'Arabic Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                    value: arabicFontSize,
                    min: 20,
                    max: 40,
                    onChanged: (value) {
                      setState(() {
                        arabicFontSize = value;
                      });
                    },
                  ),
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: arabicFontSize),
                    textDirection: TextDirection.rtl,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'Mushaf Mode Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                    value: mushafFontSize,
                    min: 20,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        mushafFontSize = value;
                      });
                    },
                  ),
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: mushafFontSize),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              arabicFontSize = 28;
                              mushafFontSize = 40;
                            });
                            saveSettings();
                          },
                          child: const Text('Reset')),
                      ElevatedButton(
                          onPressed: () {
                            saveSettings();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Save')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
