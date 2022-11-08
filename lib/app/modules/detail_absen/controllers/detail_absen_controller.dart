import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailAbsenController extends GetxController {
  late GoogleMapController googleMapController;
  CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-6.175392, 106.827153), zoom: 14);

  Set<Marker> markers = {};

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
