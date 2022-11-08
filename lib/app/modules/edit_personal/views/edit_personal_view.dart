import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/edit_personal_controller.dart';

class EditPersonalView extends GetView<EditPersonalController> {
  @override
  Widget build(BuildContext context) {
    controller.namaE.text = controller.name;
    return GetBuilder<EditPersonalController>(
        init: EditPersonalController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Data Personal'),
              centerTitle: true,
              backgroundColor: Color(0xFF178D8D),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      TextFormField(
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
                        onTap: () {
                          controller.choseDateAwal();
                        },
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
                        controller: controller.hanphone,
                        keyboardType: TextInputType.number,
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
                        keyboardType: TextInputType.number,
                        controller: controller.nomorIdentitas,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.number),
                          border: UnderlineInputBorder(),
                          labelText: 'Nomor Identitas',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                          'Jenis Identitas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
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
                        keyboardType: TextInputType.number,
                        controller: controller.npwp,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.credit_card),
                          border: UnderlineInputBorder(),
                          labelText: 'NPWP',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: controller.keterangan,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.subject),
                          border: UnderlineInputBorder(),
                          labelText: 'Keterangan',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      controller.login();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 44, 195, 89)),
                      child: Center(
                        child: Text(
                          'Ajukan Perubahan',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
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
