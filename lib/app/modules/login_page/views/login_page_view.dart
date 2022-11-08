import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFF178D8D),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //physics: NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 5),
                              child: Image.asset(
                                "assets/images/LogoAPK.png",
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "DMLT Mob Online",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextField(
                                  controller: controller.emailC,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(CupertinoIcons.person),
                                    hintText: "NIK",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Obx(
                                  () => TextFormField(
                                    obscureText:
                                        controller.isPasswordHidden.value,
                                    controller: controller.passwordC,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.key),
                                      suffixIcon: InkWell(
                                        child: Obx(
                                          () => Icon(
                                            controller.isPasswordHidden.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        onTap: () {
                                          controller.toggle();
                                        },
                                      ),
                                      hintText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Obx(
                            () => InkWell(
                              onTap: controller.isLoading.value
                                  ? null
                                  : () => controller.login(),
                              child: Container(
                                height: 50,
                                width: 200,
                                //margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(255, 44, 195, 89),
                                ),
                                child: Center(
                                  child: controller.isLoading.value
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CircularProgressIndicator(),
                                            Text(
                                              'Loading....',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      : Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Obx(
                            () => InkWell(
                              onTap: controller.isLoading.value
                                  ? null
                                  : () => controller.authenticateUser(),
                              child: Container(
                                height: 50,
                                width: 200,
                                //margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(255, 44, 195, 89),
                                ),
                                child: Center(
                                    child: controller.isLoading.value
                                        ? CircularProgressIndicator()
                                        : Icon(
                                            Icons.fingerprint,
                                            size: 50,
                                          )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/logoHPS.png',
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'PT. Hasta Prima Solusi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'V. 1.0',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // body: Center(
          //   child: Container(
          //     padding: EdgeInsets.all(30),
          //     decoration: BoxDecoration(color: Color(0xFF178D8D)),
          //     child: Center(
          //         child: ListView(
          //       children: [
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Padding(
          //           padding: EdgeInsets.all(20),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Flexible(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Text(
          //                           "Login",
          //                           style: TextStyle(
          //                               color: Colors.white, fontSize: 40),
          //                         ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         Text(
          //                           "Aplikasi Presesnsi",
          //                           style: TextStyle(
          //                               color: Colors.white, fontSize: 15),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   Flexible(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       children: [
          //                         Container(
          //                           alignment: Alignment.centerRight,
          //                           child: Image.asset(
          //                             "assets/images/LogoAPK.png",
          //                             width: 100,
          //                             height: 100,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: 40,
          //         ),
          //         Expanded(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(60),
          //                 bottomRight: Radius.circular(60),
          //               ),
          //             ),
          //             child: Padding(
          //               padding: EdgeInsets.all(20),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 children: [
          //                   Container(
          //                     padding: EdgeInsets.all(20),
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(20),
          //                       color: Colors.white,
          //                       boxShadow: [
          //                         BoxShadow(
          //                           color: Colors.black,
          //                           blurRadius: 5,
          //                           offset: Offset(0, 2),
          //                         ),
          //                       ],
          //                     ),
          //                     child: Column(
          //                       children: [
          //                         Container(
          //                           decoration: BoxDecoration(
          //                             border: Border(
          //                               bottom: BorderSide(
          //                                 color: Colors.grey.withAlpha(200),
          //                               ),
          //                             ),
          //                           ),
          //                           child: TextField(
          //                             controller: controller.emailC,
          //                             decoration: InputDecoration(
          //                               labelText: "NIK",
          //                               border: OutlineInputBorder(),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         Container(
          //                           decoration: BoxDecoration(
          //                             border: Border(
          //                               bottom: BorderSide(
          //                                 color: Colors.grey.withAlpha(200),
          //                               ),
          //                             ),
          //                           ),
          //                           child: TextField(
          //                             obscureText: true,
          //                             controller: controller.passwordC,
          //                             decoration: InputDecoration(
          //                               labelText: "Password",
          //                               border: OutlineInputBorder(),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 20,
          //                   ),
          //                   InkWell(
          //                     onTap: () {
          //                       //Get.offNamed(Routes.ABSEN);
          //                       controller.login();
          //                     },
          //                     child: Container(
          //                       height: 50,
          //                       width: 200,
          //                       margin: EdgeInsets.symmetric(horizontal: 50),
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(50),
          //                         color: Color.fromARGB(255, 44, 195, 89),
          //                       ),
          //                       child: Center(
          //                           child: Text(
          //                         'LOGIN',
          //                         style: TextStyle(
          //                             color: Colors.white,
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold),
          //                       )),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     )),
          //   ),
          // ),
        );
      },
    );
  }
}
