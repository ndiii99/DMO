import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penjualan_controller.dart';

class PenjualanView extends GetView<PenjualanController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PenjualanController>(
      init: PenjualanController(),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF178D8D),
            title: Text('Penjualan'),
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              'Penjualan',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
