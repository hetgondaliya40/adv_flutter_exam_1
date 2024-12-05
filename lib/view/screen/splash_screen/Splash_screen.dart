import 'dart:async';

import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, Routes.homePage),
    );
    return Scaffold(
      backgroundColor: Color(0xffdaeaf5),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/originals/06/a2/31/06a2312ada3efca32bf4161eb660cb03.gif",
            ),
          ),
        ),
      ),
    );
  }
}
