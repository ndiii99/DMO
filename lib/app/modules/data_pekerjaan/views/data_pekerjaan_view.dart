import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_pekerjaan_controller.dart';

class DataPekerjaanView extends GetView<DataPekerjaanController> {
  @override
  Widget build(BuildContext context) {
    controller.namaE.text = controller.name;
    controller.nik.text = controller.nikE;
    controller.jabatan.text = controller.jabatanE;
    return GetBuilder<DataPekerjaanController>(
        init: DataPekerjaanController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Data Pekerjaan'),
              backgroundColor: Color(0xFF178D8D),
              centerTitle: true,
              // actions: [
              //   IconButton(
              //     onPressed: () {
              //       Get.toNamed(Routes.EDIT_PEKERJAAN);
              //     },
              //     icon: Icon(Icons.edit_note),
              //   ),
              // ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        readOnly: true,
                        controller: controller.namaE,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.abc),
                          border: UnderlineInputBorder(),
                          labelText: 'Nama',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: controller.email,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.email),
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: controller.nik,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.numbers),
                          border: UnderlineInputBorder(),
                          labelText: 'Nik',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: controller.jabatan,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.briefcase),
                          border: UnderlineInputBorder(),
                          labelText: 'Jabatan',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: controller.awalkontrak,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          border: UnderlineInputBorder(),
                          labelText: 'Awal Kontrak',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: controller.akhirkontak,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          border: UnderlineInputBorder(),
                          labelText: 'Akhir Kontrak',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: controller.sbu,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.building_2_fill),
                          border: UnderlineInputBorder(),
                          labelText: 'SBU',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: controller.status,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.account_box),
                          border: UnderlineInputBorder(),
                          labelText: 'Status ',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        });
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(
          item,
          style: TextStyle(fontSize: 18),
        ),
        value: item,
      );
}
