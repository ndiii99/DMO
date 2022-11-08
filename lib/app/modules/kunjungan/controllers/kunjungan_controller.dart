import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class KunjunganController extends GetxController {
  TextEditingController namaTmpt = TextEditingController();
  TextEditingController ket = TextEditingController();
  var tmpt = '';
  late GoogleMapController googleMapController;
  CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-6.175392, 106.827153), zoom: 14);

  Set<Marker> markers = {};

  final ImagePicker picker = ImagePicker();
  //XFile? image;
  File? image;

  @override
  void onInit() async {
    super.onInit();
    //update();
    prnt();
    await absen();

    //update();
  }

  prnt() async {
    Map<String, dynamic> dataResponse = await determinePosition();
    Position position = dataResponse['position'];
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks[0]);
    tmpt = placemarks[0].thoroughfare.toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future absen() async {
    Map<String, dynamic> dataResponse = await determinePosition();
    //Position position = await determinePosition();

    if (dataResponse['error'] != true) {
      Position position = dataResponse['position'];

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14)));

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

  Future getLoc() async {}

  Future getImage(ImageSource imageSource) async {
    try {
      final image = await picker.pickImage(
          source: imageSource, preferredCameraDevice: CameraDevice.front);
      if (image == null) return;

      final imageTemporary = File(image.path);

      this.image = imageTemporary;
    } on PlatformException catch (e) {
      Get.snackbar("Terjadi Kesalahan", "Tidak Dapat Mengambil Gambar : $e");
    }
    update();
  }

  sendKunjungan() async {
    Map<String, dynamic> dataResponse = await determinePosition();
    Position position = dataResponse['position'];

    if (position.isMocked) {
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
      print(position.latitude);
      print(position.longitude);
      print(namaTmpt.text);
      print(image!.path);
      print(ket.text);
    }
  }
}
