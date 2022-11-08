import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ganti_password_controller.dart';

class GantiPasswordView extends GetView<GantiPasswordController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GantiPasswordController>(
        init: GantiPasswordController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Ganti Password'),
              backgroundColor: Color(0xFF178D8D),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Obx(
                        () => TextFormField(
                          obscureText: controller.isPasswordHidden.value,
                          controller: controller.passlama,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            border: UnderlineInputBorder(),
                            labelText: 'Masukan Password Lama Anda',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.isPasswordHidden.value,
                          controller: controller.passBaru,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            border: UnderlineInputBorder(),
                            labelText: 'Masukan Password Baru Anda',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.isPasswordHidden.value,
                          controller: controller.confPass,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            border: UnderlineInputBorder(),
                            labelText: 'Konfirmasi Password Baru Anda',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Obx(
                          () => Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Tampilkan Password'),
                      ],
                    ),
                    onTap: () {
                      controller.toggle();
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      controller.rubahData();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 44, 195, 89)),
                      child: Center(
                        child: Text(
                          'Ganti Password',
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
}
