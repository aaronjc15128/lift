import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget page;
  const Background({Key? key, required this.page}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: page,
    );
  }
}