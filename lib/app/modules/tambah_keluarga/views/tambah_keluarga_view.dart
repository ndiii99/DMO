import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_keluarga_controller.dart';

class TambahKeluargaView extends GetView<TambahKeluargaController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TambahKeluargaController>(
        init: TambahKeluargaController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Data Keluarga'),
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
                        controller: controller.nama,
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
                        controller: controller.hubungan,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.book),
                          border: UnderlineInputBorder(),
                          labelText: 'Hubungan',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.pendidikan,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.collections),
                          border: UnderlineInputBorder(),
                          labelText: 'Pendidikan',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.kelamin,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.account_box),
                          border: UnderlineInputBorder(),
                          labelText: 'Jenis Kelamin ',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.pekerjaan,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.account_box),
                          border: UnderlineInputBorder(),
                          labelText: 'Pekerjaan ',
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
                          'Ajukan Penambahan Data',
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
