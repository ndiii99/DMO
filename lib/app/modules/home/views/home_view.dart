import 'package:badges/badges.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final pageC = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF178D8D),
              leading: Container(
                height: 20,
                width: 20,
                child: IconButton(
                  icon: Badge(
                    child: Icon(CupertinoIcons.bell),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.LIST_NOTIFIKASI);
                  },
                ),
              ),
              title: Container(
                child: Image.asset(
                  "assets/images/LogoAPK.png",
                  height: 50,
                  width: 50,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    controller.confirmation();
                  },
                  icon: Icon(Icons.logout),
                ),
                IconButton(
                  onPressed: () {
                    controller.sendNotification();
                    print('notif');
                  },
                  icon: Icon(Icons.notification_add),
                ),
              ],
            ),
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Color(0xFF178D8D)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 50,
                              height: 50,
                              color: Colors.grey,
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.person_circle,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  '${controller.name.value}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.jabatan,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.clock,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Jam Kerja,',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '07:45 - 16:30',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            Text('Masuk'),
                                            Text('-'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.formatHari()}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${controller.formatTglIndo()}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            Text('Keluar'),
                                            Text('-'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Rekap Absen Bulan Ini',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'HADIR',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '23 Hari',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'TIDAK HADIR',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '3 Hari',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'SISA CUTI',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '23 Hari',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.KUNJUNGAN);
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
                                    Icons.store,
                                    size: 50,
                                    color: Color(0xFFE65100),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Kunjungan',
                                  style: TextStyle(fontSize: 14),
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
                            Get.toNamed(Routes.ODOMETER);
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
                                    Icons.speed,
                                    size: 50,
                                    color: Color(0xFF2196F3),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Odometer',
                                  style: TextStyle(fontSize: 14),
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
                            Get.toNamed(Routes.LAPORAN);
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0x1F1FB71B),
                                  ),
                                  child: Icon(
                                    Icons.list_alt,
                                    size: 50,
                                    color: Color(0xFF1FB71B),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Laporan',
                                  style: TextStyle(fontSize: 14),
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
                            Get.toNamed(Routes.PENGAJUAN);
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
                                  style: TextStyle(fontSize: 14),
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
                            Get.toNamed(Routes.APPROVAL);
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
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Color(0xFF178D8D),
              activeColor: Colors.white,
              style: TabStyle.fixedCircle,
              items: [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.fingerprint_outlined, title: 'Presensi'),
                TabItem(icon: Icons.person, title: 'Profile'),
              ],
              initialActiveIndex:
                  pageC.pageIndex.value, //optional, default as 0
              onTap: (int i) => pageC.changePage(i),
            ),
          );
        });
  }
}
