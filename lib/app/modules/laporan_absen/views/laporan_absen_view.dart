import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/laporan_absen_controller.dart';

class LaporanAbsenView extends GetView<LaporanAbsenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaporanAbsenController>(
        init: LaporanAbsenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF178D8D),
              title: Text('Laporan Absen'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  TextFormField(
                    readOnly: true,
                    controller: controller.dateAwal,
                    onTap: () async {
                      controller.choseDateAwal();
                      //controller.update();
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                        ),
                        labelText: 'Tanggal Awal',
                        hintStyle: TextStyle(fontSize: 18),
                        border: UnderlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: controller.dateAkhir,
                    onTap: () async {
                      controller.choseDateAkhir();
                      //controller.update();
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                        ),
                        labelText: 'Tanggal Akhir',
                        hintStyle: TextStyle(fontSize: 18),
                        border: UnderlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      controller.postLaporanAbsen();
                    },
                    child: Container(
                      height: 50,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 44, 195, 89)),
                      child: Center(
                        child: Text(
                          'Cari Riwayat Absen',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
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
                              onTap: () {},
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                //margin: EdgeInsets.only(bottom: 20),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  //color: Colors.grey,
                                  //color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Masuk",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${DateFormat.yMMMEd().format(DateTime.now())}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                        "${DateFormat.Hms().format(DateTime.now())}"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Keluar",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(Icons.navigate_next),
                                      ],
                                    ),
                                    Text(
                                        "${DateFormat.Hms().format(DateTime.now())}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
