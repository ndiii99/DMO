import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int i) async {
    switch (i) {
      case 1:
        print('Absensi');
        Map<String, dynamic> dataResponse = await determinePosition();

        if (dataResponse['error'] != true) {
          Position position = dataResponse['position'];

          print(
              'Latitude: ${position.latitude}, Longitude:${position.longitude}');

          List<Placemark> placemarks = await placemarkFromCoordinates(
              position.latitude, position.longitude);
          String address =
              '${placemarks[0].name},${placemarks[0].subLocality}, ${placemarks[0].locality}';

          print(placemarks[0]);
          print(placemarks[0].name);
          print(placemarks[0].subLocality);
          print(placemarks[0].locality);

          Get.snackbar("Berhasil", address);
        } else {
          Get.snackbar("Terjadi Kesalahan", dataResponse['message']);
        }
        // Map<String, dynamic> dataResponse = await determinePosition();

        // if (dataResponse['error'] != true) {
        //   Position position = dataResponse['position'];

        //   print(
        //       'Latitude: ${position.latitude}, Longitude:${position.longitude}');

        //   List<Placemark> placemarks = await placemarkFromCoordinates(
        //       position.latitude, position.longitude);
        //   String address =
        //       '${placemarks[0].name},${placemarks[0].subLocality}, ${placemarks[0].locality}';
        //   await updatePos(position, address);
        //   print(placemarks[0]);
        //   print(placemarks[0].name);
        //   print(placemarks[0].subLocality);
        //   print(placemarks[0].locality);
        //   await presensi(position, address);

        //   Get.snackbar("Berhasil", address);
        // } else {
        //   Get.snackbar("Terjadi Kesalahan", dataResponse['message']);
        // }
        break;
      case 2:
        pageIndex.value = i;
        Get.offAllNamed(Routes.PROFILE);
        break;
      default:
        pageIndex.value = i;
        Get.offAndToNamed(Routes.HOME);
        break;
    }
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
    return {
      'position': position,
      'message': "Berhasil Mmendapatkan posisi device",
      'error': false,
    };
  }
}
