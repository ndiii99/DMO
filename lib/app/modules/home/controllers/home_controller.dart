import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  final getStorage = GetStorage();
  late var name = '';

  @override
  void onInit() {
    super.onInit();
    //error dissini jan
    // final data = getStorage.read('user') as Map<String, dynamic>;
    // name = data['username'];
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void logOut() async {
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setBool('login', false);
    getStorage.erase();
    Get.offNamedUntil(Routes.LOGIN_PAGE, (route) => false);
  }
}
