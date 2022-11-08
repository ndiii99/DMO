import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/edit_pekerjaan_controller.dart';

class EditPekerjaanView extends GetView<EditPekerjaanController> {
  @override
  Widget build(BuildContext context) {
    controller.namaE.text = controller.name;
    controller.nik.text = controller.nikE;
    controller.jabatan.text = controller.jabatanE;
    return GetBuilder<EditPekerjaanController>(
        init: EditPekerjaanController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Data Pekerjaan'),
              backgroundColor: Color(0xFF178D8D),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      TextFormField(
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
                        keyboardType: TextInputType.number,
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
                        onTap: () async {
                          controller.choseDateAwal();
                          //controller.update();
                        },
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
                        onTap: () async {
                          controller.choseDateAkhir();
                          //controller.update();
                        },
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
                  InkWell(
                    onTap: () {
                      controller.rubahData();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 44, 195, 89)),
                      child: Center(
                        child: Text(
                          'Ajukan Perubahan',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
