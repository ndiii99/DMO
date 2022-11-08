import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF178D8D),
              title: Text('Profile'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Color(0xFF178D8D)),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 50, 20, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        controller.nik,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        controller.jabatan,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 130,
                        child: ClipOval(
                          child: Container(
                            width: 75,
                            height: 75,
                            color: Colors.grey,
                            child: Center(
                              child: Image.network(
                                controller.defaultImage,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Data Saya",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.DATA_PERSONAL);
                          },
                          leading: Icon(
                            CupertinoIcons.person_alt_circle_fill,
                            color: Colors.blue,
                            size: 40,
                          ),
                          title: Text('Data Personal'),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.DATA_PEKERJAAN);
                          },
                          leading: Icon(
                            CupertinoIcons.doc_person,
                            color: Colors.blueGrey,
                            size: 40,
                          ),
                          title: Text('Data Pekerjaan'),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.DATA_KELUARGA);
                          },
                          leading: Icon(
                            CupertinoIcons.person_3_fill,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          title: Text('Data Keluarga'),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.DATA_PENDIDIKAN);
                          },
                          leading: Icon(
                            CupertinoIcons.book_fill,
                            color: Colors.indigo,
                            size: 40,
                          ),
                          title: Text('Data Pendidikan'),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.KONTAK_DARURAT);
                          },
                          leading: Icon(
                            Icons.local_hospital,
                            color: Colors.red,
                            size: 40,
                          ),
                          title: Text('Kontak Darurat'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Pengaturan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(Routes.GANTI_PASSWORD);
                      },
                      leading: Icon(
                        Icons.key,
                        color: Colors.teal,
                        size: 40,
                      ),
                      title: Text('Ganti Password'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
              initialActiveIndex:
                  pageC.pageIndex.value, //optional, default as 0
              onTap: (int i) => pageC.changePage(i),
            ),
          );
        });
  }
}
