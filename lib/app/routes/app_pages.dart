import 'package:get/get.dart';

import 'package:dmo_flutter/app/modules/absen/bindings/absen_binding.dart';
import 'package:dmo_flutter/app/modules/absen/views/absen_view.dart';
import 'package:dmo_flutter/app/modules/absen_keluar/bindings/absen_keluar_binding.dart';
import 'package:dmo_flutter/app/modules/absen_keluar/views/absen_keluar_view.dart';
import 'package:dmo_flutter/app/modules/absen_masuk/bindings/absen_masuk_binding.dart';
import 'package:dmo_flutter/app/modules/absen_masuk/views/absen_masuk_view.dart';
import 'package:dmo_flutter/app/modules/approval/bindings/approval_binding.dart';
import 'package:dmo_flutter/app/modules/approval/views/approval_view.dart';
import 'package:dmo_flutter/app/modules/bbm/bindings/bbm_binding.dart';
import 'package:dmo_flutter/app/modules/bbm/views/bbm_view.dart';
import 'package:dmo_flutter/app/modules/camera_keluar/bindings/camera_keluar_binding.dart';
import 'package:dmo_flutter/app/modules/camera_keluar/views/camera_keluar_view.dart';
import 'package:dmo_flutter/app/modules/camera_masuk/bindings/camera_masuk_binding.dart';
import 'package:dmo_flutter/app/modules/camera_masuk/views/camera_masuk_view.dart';
import 'package:dmo_flutter/app/modules/camera_page/bindings/camera_page_binding.dart';
import 'package:dmo_flutter/app/modules/camera_page/views/camera_page_view.dart';
import 'package:dmo_flutter/app/modules/data_keluarga/bindings/data_keluarga_binding.dart';
import 'package:dmo_flutter/app/modules/data_keluarga/views/data_keluarga_view.dart';
import 'package:dmo_flutter/app/modules/data_pekerjaan/bindings/data_pekerjaan_binding.dart';
import 'package:dmo_flutter/app/modules/data_pekerjaan/views/data_pekerjaan_view.dart';
import 'package:dmo_flutter/app/modules/data_pendidikan/bindings/data_pendidikan_binding.dart';
import 'package:dmo_flutter/app/modules/data_pendidikan/views/data_pendidikan_view.dart';
import 'package:dmo_flutter/app/modules/data_personal/bindings/data_personal_binding.dart';
import 'package:dmo_flutter/app/modules/data_personal/views/data_personal_view.dart';
import 'package:dmo_flutter/app/modules/detail_absen/bindings/detail_absen_binding.dart';
import 'package:dmo_flutter/app/modules/detail_absen/views/detail_absen_view.dart';
import 'package:dmo_flutter/app/modules/detail_keluarga/bindings/detail_keluarga_binding.dart';
import 'package:dmo_flutter/app/modules/detail_keluarga/views/detail_keluarga_view.dart';
import 'package:dmo_flutter/app/modules/detail_kontak/bindings/detail_kontak_binding.dart';
import 'package:dmo_flutter/app/modules/detail_kontak/views/detail_kontak_view.dart';
import 'package:dmo_flutter/app/modules/detail_pendidikan/bindings/detail_pendidikan_binding.dart';
import 'package:dmo_flutter/app/modules/detail_pendidikan/views/detail_pendidikan_view.dart';
import 'package:dmo_flutter/app/modules/edit_pekerjaan/bindings/edit_pekerjaan_binding.dart';
import 'package:dmo_flutter/app/modules/edit_pekerjaan/views/edit_pekerjaan_view.dart';
import 'package:dmo_flutter/app/modules/edit_pendidikan/bindings/edit_pendidikan_binding.dart';
import 'package:dmo_flutter/app/modules/edit_pendidikan/views/edit_pendidikan_view.dart';
import 'package:dmo_flutter/app/modules/edit_personal/bindings/edit_personal_binding.dart';
import 'package:dmo_flutter/app/modules/edit_personal/views/edit_personal_view.dart';
import 'package:dmo_flutter/app/modules/ganti_password/bindings/ganti_password_binding.dart';
import 'package:dmo_flutter/app/modules/ganti_password/views/ganti_password_view.dart';
import 'package:dmo_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:dmo_flutter/app/modules/home/views/home_view.dart';
import 'package:dmo_flutter/app/modules/kontak_darurat/bindings/kontak_darurat_binding.dart';
import 'package:dmo_flutter/app/modules/kontak_darurat/views/kontak_darurat_view.dart';
import 'package:dmo_flutter/app/modules/kunjungan/bindings/kunjungan_binding.dart';
import 'package:dmo_flutter/app/modules/kunjungan/views/kunjungan_view.dart';
import 'package:dmo_flutter/app/modules/laporan/bindings/laporan_binding.dart';
import 'package:dmo_flutter/app/modules/laporan/views/laporan_view.dart';
import 'package:dmo_flutter/app/modules/laporan_absen/bindings/laporan_absen_binding.dart';
import 'package:dmo_flutter/app/modules/laporan_absen/views/laporan_absen_view.dart';
import 'package:dmo_flutter/app/modules/laporan_approval/bindings/laporan_approval_binding.dart';
import 'package:dmo_flutter/app/modules/laporan_approval/views/laporan_approval_view.dart';
import 'package:dmo_flutter/app/modules/laporan_pengajuan/bindings/laporan_pengajuan_binding.dart';
import 'package:dmo_flutter/app/modules/laporan_pengajuan/views/laporan_pengajuan_view.dart';
import 'package:dmo_flutter/app/modules/list_notifikasi/bindings/list_notifikasi_binding.dart';
import 'package:dmo_flutter/app/modules/list_notifikasi/views/list_notifikasi_view.dart';
import 'package:dmo_flutter/app/modules/login_page/bindings/login_page_binding.dart';
import 'package:dmo_flutter/app/modules/login_page/views/login_page_view.dart';
import 'package:dmo_flutter/app/modules/odometer/bindings/odometer_binding.dart';
import 'package:dmo_flutter/app/modules/odometer/views/odometer_view.dart';
import 'package:dmo_flutter/app/modules/pengajuan/bindings/pengajuan_binding.dart';
import 'package:dmo_flutter/app/modules/pengajuan/views/pengajuan_view.dart';
import 'package:dmo_flutter/app/modules/penjualan/bindings/penjualan_binding.dart';
import 'package:dmo_flutter/app/modules/penjualan/views/penjualan_view.dart';
import 'package:dmo_flutter/app/modules/profile/bindings/profile_binding.dart';
import 'package:dmo_flutter/app/modules/profile/views/profile_view.dart';
import 'package:dmo_flutter/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:dmo_flutter/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:dmo_flutter/app/modules/tambah_keluarga/bindings/tambah_keluarga_binding.dart';
import 'package:dmo_flutter/app/modules/tambah_keluarga/views/tambah_keluarga_view.dart';
import 'package:dmo_flutter/app/modules/tambah_kontak/bindings/tambah_kontak_binding.dart';
import 'package:dmo_flutter/app/modules/tambah_kontak/views/tambah_kontak_view.dart';
import 'package:dmo_flutter/app/modules/tambah_pendidikan/bindings/tambah_pendidikan_binding.dart';
import 'package:dmo_flutter/app/modules/tambah_pendidikan/views/tambah_pendidikan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN,
      page: () => AbsenView(),
      binding: AbsenBinding(),
    ),
    GetPage(
      name: _Paths.PENJUALAN,
      page: () => PenjualanView(),
      binding: PenjualanBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_MASUK,
      page: () => AbsenMasukView(),
      binding: AbsenMasukBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_KELUAR,
      page: () => AbsenKeluarView(),
      binding: AbsenKeluarBinding(),
    ),
    GetPage(
      name: _Paths.KUNJUNGAN,
      page: () => KunjunganView(),
      binding: KunjunganBinding(),
    ),
    GetPage(
      name: _Paths.ODOMETER,
      page: () => OdometerView(),
      binding: OdometerBinding(),
    ),
    GetPage(
      name: _Paths.BBM,
      page: () => BbmView(),
      binding: BbmBinding(),
    ),
    GetPage(
      name: _Paths.PENGAJUAN,
      page: () => PengajuanView(),
      binding: PengajuanBinding(),
    ),
    GetPage(
      name: _Paths.APPROVAL,
      page: () => ApprovalView(),
      binding: ApprovalBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN,
      page: () => LaporanView(),
      binding: LaporanBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_ABSEN,
      page: () => LaporanAbsenView(),
      binding: LaporanAbsenBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PENGAJUAN,
      page: () => LaporanPengajuanView(),
      binding: LaporanPengajuanBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_APPROVAL,
      page: () => LaporanApprovalView(),
      binding: LaporanApprovalBinding(),
    ),
    GetPage(
      name: _Paths.DATA_PERSONAL,
      page: () => DataPersonalView(),
      binding: DataPersonalBinding(),
    ),
    GetPage(
      name: _Paths.DATA_PEKERJAAN,
      page: () => DataPekerjaanView(),
      binding: DataPekerjaanBinding(),
    ),
    GetPage(
      name: _Paths.DATA_KELUARGA,
      page: () => DataKeluargaView(),
      binding: DataKeluargaBinding(),
    ),
    GetPage(
      name: _Paths.DATA_PENDIDIKAN,
      page: () => DataPendidikanView(),
      binding: DataPendidikanBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK_DARURAT,
      page: () => KontakDaruratView(),
      binding: KontakDaruratBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PERSONAL,
      page: () => EditPersonalView(),
      binding: EditPersonalBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PEKERJAAN,
      page: () => EditPekerjaanView(),
      binding: EditPekerjaanBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PENDIDIKAN,
      page: () => EditPendidikanView(),
      binding: EditPendidikanBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_PENDIDIKAN,
      page: () => TambahPendidikanView(),
      binding: TambahPendidikanBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_KELUARGA,
      page: () => TambahKeluargaView(),
      binding: TambahKeluargaBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_KONTAK,
      page: () => TambahKontakView(),
      binding: TambahKontakBinding(),
    ),
    GetPage(
      name: _Paths.GANTI_PASSWORD,
      page: () => GantiPasswordView(),
      binding: GantiPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KELUARGA,
      page: () => DetailKeluargaView(),
      binding: DetailKeluargaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PENDIDIKAN,
      page: () => DetailPendidikanView(),
      binding: DetailPendidikanBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KONTAK,
      page: () => DetailKontakView(),
      binding: DetailKontakBinding(),
    ),
    GetPage(
      name: _Paths.LIST_NOTIFIKASI,
      page: () => ListNotifikasiView(),
      binding: ListNotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ABSEN,
      page: () => DetailAbsenView(),
      binding: DetailAbsenBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_PAGE,
      page: () => CameraPageView(),
      binding: CameraPageBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_MASUK,
      page: () => CameraMasukView(),
      binding: CameraMasukBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_KELUAR,
      page: () => CameraKeluarView(),
      binding: CameraKeluarBinding(),
    ),
  ];
}
