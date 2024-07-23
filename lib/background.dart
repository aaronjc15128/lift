import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget page;
  const Background({super.key, required this.page});

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