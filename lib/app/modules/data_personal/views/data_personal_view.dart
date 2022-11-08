import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_personal_controller.dart';

class DataPersonalView extends GetView<DataPersonalController> {
  @override
  Widget build(BuildContext context) {
    controller.namaE.text = controller.name;
    return GetBuilder<DataPersonalController>(
      init: DataPersonalController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Data Personal'),
            backgroundColor: Color(0xFF178D8D),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.EDIT_PERSONAL);
                },
                icon: Icon(Icons.edit_note),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Center(
                  child: ClipOval(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey,
                      child: Center(
                        child: Image.network(
                          controller.defaultImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Ubah Foto Profil',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      readOnly: true,
                      controller: controller.namaE,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.abc),
                        border: UnderlineInputBorder(),
                        labelText: 'Nama',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.email,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.jenisKelamin,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.male),
                        border: UnderlineInputBorder(),
                        labelText: 'Jenis Kelamin',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.tempatLahir,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.location_pin),
                        border: UnderlineInputBorder(),
                        labelText: 'Tempat Lahir',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.tanggalLahir,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today),
                        border: UnderlineInputBorder(),
                        labelText: 'Tanggal Lahir',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.hanphone,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.phone_android),
                        border: UnderlineInputBorder(),
                        labelText: 'No. Hp',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.tmpt,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.home),
                        border: UnderlineInputBorder(),
                        labelText: 'Tempat Tinggal',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.statusPernikahan,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.family_restroom),
                        border: UnderlineInputBorder(),
                        labelText: 'Status Pernikahan',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.agama,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Agama',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.nomorIdentitas,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.numbers),
                        border: UnderlineInputBorder(),
                        labelText: 'Nomor Identitas',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.jenisIdentitas,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.credit_card),
                        border: UnderlineInputBorder(),
                        labelText: 'Jenis Identitas',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: controller.npwp,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.credit_card),
                        border: UnderlineInputBorder(),
                        labelText: 'NPWP',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
