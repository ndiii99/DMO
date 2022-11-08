import 'package:dmo_flutter/app/data/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (context) {
      return Scaffold(
        backgroundColor: AppColor.bg,
        body: Stack(
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
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logoHPS.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'PT. Hasta Prima Solusi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'V. 1.0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
