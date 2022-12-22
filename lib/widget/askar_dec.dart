import 'package:flutter/material.dart';

class AskarDescription extends StatelessWidget {
  final int num;
  final String text;
  const AskarDescription({Key? key,required this.num ,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Text("$num"),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
              text,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 20),
        )),
      ],
    ),
    Divider(endIndent: 50,indent: 50,thickness: 1.2),
      ],
    );
  }
}
