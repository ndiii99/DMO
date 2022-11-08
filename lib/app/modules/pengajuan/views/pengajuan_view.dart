import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

import '../controllers/pengajuan_controller.dart';

class PengajuanView extends GetView<PengajuanController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PengajuanController>(
        init: PengajuanController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Pengajuan'),
              backgroundColor: Color(0xFF178D8D),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    hint: Text(
                      'Jenis Pengajuan',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    items: controller.items.map(buildMenuItem).toList(),
                    value: controller.selectedValue,
                    onChanged: (value) {
                      controller.update();
                      this.controller.selectedValue = value as String;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: controller.dateAwal,
                    onTap: () async {
                      controller.choseDateAwal();
                      //controller.update();
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ),
                      labelText: 'Tanggal Awal',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: controller.dateAkhir,
                    onTap: () async {
                      controller.choseDateAkhir();
                      //controller.update();
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ),
                      labelText: 'Tanggal Akhir',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.alasan,
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  controller.image != null
                      ? InkWell(
                          onTap: () {
                            controller.coba();
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 44, 195, 89)),
                            child: Center(
                              child: Text(
                                'Ajukan',
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
            ),
          );
        });
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(
          item,
          style: TextStyle(fontSize: 18),
        ),
        value: item,
      );
}
