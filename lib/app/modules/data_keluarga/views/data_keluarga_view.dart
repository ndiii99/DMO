import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_keluarga_controller.dart';

class DataKeluargaView extends GetView<DataKeluargaController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataKeluargaController>(
        init: DataKeluargaController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Data Keluarga'),
              backgroundColor: Color(0xFF178D8D),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.TAMBAH_KELUARGA);
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 44, 195, 89)),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                              Text(
                                'Tambah Data',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_KELUARGA);
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nama",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("Belum Ada"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Hubungan",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("Pasangan"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Jenis Kelamin",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("Perempuan"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Visibility(
                                          visible: false,
                                          child: Text(
                                            "Hubungan",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                            visible: false,
                                            child: Text("Pasangan")),
                                        Visibility(
                                          visible: false,
                                          child: Text(
                                            "Hubungan",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: false,
                                          child: Text("Pasangan"),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.navigate_next),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
