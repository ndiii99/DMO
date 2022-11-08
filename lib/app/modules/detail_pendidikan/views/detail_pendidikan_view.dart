import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_pendidikan_controller.dart';

class DetailPendidikanView extends GetView<DetailPendidikanController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPendidikanController>(
        init: DetailPendidikanController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Data Pendidikan'),
              backgroundColor: Color(0xFF178D8D),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.trash_fill),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        controller: controller.jenjang,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.book),
                          border: UnderlineInputBorder(),
                          labelText: 'Jenjang',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                        onTap: () async {
                          controller.choseDateAwal();
                          //controller.update();
                        },
                        controller: controller.masuk,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          border: UnderlineInputBorder(),
                          labelText: 'Masuk',
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
                        controller: controller.keluar,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          border: UnderlineInputBorder(),
                          labelText: 'Keluar',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.jenis,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.collections),
                          border: UnderlineInputBorder(),
                          labelText: 'Jenis',
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.keterangan,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.account_box),
                          border: UnderlineInputBorder(),
                          labelText: 'Keterangan ',
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
