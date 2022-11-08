import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bbm_controller.dart';

class BbmView extends GetView<BbmController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BbmController>(
      init: BbmController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BBM'),
            backgroundColor: Color(0xFF178D8D),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Jumlah Pemakaian BBM Saat ini',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Total KM : ' + '100' + 'Km',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Total Harga : Rp. ' + '19000000',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
