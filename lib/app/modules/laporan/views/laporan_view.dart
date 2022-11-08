import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_controller.dart';

class LaporanView extends GetView<LaporanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF178D8D),
        title: Text('Laporan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.center,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.LAPORAN_ABSEN);
                      },
                      splashColor: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0x1F1FB71B)),
                              child: Icon(
                                Icons.fingerprint_rounded,
                                size: 50,
                                color: Color(0xFF1FB71B),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Absen',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.LAPORAN_PENGAJUAN);
                      },
                      splashColor: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0x1fE65100),
                              ),
                              child: Icon(
                                Icons.subject,
                                size: 50,
                                color: Color(0xFFE65100),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Pengajuan',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.LAPORAN_APPROVAL);
                      },
                      splashColor: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0x1f2196F3),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 50,
                                color: Color(0xFF2196F3),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Approval',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.BBM);
                      },
                      splashColor: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0x1F1FB71B)),
                              child: Icon(
                                Icons.local_gas_station,
                                size: 50,
                                color: Color(0xFF1FB71B),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Biaya BBM',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
