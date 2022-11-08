import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_pendidikan_controller.dart';

class DataPendidikanView extends GetView<DataPendidikanController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataPendidikanController>(
        init: DataPendidikanController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Data Pendidikan'),
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
                        Get.toNamed(Routes.TAMBAH_PENDIDIKAN);
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
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_PENDIDIKAN);
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Jenjang",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("S1"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Nama",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("Universitas Yarsi"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Tahun",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("2017-2021"),
                                        SizedBox(
                                          height: 10,
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
