import 'dart:convert';

import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var dateString =
      DateFormat('dd-MM-yyyy').format(DateTime.now()).replaceAll('/', '-');

  final getStorage = GetStorage();
  RxBool isLoading = false.obs;
  RxString name = ''.obs;
  late var nik = '';
  late var jabatan = '';
  late var imei = '';
  late var lat = '';
  late var long = '';
  late String defaultImage = 'https://ui-avatars.com/api/?name=$name';
  late Worker worker;

  @override
  void onInit() async {
    super.onInit();
    print('ini home');
    await getuser();
    update();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getuser() async {
    //data = getStorage.read('user') as Map<String, dynamic>;
    name.value = getStorage.read('user')['nama'];
    nik = getStorage.read('user')['nik'];
    jabatan = getStorage.read('user')['job'];
    imei = getStorage.read('user')['imei'];
    print(getStorage.read('url'));
    print('');

    print('test');
    print(getStorage.read('user')['nama']);
    update();
  }

  printget() {
    // final data = getStorage.read('user');
    // name.value = data['nama'] ?? '';
    print('test');
    print(getStorage.read('user')['nama']);
    // worker = ever(name, (value) {
    //   getStorage.write('user', value);
    //   print(value.toString());
    // });
  }

  // void getlocation() async {
  //   getStorage.read('location')['longitude'];
  //   getStorage.read('location')['latitude'];
  // }
  void sendNotification() async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA1QdL1Pg:APA91bHn1pUonZqrE2OwnMTkN4nHpaXIJGSvJaGNNtoYoOxVcSwsIGJSMjH1BrcUfmMkGZ0VXs0dltzfRphDQuv5R8wLU0xy6ASk9Vh0KW25ilSjUe04fJsdzsSq64IlVoqiqC5wVG6D',
        },
        body: jsonEncode(
          {
            'notification': {
              'body': 'testing123',
              'title': 'title123',
            },
            'priority': 'high',
            'data': {'id': '1', 'status': 'done', 'route': '/absen'},
            'to':
                ' dwRpN02yR0OmHmvDZw4V-a:APA91bGMIzPWOtfHjHKU2yS-rHa3FhI_ZzbyZnMl-L_yQf9-JQCMj-mP-xAxLQK4mJWleN4KU3K5AA2tClek-1CRMPlFffRrxaLmNITL65K14EfwuwtspCLVmAVZZezCe-DmMOHjUQDk'
          },
        ),
      );
      print('sukses');
    } catch (e) {
      print(e.toString());
    }
  }

  void confirmation() {
    Get.defaultDialog(
      title: 'Apa Anda Yakin?',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 44, 195, 89),
              ),
              child: Center(
                child: Text(
                  'Tidak',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              logOut();
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  'LogOut',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void logOut() async {
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setBool('login', false);
    //getStorage.erase();
    getStorage.remove('id');
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }

  String formatHari() {
    DateTime dateTime = DateTime.now();

    var day = DateFormat('EEEE').format(dateTime);
    var hari = "";
    switch (day) {
      case 'Sunday':
        {
          hari = "Minggu";
        }
        break;
      case 'Monday':
        {
          hari = "Senin";
        }
        break;
      case 'Tuesday':
        {
          hari = "Selasa";
        }
        break;
      case 'Wednesday':
        {
          hari = "Rabu";
        }
        break;
      case 'Thursday':
        {
          hari = "Kamis";
        }
        break;
      case 'Friday':
        {
          hari = "Jumat";
        }
        break;
      case 'Saturday':
        {
          hari = "Sabtu";
        }
        break;
    }
    return hari;
  }

  String formatTglIndo() {
    DateTime dateTime = DateTime.now();

    var m = DateFormat('MM').format(dateTime);
    var d = DateFormat('dd').format(dateTime);
    var Y = DateFormat('yyyy').format(dateTime);
    var month = "";
    switch (m) {
      case '01':
        {
          month = "Januari";
        }
        break;
      case '02':
        {
          month = "Februari";
        }
        break;
      case '03':
        {
          month = "Maret";
        }
        break;
      case '04':
        {
          month = "April";
        }
        break;
      case '05':
        {
          month = "Mei";
        }
        break;
      case '06':
        {
          month = "Juni";
        }
        break;
      case '07':
        {
          month = "Juli";
        }
        break;
      case '08':
        {
          month = "Agustus";
        }
        break;
      case '09':
        {
          month = "September";
        }
        break;
      case '10':
        {
          month = "Oktober";
        }
        break;
      case '11':
        {
          month = "November";
        }
        break;
      case '12':
        {
          month = "Desember";
        }
        break;
    }
    return "$d, $month, $Y";
  }
}
