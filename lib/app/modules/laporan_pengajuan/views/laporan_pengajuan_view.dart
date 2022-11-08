import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/laporan_pengajuan_controller.dart';

class LaporanPengajuanView extends GetView<LaporanPengajuanController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaporanPengajuanController>(
      init: LaporanPengajuanController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF178D8D),
            title: Text('Laporan Pengajuan'),
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
                        'Cari Riwayat Pengajuan',
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
                        padding: const EdgeInsets.only(bottom: 0),
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
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jenis",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 73,
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Cuti Melahirkan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70,
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Randi",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tanggal Awal",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "01-09-2022",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tanggal Akhir",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "02-09-2022",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Keterangan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Menikahkan Saudara jauh disana ",
                                          maxLines: 5,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 66,
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Approved",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          CupertinoIcons.camera_circle_fill,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Column(
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Jenis",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             "Nama",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             "Tanggal Awal",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             "Tanggal Akhir",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             "Keterangan",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             "Status",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             ":",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             ":",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             ":",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             ":",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             ":",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text(
//                                             ":",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Flexible(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Ijin",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             Text(
//                                               "Randi",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             Text(
//                                               "${DateFormat('dd-MM-yyyy').format(DateTime.now())}",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             Text(
//                                               "${DateFormat('dd-MM-yyyy').format(DateTime.now())}",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             Text(
//                                               "Menikahkan Saudara jauh disana ",
//                                               maxLines: 5,
//                                               overflow: TextOverflow.clip,
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             Text(
//                                               "Menikahkan Saudara jauh disana ",
//                                               maxLines: 5,
//                                               overflow: TextOverflow.clip,
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {},
//                                         child: Icon(
//                                           CupertinoIcons.camera_circle_fill,
//                                           size: 40,
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
                            