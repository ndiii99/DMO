import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LaporanPengajuanController extends GetxController {
  DateTime? dateawal;
  TextEditingController dateAwal = TextEditingController();
  TextEditingController dateAkhir = TextEditingController();

  var dateRange = DateTimeRange(
          start: DateTime.now(),
          end: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2))
      .obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  chooseDateRangePicker() async {
    DateTimeRange? picker = await showDateRangePicker(
        context: Get.context!,
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20),
        initialDateRange: dateRange.value);
    if (picker != null && picker != dateRange.value) {
      dateRange.value = picker;
      print(dateRange.value.start.toString());
      print(dateRange.value.end.toString());
    }
  }

  choseDateAwal() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (pickedDate != null) {
      // dateawal = pickedDate;
      // dateAwal
      //   ..text = DateFormat('dd-MM-yyyy').format(dateawal!)
      //   ..selection = TextSelection.fromPosition(TextPosition(
      //       offset: dateAwal.text.length, affinity: TextAffinity.upstream));
      String date = DateFormat('dd-MM-yyyy').format(pickedDate);
      dateAwal.text = date;
      update();
    }
  }

  choseDateAkhir() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (pickedDate != null) {
      String date = DateFormat('dd-MM-yyyy').format(pickedDate);
      dateAkhir.text = date;
      update();
    }
  }

  postLaporanAbsen() {
    print(dateAwal.text);
    print(dateAkhir.text);
  }
}
