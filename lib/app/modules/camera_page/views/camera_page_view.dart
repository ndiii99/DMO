import 'package:camera/camera.dart';
import 'package:dmo_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/camera_page_controller.dart';

class CameraPageView extends StatefulWidget {
  const CameraPageView({Key? key}) : super(key: key);

  @override
  State<CameraPageView> createState() => _CameraPageViewState();
}

class _CameraPageViewState extends State<CameraPageView>
    with WidgetsBindingObserver {
  CameraController? cameraController;
  bool _isCameraInitialized = false;
  XFile? image;

  void onNewCameraSelected() async {
    final previousCameraController = cameraController;
    final CameraController camCom =
        CameraController(cameras[1], ResolutionPreset.high);
    await previousCameraController?.dispose();
    if (mounted) {
      setState(() {
        cameraController = camCom;
      });
    }

    camCom.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await camCom.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = cameraController!.value.isInitialized;
      });
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode;
    onNewCameraSelected();
    super.initState();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraCont = cameraController;

    // App state changed before we got the chance to initialize.
    if (cameraCont == null || !cameraCont.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraCont.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected();
    }
  }

  // Future<XFile?> takePicture() async {
  //   final CameraController? cameraCont = cameraController;
  //   if (cameraCont!.value.isTakingPicture) {
  //     return null;
  //   }
  //   try {
  //     XFile file = await cameraCont.takePicture();
  //     return file;
  //   } on CameraException catch (e) {
  //     print('Error occured while taking picture: $e');
  //     return null;
  //   }
  // }
  Future takePicture() async {
    final CameraController? cameraCont = cameraController;
    if (cameraCont!.value.isTakingPicture) {
      return null;
    }
    try {
      image = await cameraCont.takePicture();
      final imageTemporary = XFile(image!.path);
      this.image = imageTemporary;
      print('path');
      print(image!.path);
      Get.offAllNamed(Routes.ABSEN_KELUAR, arguments: image!.path);
      //Get.
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCameraInitialized
          ? Stack(
              children: [
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.8,
                //   child: CameraPreview(cameraController!),
                // ),
                AspectRatio(
                  aspectRatio: 1 / cameraController!.value.aspectRatio,
                  child: CameraPreview(cameraController!),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.4,
                  top: MediaQuery.of(context).size.height * 0.85,
                  child: InkWell(
                    onTap: () async {
                      await takePicture();
                      // await imageFile.copy(
                      //   '${directory.path}/$currentUnix.$fileFormat',
                      // );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.circle, color: Colors.black, size: 80),
                        Icon(Icons.circle, color: Colors.white, size: 65),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
// class CameraPageView extends GetView<CameraPageController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CameraPageView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'CameraPageView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
