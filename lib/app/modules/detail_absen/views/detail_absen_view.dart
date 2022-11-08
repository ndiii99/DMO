import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/detail_absen_controller.dart';

class DetailAbsenView extends GetView<DetailAbsenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailAbsenController>(
        init: DetailAbsenController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Detail Absen'),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.3, // or use fixed size like 200
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.asset('assets/images/logoHPS.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: GoogleMap(
                        initialCameraPosition: controller.initialCameraPosition,
                        markers: controller.markers,
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController c) {
                          controller.googleMapController = c;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tipe",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Clock In"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Senin, 01 Januari 2022"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Waktu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("07:35"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lokasi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Kantor HPS"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kordinat",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("-6.175392, 106.827153"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Keterangan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Masuk Tepat Waktu"),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
