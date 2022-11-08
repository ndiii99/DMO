import 'dart:io';

import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

import '../controllers/absen_keluar_controller.dart';

class AbsenKeluarView extends GetView<AbsenKeluarController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AbsenKeluarController>(
        init: AbsenKeluarController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Absen Pulang'),
              backgroundColor: Color(0xFF178D8D),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                SizedBox(
                  width: MediaQuery.of(context)
                      .size
                      .width, // or use fixed size like 200
                  height: MediaQuery.of(context).size.height / 3,
                  child: GoogleMap(
                    initialCameraPosition: controller.initialCameraPosition,
                    markers: controller.markers,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                      Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer())
                    ].toSet(),
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController c) {
                      controller.googleMapController = c;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.keterangan,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.subject,
                            color: Colors.black,
                          ),
                          labelText: 'Keterangan',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        onTap: () {
                          Get.toNamed(Routes.CAMERA_KELUAR);
                          //controller.getImage(ImageSource.camera);
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.camera),
                          border: UnderlineInputBorder(),
                          labelText: 'Silahkan Ambil Foto',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      controller.image != null
                          ? ClipOval(
                              child: InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: 'Foto',
                                    content: Container(
                                      height: 400,
                                      width: 400,
                                      child: PhotoView(
                                        enableRotation: false,
                                        imageProvider: FileImage(
                                            File(controller.image!.path)),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  child: Image.file(
                                    File(controller.image!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                'Foto',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      controller.image != null
                          ? Obx(
                              () => InkWell(
                                onTap: controller.isLoading.value
                                    ? null
                                    : () => controller.absenMultipart(),
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 44, 195, 89),
                                  ),
                                  child: Center(
                                    child: controller.isLoading.value
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircularProgressIndicator(),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Loading....',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            'Clock Out',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
