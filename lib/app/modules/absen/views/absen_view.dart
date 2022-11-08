import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dmo_flutter/app/controllers/page_index_controller.dart';
import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:slide_digital_clock/slide_digital_clock.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/absen_controller.dart';

class AbsenView extends GetView<AbsenController> {
  final pageC = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABSENSI'),
        backgroundColor: Color(0xFF178D8D),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Color(0xFF178D8D)),
            child: Column(
              children: [
                DigitalClock(
                  areaDecoration: BoxDecoration(color: Colors.transparent),
                  areaAligment: AlignmentDirectional.center,
                  hourMinuteDigitDecoration:
                      BoxDecoration(color: Colors.transparent),
                  hourMinuteDigitTextStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  secondDigitTextStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  //'${user['nip']}',
                  '${controller.formatHari()} , ${controller.formatTglIndo()}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Jam Kerja',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '07:45 - 16:30',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.ABSEN_MASUK);
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                height: 55,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 44, 195, 89),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    'Clock In',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.ABSEN_KELUAR);
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                height: 55,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 44, 195, 89),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    'Clock Out',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
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
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_ABSEN);
                      },
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text("${DateFormat.Hms().format(DateTime.now())}"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text("${DateFormat.Hms().format(DateTime.now())}"),
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
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xFF178D8D),
        activeColor: Colors.white,
        style: TabStyle.fixedCircle,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.fingerprint_outlined, title: 'Presensi'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: pageC.pageIndex.value, //optional, default as 0
        onTap: (int i) => pageC.changePage(i),
      ),
    );
  }
}
