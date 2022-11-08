import 'dart:convert';

import 'package:dmo_flutter/app/modules/login_page/models/user_model.dart';
import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';

class LoginPageController extends GetxController {
  var isPasswordHidden = true.obs;
  var isLoading = false.obs;
  UserModel? user;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  //var token = FirebaseMessaging.instance.getToken().then((value) => null);
  bool visible = false;
  final getStorage = GetStorage();
  // fingerprint
  var _localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    final data = getStorage.read('user');
    if (data != null) {
      emailC.text = data['nikE'];
      passwordC.text = data['password'];
    } else {
      emailC.text = '';
      passwordC.text = '';
    }
    // nik = data['nikE'];
    // password = data['password'];
  }

  void authenticateUser() async {
    final data = getStorage.read('user');
    if (data != null) {
      try {
        isUserAuthenticated.value = await _localAuth.authenticate(
            localizedReason: 'Authenticate Yourself',
            options: AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
              biometricOnly: true,
            ));
        if (isUserAuthenticated.value) {
          String? token = await FirebaseMessaging.instance.getToken();
          var map = new Map<String, dynamic>();
          map['nik'] = data['nikE'];
          map['password'] = data['password'];
          map['token'] = token;
          var url = 'http://www.api.hris-dmlt.com';
          getStorage.write('url', url);
          //print(getStorage.read('url'));
          try {
            final res = await http.post(
              Uri.parse("$url/api-dev-hris/v1/hris/login"),
              headers: {
                'hris-acces-token':
                    'fbcbf9f375f77cff0dd3d3a305d1008b3a461fa1b9fd3748f497b2860d57e7ac'
              },
              body: map,
            );
            print(res.statusCode);
            if (res.statusCode == 200) {
              var response = json.decode(res.body);

              if (response['status'] == true) {
                getStorage.write('id', 1);
                update();
                print('');
                var respon = json.decode(res.body)['data'];
                user = UserModel.fromJson(respon);
                print(user!.nik);
                print(user!.jabatan);
                print(user!.nama);
                print(user!.token);
                getStorage.write('user', {
                  'nik': user!.nik,
                  'job': user!.jabatan,
                  'nama': user!.nama,
                  'imei': user!.imei,
                  'nikE': data['nikE'],
                  'password': data['password']
                });

                print(getStorage.read('user')['password']);
                print(getStorage.read('user')['nikE']);
                print(getStorage.read('user')['nik']);
                print(getStorage.read('user')['nama']);
                Get.offNamed(Routes.HOME);
                Get.defaultDialog(
                    title: 'Berhasil Login',
                    content: Column(
                      children: [
                        Icon(
                          CupertinoIcons.checkmark_circle_fill,
                          color: Colors.green,
                          size: 75,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Selamat Datang ${respon['nama']}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ));
                //Get.snackbar("Berhasil", "${response['message'].toString()}");
              }
            }
          } catch (e) {
            Get.defaultDialog(
                title: 'Terjadi Kesalahan',
                content: Column(
                  children: [
                    Icon(
                      CupertinoIcons.xmark_circle,
                      color: Colors.red,
                      size: 75,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tidak Terhubung Dengan Server.",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ));
          }
        } else {
          Get.defaultDialog(
              title: 'Terjadi Kesalahan',
              content: Column(
                children: [
                  Icon(
                    CupertinoIcons.xmark_circle,
                    color: Colors.red,
                    size: 75,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Scan Sidik Jari Dibatalkan",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ));
        }
      } on PlatformException catch (e) {
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            content: Column(
              children: [
                Icon(
                  CupertinoIcons.xmark_circle,
                  color: Colors.red,
                  size: 75,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Device Tidak Mendukung Sistem Sidik Jari.',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ));
      }
    } else {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          content: Column(
            children: [
              Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.red,
                size: 75,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Silahkan Login Manual Untuk Pertama kali',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ));
    }
  }

  void toggle() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<UserModel?> login() async {
    isLoading.value = true;
    update();
    String? token = await FirebaseMessaging.instance.getToken();
    var map = new Map<String, dynamic>();
    map['nik'] = emailC.text;
    map['password'] = passwordC.text;
    map['token'] = token;
    var url = 'http://www.api.hris-dmlt.com';
    getStorage.write('url', url);
    //print(getStorage.read('url'));
    //log("Berhasil");
    try {
      final res = await http.post(
        Uri.parse("$url/api-dev-hris/v1/hris/login"),
        headers: {
          'hris-acces-token':
              'fbcbf9f375f77cff0dd3d3a305d1008b3a461fa1b9fd3748f497b2860d57e7ac'
        },
        body: map,
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        try {
          if (response['status'] == true) {
            getStorage.write('id', 1);
            update();
            print('');
            var respon = json.decode(res.body)['data'];
            user = UserModel.fromJson(respon);
            print(user!.nik);
            print(user!.jabatan);
            print(user!.nama);
            print(user!.token);
            getStorage.write('user', {
              'nik': user!.nik,
              'job': user!.jabatan,
              'nama': user!.nama,
              'imei': user!.imei,
              'nikE': emailC.text,
              'password': passwordC.text
            });

            print(getStorage.read('user')['imei']);
            Get.offNamed(Routes.HOME);

            //Get.snackbar("Berhasil", "${response['message'].toString()}");
          }
        } catch (e) {}
      } else {
        var resp = json.decode(res.body);
        if (resp['status'] == false) {
          update();
          visible = true;
          Get.defaultDialog(
              title: 'Terjadi Kesalahan',
              content: Column(
                children: [
                  Icon(
                    CupertinoIcons.xmark_circle,
                    color: Colors.red,
                    size: 75,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${resp['message'].toString()}",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ));
          //Get.snackbar("Terjadi Kesalahan", "${resp['message'].toString()}");
          print(resp['message'].toString());
        }
      }
    } catch (e) {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          content: Column(
            children: [
              Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.red,
                size: 75,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tidak Terhubung Dengan Server.",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ));
      //Get.snackbar("Terjadi Kesalahan", "Tidak Terhubung dengan server");
    }
    isLoading.value = false;
    update();
    return null;
  }
}
