import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (context) {
      return Scaffold(
        backgroundColor: Color(0xFF3F973E),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFF3F973E)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  new Image.asset(
                    'assets/images/LogoAPK.png',
                    height: 90,
                    width: 270,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
