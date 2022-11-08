import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AbsenController extends GetxController {
  // //TODO: Implement AbsenController
  // var jam = DateFormat.Hm().format(DateTime.now());
  var dateString =
      DateFormat('dd-MM-yyyy').format(DateTime.now()).replaceAll('/', '-');

  void absen() async {
    print('Cek');
    print('Absensi');
    Map<String, dynamic> dataResponse = await determinePosition();

    if (dataResponse['error'] != true) {
      Position position = dataResponse['position'];

      print('Latitude: ${position.latitude}, Longitude:${position.longitude}');

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
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
      'message': "Berhasil Mendapatkan posisi device",
      'error': false,
    };
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

//contoh ouput tgl = 2022-07-22

}
