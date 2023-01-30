import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/model/audio_model.dart';
import 'package:quran_app/shared/component/constains.dart';
import 'package:quran_app/utills/colors.dart';
import 'package:quran_app/widget/custom_app_bar.dart';

import 'quran/surah/custom_build_surah.dart';

class AudioFile extends StatefulWidget {
  final int index;
  final AudioModel audioModel;
  final AudioPlayer advancedPlayer;
  const AudioFile(
      {Key? key,
      required this.advancedPlayer,
      required this.audioModel,
      required this.index})
      : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _postion = new Duration();
  //final String path ="https://download.quranicaudio.com/qdc/abdul_baset/murattal/1.mp3";
  bool isplaying = false;
  bool isPause = false;
  bool isLoop = false;
  bool isRepeat = false;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  Color color = Colors.black;
  Color colorLoop = Colors.black;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    this.widget.advancedPlayer.onPositionChanged.listen((event) {
      setState(() {
        _postion = event;
      });
    });

    //this.widget.advancedPlayer.setSourceUrl(path);
    this.widget.advancedPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _postion = Duration(seconds: 0);
        print("object is ss=" + isplaying.toString());
        isplaying = true;
        isRepeat = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.widget.advancedPlayer.release();
    this.widget.advancedPlayer.dispose();
  }

  Widget btnStart(String audioPath) {
    return IconButton(
        padding: EdgeInsets.only(bottom: 10),
        onPressed: () {
          if (isplaying == true) {
            setState(() {
              isplaying = false;

            });
            this.widget.advancedPlayer.pause();
          } else {
            setState(() {
              isplaying = true;

              //isRepeat=false;
            });
            UrlSource url = UrlSource(audioPath);
            this.widget.advancedPlayer.play(url);
          }
        },
        icon: isplaying
            ? Icon(
                _icons[1],
                size: 50,
                color: AppColor.iconColor1,
              )
            : Icon(
                _icons[0],
                size: 50,
                color: AppColor.iconColor1,
              ));
  }

  Widget loadAsset(String audioPath) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ///loop
          IconButton(
            onPressed: () {
              print("repeat");
              if (isLoop) {
                setState(() {
                  isLoop = false;
                  colorLoop = Colors.black;
                  this.widget.advancedPlayer.setReleaseMode(ReleaseMode.stop);
                });
              } else {
                setState(() {
                  isLoop = true;
                  colorLoop = Colors.red;
                });
                this.widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
              }
            },
            icon: Icon(
              Icons.loop,
              color: colorLoop,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                chageToSecond(_postion.inSeconds - 5);
              });
            },
            icon: Icon(Icons.first_page_rounded),
          ),
          btnStart(audioPath),
          IconButton(
            onPressed: () {
              setState(() {
                chageToSecond(_postion.inSeconds + 5);
              });
            },
            icon: Icon(Icons.last_page_sharp),
          ),

          //repeat
          IconButton(
            onPressed: () {
              /*
              print("repeat");
               if (isRepeat) {
                  setState(() {
                    isRepeat = false;
                    color=Colors.black;
                    this.widget.advancedPlayer.setReleaseMode(ReleaseMode.stop);
                  });
                 
                } else {
                  setState(() {
                    isRepeat = true;
                    color=Colors.blue;
                  });
                  this.widget.advancedPlayer.setReleaseMode(ReleaseMode.release);
                 
                }
                */
              print("stop");
              if (isRepeat) {
                setState(() {
                  isRepeat = false;
                  color = Colors.black;
                  UrlSource url = UrlSource(audioPath);
                  this.widget.advancedPlayer.play(url);
                  isplaying = true;
                });
              } else {
                setState(() {
                  isRepeat = true;
                  color = Colors.red;
                  this.widget.advancedPlayer.stop();
                  isplaying = false;
                });
              }
            },
            icon: Icon(
              Icons.stop,
              color:isplaying==true?Colors.black: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget fastRate() {
    return IconButton(
        onPressed: () {
          this.widget.advancedPlayer.setPlaybackRate(1.5);
        },
        icon: Icon(Icons.plus_one));
  }

  Widget slider() {
    return Slider(
      value: _postion.inSeconds.toDouble(),
      activeColor: AppColor.iconColor1,
      inactiveColor: Colors.grey,
      max: _duration.inSeconds.toDouble(),
      min: 0,
      onChanged: (value) {
        setState(() {
          chageToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void chageToSecond(int sec) {
    Duration newDuration = Duration(seconds: sec);
    this.widget.advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: AppColor.mainColor,
        child: Column(
          children: [
            CustomAppBar(
              isDrawer: false,
              url: "assets/images/arrow.png",
              imageH: 22,
              onPress: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColor.paraColor.withOpacity(.4)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(_postion.toString().split(".")[0]),
                      Text(_duration.toString().split(".")[0]),
                    ],
                  ),
                  slider(),
                  loadAsset(this.widget.audioModel.audioFile.audioUrl),
                ],
              ),
            ),
            Expanded(
              child: CustomBuildSurah(
                arabic: quran[0],
                sura: widget.index-1,
                suraName: arabicName[widget.index-1]['name'],
                ayah: 0,
                isShowArrowBack: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

