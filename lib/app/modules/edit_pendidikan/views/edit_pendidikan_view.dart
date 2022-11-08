import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_pendidikan_controller.dart';

class EditPendidikanView extends GetView<EditPendidikanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditPendidikanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditPendidikanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
