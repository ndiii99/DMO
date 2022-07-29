import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dmo_flutter/app/modules/login_page/models/user_model.dart';
import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  var user = Get.arguments;
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF48A74A),
        leading: Image.asset("assets/images/LogoAPK.png"),
        title: Text('DMO'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.logOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Color(0xFF48A74A)),
            child: Column(
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xFFB16721),
                        Color(0xFFFF894D),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            //'${user['job']}',
                            'JOB',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            //'${user['nip']}',
                            'NIP',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            //'${user['name']}',
                            //controller.name,
                            //error disini
                            'Nama',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      ClipOval(
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          child: ListTile(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xFFB16721),
                        Color(0xFFFF894D),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Masuk'),
                          Text('-'),
                        ],
                      ),
                      Container(
                        width: 2,
                        height: 40,
                        color: Colors.black,
                      ),
                      Column(
                        children: [
                          Text('Keluar'),
                          Text('-'),
                        ],
                      ),
                    ],
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
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0x1F1FB71B)),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.shop_2,
                            size: 50,
                            color: Color(0xFF1FB71B),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Penjualan',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x1fE65100),
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.store,
                            size: 50,
                            color: Color(0xFFE65100),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Kunjungan',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x1f2196F3),
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.speed,
                            size: 50,
                            color: Color(0xFF2196F3),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Odometer',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0x1F1FB71B)),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.local_gas_station,
                            size: 50,
                            color: Color(0xFF1FB71B),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Biaya BBM',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x1fE65100),
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.subject,
                            size: 50,
                            color: Color(0xFFE65100),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x1f2196F3),
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check,
                            size: 50,
                            color: Color(0xFF2196F3),
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
                Visibility(
                  visible: false,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x1F1FB71B)),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shop_2,
                              size: 50,
                              color: Color(0xFF1FB71B),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Penjualan',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x1fE65100),
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.list_alt,
                            size: 50,
                            color: Color(0xFFE65100),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Laporan',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0x1f2196F3),
                    ),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.speed,
                              size: 50,
                              color: Color(0xFF2196F3),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Odometer',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          // GridView(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3, crossAxisSpacing: 10, mainAxisExtent: 10),
          //   children: [
          //     Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.amber,
          //     ),
          //     Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.red,
          //     ),
          //     Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.black,
          //     ),
          //   ],
          // ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.punch_clock, title: 'Presensi'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: pageC.pageIndex.value, //optional, default as 0
        onTap: (int i) => pageC.changePage(i),
      ),
      backgroundColor: Colors.white,
    );
  }
}
