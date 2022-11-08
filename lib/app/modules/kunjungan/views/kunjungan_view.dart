import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

import '../controllers/kunjungan_controller.dart';

class KunjunganView extends GetView<KunjunganController> {
  @override
  Widget build(BuildContext context) {
    controller.namaTmpt.text = controller.tmpt;
    return GetBuilder<KunjunganController>(
        init: KunjunganController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Kunjungan'),
                backgroundColor: Color(0xFF178D8D),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, // or use fixed size like 200
                      height: MediaQuery.of(context).size.height / 3,
                      child: GoogleMap(
                        initialCameraPosition: controller.initialCameraPosition,
                        markers: controller.markers,
                        gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>[
                          Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer())
                        ].toSet(),
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController c) {
                          controller.googleMapController = c;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onTap: () {
                        controller.prnt();
                      },
                      controller: controller.namaTmpt,
                      decoration: InputDecoration(
                        labelText: "Nama Tempat",
                        suffixIcon: Icon(CupertinoIcons.location),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: controller.ket,
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
                        controller.getImage(ImageSource.camera);
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
                    Center(
                      child: controller.image != null
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
                                        imageProvider:
                                            FileImage(controller.image!),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  child: Image.file(
                                    controller.image!,
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    controller.image != null
                        ? InkWell(
                            onTap: () {
                              controller.sendKunjungan();
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 44, 195, 89),
                              ),
                              child: Center(
                                child: Text(
                                  'Simpan Kunjungan',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ));
        });
  }
}
