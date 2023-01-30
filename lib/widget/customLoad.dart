import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}