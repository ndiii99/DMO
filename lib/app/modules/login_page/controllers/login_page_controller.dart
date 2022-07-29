import 'dart:convert';
import 'dart:developer';

import 'package:dmo_flutter/app/modules/login_page/models/user_model.dart';
import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPageController extends GetxController {
  UserModel? user;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool visible = false;
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<UserModel?> login() async {
    update();
    visible = true;
    //final prefs = await SharedPreferences.getInstance();
    var params =
        "login?username=" + emailC.text + "&password=" + passwordC.text;

    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      //log("Berhasil");
      try {
        final res = await http.get(
          Uri.parse(
              'http://www.api.hris-dmlt.com/rest-dmlt-aset/dmlt/' + params),
          // Send authorization headers to the backend.
          headers: {
            "dmlt-key-acces-token":
                "436be6ca3e99ae8612605e00a849162888211ec151b1e6c390855dbd55f6313e"
          },
        );
        print(res.statusCode);
        if (res.statusCode == 200) {
          var response = json.decode(res.body);
          try {
            if (response['status'] == true) {
              getStorage.write('id', 1);

              ///prefs.setBool('login', true);
              update();
              visible = true;
              print(response['message'].toString());
              print('');
              var respon = json.decode(res.body)['data']; //ini datanya
              print(respon);
              user = UserModel.fromJson(respon);
              print(user);
              getStorage.write('user', {
                'username': user!.username,
                'password': user!.password,
              });

              //getStorage.read(user!.username);
              print(user!.username);
              Get.offNamedUntil(
                Routes.HOME,
                (route) => false,
              );
              Get.snackbar("Berhasil", "${response['message'].toString()}");
            }
          } catch (e) {}
        } else {
          var resp = json.decode(res.body);
          if (resp['status'] == false) {
            update();
            visible = true;
            Get.snackbar(
                "Terjadi Kesalahan", "Pastikan email dan password anda benar.");
            print(resp['message'].toString());
          }
        }
      } catch (e) {
        print('Tidak Terkoneksi Dengan Database.');
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Username dan Password Harus diisi");
    }
  }

  _showAlertDialog(
    BuildContext context,
  ) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () => Navigator.pop(context),
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content: Text('User Tidak di Temukan / Password Salah'),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
