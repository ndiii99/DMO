import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_kontak_controller.dart';

class DetailKontakView extends GetView<DetailKontakController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailKontakController>(
        init: DetailKontakController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Kontak Darurat'),
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
                        controller: controller.noHP,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.phone_android),
                          border: UnderlineInputBorder(),
                          labelText: 'No. Hp',
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
