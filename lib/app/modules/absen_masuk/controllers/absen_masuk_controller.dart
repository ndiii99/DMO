import 'dart:convert';
import 'dart:io';

import 'package:dmo_flutter/app/modules/absen_masuk/models/absen_masuk_models.dart';
import 'package:dmo_flutter/app/routes/app_pages.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AbsenMasukController extends GetxController {
  var isLoading = false.obs;
  AbsenMasukModel? absenModel;
  TextEditingController keterangan = TextEditingController();

  late GoogleMapController googleMapController;
  CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-6.175392, 106.827153), zoom: 14);

  Set<Marker> markers = {};

  final ImagePicker picker = ImagePicker();
  //XFile? image;
  XFile? image;
  final getStorage = GetStorage();
  late String args = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    await maps();
  }

  @override
  void onReady() {
    image = XFile(args);
    super.onReady();
  }

  Future maps() async {
    Map<String, dynamic> dataResponse = await determinePosition();
    //Position position = await determinePosition();

    if (dataResponse['error'] != true) {
      Position position = dataResponse['position'];
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 15)));

      markers.clear();

      markers.add(Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude)));

      //update();

      // print('Latitude: ${position.latitude}, Longitude:${position.longitude}');

      // List<Placemark> placemarks =
      //     await placemarkFromCoordinates(position.latitude, position.longitude);
      // String address =
      //     '${placemarks[0].name},${placemarks[0].subLocality}, ${placemarks[0].locality}';

      // print(placemarks[0]);
      // print(placemarks[0].name);
      // print(placemarks[0].subLocality);
      // print(placemarks[0].locality);

      // Get.snackbar("Berhasil", address);
    } else {
      Get.snackbar("Terjadi Kesalahan", dataResponse['message']);
    }
    update();
  }

  Future<Map<String, dynamic>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      //return Future.error('Location services are disabled.');
      return {
        'message': "Nyalakan GPS device anda.",
        'error': true,
      };
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        //return Future.error('Location permissions are denied');
        return {
          'message': "Izin MEnggunakan GPS ditolak",
          'error': true,
        };
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return {
        'message':
            "Silahkan Buka Setting Aplikasi, dan perbolehkan akses lokasi untuk aplikasi. ",
        'error': true,
      };

      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    Position position = await Geolocator.getCurrentPosition();
    //update();

    return {
      'position': position,
      'message': "Berhasil Mendapatkan posisi device",
      'error': false,
    };
  }

  Future getImage(ImageSource imageSource) async {
    try {
      final image = await picker.pickImage(
          source: imageSource, preferredCameraDevice: CameraDevice.front);
      if (image == null) return;

      final imageTemporary = XFile(image.path);

      this.image = imageTemporary;
    } on PlatformException catch (e) {
      Get.snackbar("Terjadi Kesalahan", "Tidak Dapat Mengambil Gambar : $e");
    }
    update();
  }

  Future<AbsenMasukModel?> absenMasuk() async {
    update();
    //position
    Map<String, dynamic> dataResponse = await determinePosition();
    Position position = dataResponse['position'];
    //url
    var url = getStorage.read('url');
    //nik
    final data = getStorage.read('user') as Map<String, dynamic>;
    var nik = data['nik'];
    //form data
    // var map = new Map<String, dynamic>();
    // map['name'] = 'morpheus';
    // map['job'] = 'leader';

    var map = new Map<String, dynamic>();
    map['nik'] = nik.toString();
    map['latitude'] = position.latitude.toString();
    map['longtitude'] = position.longitude.toString();
    map['jenis'] = '1';
    map['keterangan'] = keterangan.text.toString();
    map['gambar'] = '';
    print(url);
    print(nik);
    print(position.latitude);
    print(position.longitude);
    print(image!.path);
    // var uri = Uri.parse('$url/api-dev-hris/v1/hris/absensi');
    // var request = new http.MultipartRequest('Post', uri);
    if (position.isMocked) {}
    try {
      final res =
          await http.post(Uri.parse('$url/api-dev-hris/v1/hris/absensi'),
              headers: {
                'hris-acces-token':
                    'fbcbf9f375f77cff0dd3d3a305d1008b3a461fa1b9fd3748f497b2860d57e7ac'
              },
              body: map);
      print(res.statusCode);
      if (res.statusCode == 200) {
        var response = json.decode(res.body);

        update();
        print('');
        var respon = json.decode(res.body)['data'];
        absenModel = AbsenMasukModel.fromJson(respon);
        // print(user!.nik);
        // print(user!.jabatan);
        // print(user!.nama);

        Get.offNamed(Routes.HOME);
        Get.defaultDialog(
          title: '${response['message']}',
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
            ],
          ),
        );
        //Get.snackbar("Berhasil", "${response['message'].toString()}");

      } else {
        var resp = json.decode(res.body);
        update();
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  textAlign: TextAlign.center,
                ),
              ],
            ));
        //Get.snackbar("Terjadi Kesalahan", "${resp['message'].toString()}");
        print(resp['message'].toString());
      }
    } catch (e) {
      print('error');
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
  }

  Future absenMultipart() async {
    isLoading.value = true;
    update();
    //position
    Map<String, dynamic> dataResponse = await determinePosition();
    Position position = dataResponse['position'];
    //url
    var url = getStorage.read('url');
    //nik
    final data = getStorage.read('user') as Map<String, dynamic>;
    var nik = data['nik'];
    //form data
    // var map = new Map<String, dynamic>();
    // map['name'] = 'morpheus';
    // map['job'] = 'leader';

    // var map = new Map<String, dynamic>();
    // map['nik'] = nik.toString();
    // map['latitude'] = position.latitude.toString();
    // map['longtitude'] = position.longitude.toString();
    // map['jenis'] = '1';
    // map['keterangan'] = keterangan.text.toString();
    print(url);
    print(nik);
    print(position.latitude);
    print(position.longitude);
    print(image!.path);

    var uri = Uri.parse('$url/api-dev-hris/v1/hris/absensi');
    final file = await http.MultipartFile.fromPath(
      'gambar',
      image!.path,
    );
    Map<String, String> headers = {
      "hris-acces-token":
          "fbcbf9f375f77cff0dd3d3a305d1008b3a461fa1b9fd3748f497b2860d57e7ac"
    };
    var request = new http.MultipartRequest('Post', uri);
    request.headers.addAll(headers);
    request.fields['nik'] = nik.toString();
    request.fields['latitude'] = position.latitude.toString();
    request.fields['longtitude'] = position.longitude.toString();
    request.fields['jenis'] = '1';
    request.fields['keterangan'] = keterangan.text.toString();
    request.files.add(file);

    if (position.isMocked == true) {
      print('gagal');
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              "Matikan Fake GPS Anda",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else {
      var response = await request.send();
      var res = await http.Response.fromStream(response);
      var resp = json.decode(res.body);
      if (response.statusCode == 200) {
        print('sukses');
        Get.offNamed(Routes.HOME);
        Get.defaultDialog(
            title: '${resp['message']}',
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
              ],
            ));
      } else {
        print('gagal');
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }
    }
    isLoading.value = false;
    update();
  }
}
