import 'package:dropdown_search/dropdown_search.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/usaha_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

class InformasiAnggotaView extends StatelessWidget {
  final String namaTeam;
  final String teamId;
  final String status;
  InformasiAnggotaView(
      {super.key,
      required this.namaTeam,
      required this.teamId,
      required this.status});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: homeController.indicator,
              onPageChanged: (value) {
                homeController.page.value = value;
                print(homeController.page.value);
              },
              children: [
                //1
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: birulangit,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(
                                30,
                              ),
                              bottomRight: Radius.circular(
                                30,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.offAll(UsahaView());
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: putih,
                                    ),
                                  ),
                                  Text(
                                    'Team',
                                    style: GoogleFonts.poppins(
                                      color: putih,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: putih,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 15.w,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                            color: pembeda,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              namaTeam,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              status,
                                              style: GoogleFonts.poppins(),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller:
                                    homeController.namaAnggotaTeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Nama',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Foto',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: hitam,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: '757575'.toColor(),
                                        border: Border.all(
                                            width: 0.1.w, color: hitam)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Obx(
                                          () => homeController
                                                      .imageAnggota1.value ==
                                                  null
                                              ? Image.asset(
                                                  'assets/no-image.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  homeController
                                                      .imageAnggota1.value!,
                                                  fit: BoxFit.cover,
                                                ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          homeController
                                              .getImageFromGalleryAnggota1();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            'Pilih Foto',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => homeController
                                                    .imageAnggota1.value ==
                                                null
                                            ? SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  'Tidak ada foto yang dipilih',
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  homeController
                                                      .imageAnggota1.value!.path
                                                      .split('/')
                                                      .last,
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Foto KTP/SIM/Pasport',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: hitam,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: '757575'.toColor(),
                                        border: Border.all(
                                            width: 0.1.w, color: hitam)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Obx(
                                          () => homeController
                                                      .imageFotoKtpAnggota1
                                                      .value ==
                                                  null
                                              ? Image.asset(
                                                  'assets/no-image.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  homeController
                                                      .imageFotoKtpAnggota1
                                                      .value!,
                                                  fit: BoxFit.cover,
                                                ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          homeController
                                              .getImageFromGalleryKtpAnggota1();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            'Pilih Foto',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => homeController
                                                    .imageFotoKtpAnggota1
                                                    .value ==
                                                null
                                            ? SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  'Tidak ada foto yang dipilih',
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  homeController
                                                      .imageFotoKtpAnggota1
                                                      .value!
                                                      .path
                                                      .split('/')
                                                      .last,
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller:
                                    homeController.noHpAnggotaTeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Nomor Hp',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller: homeController
                                    .instagramAnggotaTeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Instagram',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Ukuran Baju',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.1.w,
                                      color: hitam,
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Obx(
                                    () {
                                      return DropdownSearch<String>(
                                        popupProps: PopupProps.modalBottomSheet(
                                          constraints:
                                              BoxConstraints(maxHeight: 35.h),
                                          showSelectedItems: true,
                                        ),
                                        items: homeController
                                            .ukuranBaju
                                            // ignore: invalid_use_of_protected_member
                                            .value,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            fillColor: hitam,
                                            labelStyle: TextStyle(
                                              color: hitam,
                                            ),
                                          ),
                                          baseStyle: GoogleFonts.poppins(
                                              color: hitam,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (value) {
                                          homeController
                                              .selectedUkuranBajuAnggota1
                                              .value = value!;
                                        },
                                        selectedItem: "",
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Pendidikan Terakhir',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.1.w,
                                      color: hitam,
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Obx(
                                    () {
                                      return DropdownSearch<String>(
                                        popupProps: PopupProps.modalBottomSheet(
                                          constraints:
                                              BoxConstraints(maxHeight: 42.h),
                                          showSelectedItems: true,
                                        ),
                                        items: homeController
                                            .pendidikanTerakhir
                                            // ignore: invalid_use_of_protected_member
                                            .value,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            fillColor: hitam,
                                            labelStyle: TextStyle(
                                              color: hitam,
                                            ),
                                          ),
                                          baseStyle: GoogleFonts.poppins(
                                              color: hitam,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (value) {
                                          homeController
                                              .selectedPendidikanTerakhirAnggota1
                                              .value = value!;
                                        },
                                        selectedItem: "",
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(
                                    () => homeController.informasiAnggota.value
                                                .teamAnggotaTotal! >=
                                            3
                                        ? Container()
                                        : ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: birulangit,
                                            ),
                                            onPressed: () {
                                              if (homeController.namaAnggotaTeamController.text.isEmpty ||
                                                  homeController
                                                      .noHpAnggotaTeamController
                                                      .text
                                                      .isEmpty ||
                                                  homeController
                                                      .instagramAnggotaTeamController
                                                      .text
                                                      .isEmpty ||
                                                  homeController
                                                      .selectedUkuranBajuAnggota1
                                                      .value
                                                      .isEmpty ||
                                                  homeController
                                                      .selectedPendidikanTerakhirAnggota1
                                                      .value
                                                      .isEmpty) {
                                                Get.snackbar(
                                                  'Failed',
                                                  'Data Tidak Boleh Kosong',
                                                  colorText: Colors.white,
                                                  backgroundColor:
                                                      Colors.red[300],
                                                  icon: const Icon(
                                                      Icons.warning,
                                                      color: Colors.white),
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                );
                                              } else if (homeController
                                                      .page.value >=
                                                  0) {
                                                homeController.page.value++;
                                                homeController.indicator
                                                    .animateToPage(
                                                  homeController.page.value,
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Tambah',
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: putih,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () async {
                                      if (homeController.namaAnggotaTeamController.text.isEmpty &&
                                          homeController
                                              .noHpAnggotaTeamController
                                              .text
                                              .isEmpty &&
                                          homeController
                                              .instagramAnggotaTeamController
                                              .text
                                              .isEmpty &&
                                          homeController
                                              .selectedUkuranBajuAnggota1
                                              .value
                                              .isEmpty &&
                                          homeController
                                              .selectedPendidikanTerakhirAnggota1
                                              .value
                                              .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Data Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .namaAnggotaTeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Nama Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .noHpAnggotaTeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Nomor Hp Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .instagramAnggotaTeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Instagram Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .selectedUkuranBajuAnggota1
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Ukuran Baju Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .selectedPendidikanTerakhirAnggota1
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Pendidikan Terakhir Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else {
                                        final fotoAnggota1File = homeController
                                            .getImageFileFromAsset(
                                                'assets/no-image.jpg',
                                                'no-image.jpg');
                                        final fotoKtpAnggota1File =
                                            homeController
                                                .getImageFileFromAsset(
                                                    'assets/no-image.jpg',
                                                    'no-image.jpg');

                                        homeController.registerInformasiAnggota(
                                          teamId: teamId,
                                          namaAnggota: [
                                            homeController
                                                .namaAnggotaTeamController.text,
                                          ],
                                          nohpAnggota: [
                                            homeController
                                                .noHpAnggotaTeamController.text,
                                          ],
                                          instagramAnggota: [
                                            homeController
                                                .instagramAnggotaTeamController
                                                .text,
                                          ],
                                          ukuranBajuAnggota: [
                                            homeController
                                                .selectedUkuranBajuAnggota1
                                                .value,
                                          ],
                                          pendidikanTerakhirAnggota: [
                                            homeController
                                                .selectedPendidikanTerakhirAnggota1
                                                .value,
                                          ],
                                          fotoAnggota: [
                                            homeController
                                                        .imageAnggota1.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota1.value!,
                                          ],
                                          fotoIdAnggota: [
                                            homeController.imageFotoKtpAnggota1
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota1
                                                    .value!,
                                          ],
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Text(
                                        'Simpan',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: putih,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //2
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: birulangit,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(
                                30,
                              ),
                              bottomRight: Radius.circular(
                                30,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.offAll(UsahaView());
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: putih,
                                    ),
                                  ),
                                  Text(
                                    'Team',
                                    style: GoogleFonts.poppins(
                                      color: putih,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: putih,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 15.w,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                            color: pembeda,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              namaTeam,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              status,
                                              style: GoogleFonts.poppins(),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller:
                                    homeController.namaAnggota1TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Nama',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Foto',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: hitam,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: '757575'.toColor(),
                                        border: Border.all(
                                            width: 0.1.w, color: hitam)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Obx(
                                          () => homeController
                                                      .imageAnggota2.value ==
                                                  null
                                              ? Image.asset(
                                                  'assets/no-image.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  homeController
                                                      .imageAnggota2.value!,
                                                  fit: BoxFit.cover,
                                                ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          homeController
                                              .getImageFromGalleryAnggota2();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            'Pilih Foto',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => homeController
                                                    .imageAnggota2.value ==
                                                null
                                            ? SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  'Tidak ada foto yang dipilih',
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  homeController
                                                      .imageAnggota2.value!.path
                                                      .split('/')
                                                      .last,
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Foto KTP/SIM/Pasport',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: hitam,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: '757575'.toColor(),
                                        border: Border.all(
                                            width: 0.1.w, color: hitam)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Obx(
                                          () => homeController
                                                      .imageFotoKtpAnggota2
                                                      .value ==
                                                  null
                                              ? Image.asset(
                                                  'assets/no-image.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  homeController
                                                      .imageFotoKtpAnggota2
                                                      .value!,
                                                  fit: BoxFit.cover,
                                                ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          homeController
                                              .getImageFromGalleryKtpAnggota2();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            'Pilih Foto',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => homeController
                                                    .imageFotoKtpAnggota2
                                                    .value ==
                                                null
                                            ? SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  'Tidak ada foto yang dipilih',
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  homeController
                                                      .imageFotoKtpAnggota2
                                                      .value!
                                                      .path
                                                      .split('/')
                                                      .last,
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller:
                                    homeController.noHpAnggota1TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Nomor Hp',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller: homeController
                                    .instagramAnggota1TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Instagram',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Ukuran Baju',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.1.w,
                                      color: hitam,
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Obx(
                                    () {
                                      return DropdownSearch<String>(
                                        popupProps: PopupProps.modalBottomSheet(
                                          constraints:
                                              BoxConstraints(maxHeight: 35.h),
                                          showSelectedItems: true,
                                        ),
                                        items: homeController
                                            .ukuranBaju
                                            // ignore: invalid_use_of_protected_member
                                            .value,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            fillColor: hitam,
                                            labelStyle: TextStyle(
                                              color: hitam,
                                            ),
                                          ),
                                          baseStyle: GoogleFonts.poppins(
                                              color: hitam,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (value) {
                                          homeController
                                              .selectedUkuranBajuAnggota2
                                              .value = value!;
                                        },
                                        selectedItem: "",
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Pendidikan Terakhir',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.1.w,
                                      color: hitam,
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Obx(
                                    () {
                                      return DropdownSearch<String>(
                                        popupProps: PopupProps.modalBottomSheet(
                                          constraints:
                                              BoxConstraints(maxHeight: 42.h),
                                          showSelectedItems: true,
                                        ),
                                        items: homeController
                                            .pendidikanTerakhir
                                            // ignore: invalid_use_of_protected_member
                                            .value,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            fillColor: hitam,
                                            labelStyle: TextStyle(
                                              color: hitam,
                                            ),
                                          ),
                                          baseStyle: GoogleFonts.poppins(
                                              color: hitam,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (value) {
                                          homeController
                                              .selectedPendidikanTerakhirAnggota2
                                              .value = value!;
                                        },
                                        selectedItem: "",
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(
                                    () => homeController.informasiAnggota.value
                                                .teamAnggotaTotal! >=
                                            2
                                        ? Container()
                                        : ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: birulangit,
                                            ),
                                            onPressed: () {
                                              if (homeController.namaAnggota1TeamController.text.isEmpty ||
                                                  homeController
                                                      .noHpAnggota1TeamController
                                                      .text
                                                      .isEmpty ||
                                                  homeController
                                                      .instagramAnggota1TeamController
                                                      .text
                                                      .isEmpty ||
                                                  homeController
                                                      .selectedUkuranBajuAnggota2
                                                      .value
                                                      .isEmpty ||
                                                  homeController
                                                      .selectedPendidikanTerakhirAnggota2
                                                      .value
                                                      .isEmpty) {
                                                Get.snackbar(
                                                  'Failed',
                                                  'Data Tidak Boleh Kosong',
                                                  colorText: Colors.white,
                                                  backgroundColor:
                                                      Colors.red[300],
                                                  icon: const Icon(
                                                      Icons.warning,
                                                      color: Colors.white),
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                );
                                              } else if (homeController
                                                      .page.value >=
                                                  0) {
                                                homeController.page.value++;
                                                homeController.indicator
                                                    .animateToPage(
                                                  homeController.page.value,
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Tambah',
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: putih,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () async {
                                      if (homeController.namaAnggota1TeamController.text.isEmpty &&
                                          homeController
                                              .noHpAnggota1TeamController
                                              .text
                                              .isEmpty &&
                                          homeController
                                              .instagramAnggota1TeamController
                                              .text
                                              .isEmpty &&
                                          homeController
                                              .selectedUkuranBajuAnggota2
                                              .value
                                              .isEmpty &&
                                          homeController
                                              .selectedPendidikanTerakhirAnggota2
                                              .value
                                              .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Data Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .namaAnggota1TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Nama Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .noHpAnggota1TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Nomor Hp Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .instagramAnggota1TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Instagram Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .selectedUkuranBajuAnggota2
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Ukuran Baju Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .selectedPendidikanTerakhirAnggota2
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Pendidikan Terakhir Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else {
                                        final fotoAnggota1File = homeController
                                            .getImageFileFromAsset(
                                                'assets/no-image.jpg',
                                                'no-image.jpg');
                                        final fotoKtpAnggota1File =
                                            homeController
                                                .getImageFileFromAsset(
                                                    'assets/no-image.jpg',
                                                    'no-image.jpg');

                                        homeController.registerInformasiAnggota(
                                          teamId: teamId,
                                          namaAnggota: [
                                            homeController
                                                .namaAnggotaTeamController.text,
                                            homeController
                                                .namaAnggota1TeamController
                                                .text,
                                          ],
                                          nohpAnggota: [
                                            homeController
                                                .noHpAnggotaTeamController.text,
                                            homeController
                                                .noHpAnggota1TeamController
                                                .text,
                                          ],
                                          instagramAnggota: [
                                            homeController
                                                .instagramAnggotaTeamController
                                                .text,
                                            homeController
                                                .instagramAnggota1TeamController
                                                .text,
                                          ],
                                          ukuranBajuAnggota: [
                                            homeController
                                                .selectedUkuranBajuAnggota1
                                                .value,
                                            homeController
                                                .selectedUkuranBajuAnggota2
                                                .value,
                                          ],
                                          pendidikanTerakhirAnggota: [
                                            homeController
                                                .selectedPendidikanTerakhirAnggota1
                                                .value,
                                            homeController
                                                .selectedPendidikanTerakhirAnggota2
                                                .value,
                                          ],
                                          fotoAnggota: [
                                            homeController
                                                        .imageAnggota1.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota1.value!,
                                            homeController
                                                        .imageAnggota2.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota2.value!,
                                          ],
                                          fotoIdAnggota: [
                                            homeController.imageFotoKtpAnggota1
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota1
                                                    .value!,
                                            homeController.imageFotoKtpAnggota2
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota2
                                                    .value!,
                                          ],
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Text(
                                        'Simpan',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: putih,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: birulangit,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(
                                30,
                              ),
                              bottomRight: Radius.circular(
                                30,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.offAll(UsahaView());
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: putih,
                                    ),
                                  ),
                                  Text(
                                    'Team',
                                    style: GoogleFonts.poppins(
                                      color: putih,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: putih,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 15.w,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                            color: pembeda,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              namaTeam,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              status,
                                              style: GoogleFonts.poppins(),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller:
                                    homeController.namaAnggota2TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Nama',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Foto',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: hitam,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: '757575'.toColor(),
                                        border: Border.all(
                                            width: 0.1.w, color: hitam)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Obx(
                                          () => homeController
                                                      .imageAnggota3.value ==
                                                  null
                                              ? Image.asset(
                                                  'assets/no-image.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  homeController
                                                      .imageAnggota3.value!,
                                                  fit: BoxFit.cover,
                                                ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          homeController
                                              .getImageFromGalleryAnggota3();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            'Pilih Foto',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => homeController
                                                    .imageAnggota3.value ==
                                                null
                                            ? SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  'Tidak ada foto yang dipilih',
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  homeController
                                                      .imageAnggota3.value!.path
                                                      .split('/')
                                                      .last,
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Foto KTP/SIM/Pasport',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: hitam,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: '757575'.toColor(),
                                        border: Border.all(
                                            width: 0.1.w, color: hitam)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Obx(
                                          () => homeController
                                                      .imageFotoKtpAnggota3
                                                      .value ==
                                                  null
                                              ? Image.asset(
                                                  'assets/no-image.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  homeController
                                                      .imageFotoKtpAnggota3
                                                      .value!,
                                                  fit: BoxFit.cover,
                                                ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          homeController
                                              .getImageFromGalleryKtpAnggota3();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            'Pilih Foto',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => homeController
                                                    .imageFotoKtpAnggota3
                                                    .value ==
                                                null
                                            ? SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  'Tidak ada foto yang dipilih',
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  homeController
                                                      .imageFotoKtpAnggota3
                                                      .value!
                                                      .path
                                                      .split('/')
                                                      .last,
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller:
                                    homeController.noHpAnggota2TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Nomor Hp',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller: homeController
                                    .instagramAnggota2TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Instagram',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Ukuran Baju',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.1.w,
                                      color: hitam,
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Obx(
                                    () {
                                      return DropdownSearch<String>(
                                        popupProps: PopupProps.modalBottomSheet(
                                          constraints:
                                              BoxConstraints(maxHeight: 35.h),
                                          showSelectedItems: true,
                                        ),
                                        items: homeController
                                            .ukuranBaju
                                            // ignore: invalid_use_of_protected_member
                                            .value,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            fillColor: hitam,
                                            labelStyle: TextStyle(
                                              color: hitam,
                                            ),
                                          ),
                                          baseStyle: GoogleFonts.poppins(
                                              color: hitam,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (value) {
                                          homeController
                                              .selectedUkuranBajuAnggota3
                                              .value = value!;
                                        },
                                        selectedItem: "",
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Pendidikan Terakhir',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.1.w,
                                      color: hitam,
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Obx(
                                    () {
                                      return DropdownSearch<String>(
                                        popupProps: PopupProps.modalBottomSheet(
                                          constraints:
                                              BoxConstraints(maxHeight: 42.h),
                                          showSelectedItems: true,
                                        ),
                                        items: homeController
                                            .pendidikanTerakhir
                                            // ignore: invalid_use_of_protected_member
                                            .value,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            fillColor: hitam,
                                            labelStyle: TextStyle(
                                              color: hitam,
                                            ),
                                          ),
                                          baseStyle: GoogleFonts.poppins(
                                              color: hitam,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (value) {
                                          homeController
                                              .selectedPendidikanTerakhirAnggota3
                                              .value = value!;
                                        },
                                        selectedItem: "",
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(
                                    () => homeController.informasiAnggota.value
                                                .teamAnggotaTotal! >=
                                            1
                                        ? Container()
                                        : ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: birulangit,
                                            ),
                                            onPressed: () {
                                              if (homeController.namaAnggota2TeamController.text.isEmpty ||
                                                  homeController
                                                      .noHpAnggota2TeamController
                                                      .text
                                                      .isEmpty ||
                                                  homeController
                                                      .instagramAnggota2TeamController
                                                      .text
                                                      .isEmpty ||
                                                  homeController
                                                      .selectedUkuranBajuAnggota3
                                                      .value
                                                      .isEmpty ||
                                                  homeController
                                                      .selectedPendidikanTerakhirAnggota3
                                                      .value
                                                      .isEmpty) {
                                                Get.snackbar(
                                                  'Failed',
                                                  'Data Tidak Boleh Kosong',
                                                  colorText: Colors.white,
                                                  backgroundColor:
                                                      Colors.red[300],
                                                  icon: const Icon(
                                                      Icons.warning,
                                                      color: Colors.white),
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                );
                                              } else if (homeController
                                                      .page.value >=
                                                  0) {
                                                homeController.page.value++;
                                                homeController.indicator
                                                    .animateToPage(
                                                  homeController.page.value,
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Tambah',
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: putih,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () async {
                                      if (homeController.namaAnggota2TeamController.text.isEmpty &&
                                          homeController
                                              .noHpAnggota2TeamController
                                              .text
                                              .isEmpty &&
                                          homeController
                                              .instagramAnggota2TeamController
                                              .text
                                              .isEmpty &&
                                          homeController
                                              .selectedUkuranBajuAnggota3
                                              .value
                                              .isEmpty &&
                                          homeController
                                              .selectedPendidikanTerakhirAnggota3
                                              .value
                                              .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Data Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .namaAnggota2TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Nama Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .noHpAnggota2TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Nomor Hp Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .instagramAnggota2TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Instagram Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .selectedUkuranBajuAnggota3
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Ukuran Baju Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .selectedPendidikanTerakhirAnggota3
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Pendidikan Terakhir Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else {
                                        final fotoAnggota1File = homeController
                                            .getImageFileFromAsset(
                                                'assets/no-image.jpg',
                                                'no-image.jpg');
                                        final fotoKtpAnggota1File =
                                            homeController
                                                .getImageFileFromAsset(
                                                    'assets/no-image.jpg',
                                                    'no-image.jpg');

                                        homeController.registerInformasiAnggota(
                                          teamId: teamId,
                                          namaAnggota: [
                                            homeController
                                                .namaAnggotaTeamController.text,
                                            homeController
                                                .namaAnggota1TeamController
                                                .text,
                                            homeController
                                                .namaAnggota2TeamController
                                                .text,
                                          ],
                                          nohpAnggota: [
                                            homeController
                                                .noHpAnggotaTeamController.text,
                                            homeController
                                                .noHpAnggota1TeamController
                                                .text,
                                            homeController
                                                .noHpAnggota2TeamController
                                                .text,
                                          ],
                                          instagramAnggota: [
                                            homeController
                                                .instagramAnggotaTeamController
                                                .text,
                                            homeController
                                                .instagramAnggota1TeamController
                                                .text,
                                            homeController
                                                .instagramAnggota2TeamController
                                                .text,
                                          ],
                                          ukuranBajuAnggota: [
                                            homeController
                                                .selectedUkuranBajuAnggota1
                                                .value,
                                            homeController
                                                .selectedUkuranBajuAnggota2
                                                .value,
                                            homeController
                                                .selectedUkuranBajuAnggota3
                                                .value,
                                          ],
                                          pendidikanTerakhirAnggota: [
                                            homeController
                                                .selectedPendidikanTerakhirAnggota1
                                                .value,
                                            homeController
                                                .selectedPendidikanTerakhirAnggota2
                                                .value,
                                            homeController
                                                .selectedPendidikanTerakhirAnggota3
                                                .value,
                                          ],
                                          fotoAnggota: [
                                            homeController
                                                        .imageAnggota1.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota1.value!,
                                            homeController
                                                        .imageAnggota2.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota2.value!,
                                            homeController
                                                        .imageAnggota3.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota3.value!,
                                          ],
                                          fotoIdAnggota: [
                                            homeController.imageFotoKtpAnggota1
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota1
                                                    .value!,
                                            homeController.imageFotoKtpAnggota2
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota2
                                                    .value!,
                                            homeController.imageFotoKtpAnggota3
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota3
                                                    .value!,
                                          ],
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Text(
                                        'Simpan',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: putih,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //4
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: birulangit,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(
                                30,
                              ),
                              bottomRight: Radius.circular(
                                30,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.offAll(UsahaView());
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: putih,
                                    ),
                                  ),
                                  Text(
                                    'Team',
                                    style: GoogleFonts.poppins(
                                      color: putih,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: putih,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 15.w,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                            color: pembeda,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              namaTeam,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              status,
                                              style: GoogleFonts.poppins(),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller:
                                    homeController.namaAnggota3TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Nama',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Foto',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: hitam,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: '757575'.toColor(),
                                        border: Border.all(
                                            width: 0.1.w, color: hitam)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Obx(
                                          () => homeController
                                                      .imageAnggota4.value ==
                                                  null
                                              ? Image.asset(
                                                  'assets/no-image.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  homeController
                                                      .imageAnggota4.value!,
                                                  fit: BoxFit.cover,
                                                ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          homeController
                                              .getImageFromGalleryAnggota4();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            'Pilih Foto',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => homeController
                                                    .imageAnggota4.value ==
                                                null
                                            ? SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  'Tidak ada foto yang dipilih',
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  homeController
                                                      .imageAnggota4.value!.path
                                                      .split('/')
                                                      .last,
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Foto KTP/SIM/Pasport',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: hitam,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25.w,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: '757575'.toColor(),
                                        border: Border.all(
                                            width: 0.1.w, color: hitam)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Obx(
                                          () => homeController
                                                      .imageFotoKtpAnggota4
                                                      .value ==
                                                  null
                                              ? Image.asset(
                                                  'assets/no-image.jpg',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  homeController
                                                      .imageFotoKtpAnggota4
                                                      .value!,
                                                  fit: BoxFit.cover,
                                                ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: birulangit),
                                        onPressed: () {
                                          homeController
                                              .getImageFromGalleryKtpAnggota4();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            'Pilih Foto',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => homeController
                                                    .imageFotoKtpAnggota4
                                                    .value ==
                                                null
                                            ? SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  'Tidak ada foto yang dipilih',
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              )
                                            : SizedBox(
                                                width: 50.w,
                                                child: Text(
                                                  homeController
                                                      .imageFotoKtpAnggota4
                                                      .value!
                                                      .path
                                                      .split('/')
                                                      .last,
                                                  style: GoogleFonts.poppins(
                                                      color: hitam),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller:
                                    homeController.noHpAnggota3TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Nomor Hp',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller: homeController
                                    .instagramAnggota3TeamController,
                                keyboardType: TextInputType.name,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp, color: hitam),
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.poppins(color: hitam),
                                  labelText: 'Instagram',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: hitam,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Ukuran Baju',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.1.w,
                                      color: hitam,
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Obx(
                                    () {
                                      return DropdownSearch<String>(
                                        popupProps: PopupProps.modalBottomSheet(
                                          constraints:
                                              BoxConstraints(maxHeight: 35.h),
                                          showSelectedItems: true,
                                        ),
                                        items: homeController
                                            .ukuranBaju
                                            // ignore: invalid_use_of_protected_member
                                            .value,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            fillColor: hitam,
                                            labelStyle: TextStyle(
                                              color: hitam,
                                            ),
                                          ),
                                          baseStyle: GoogleFonts.poppins(
                                              color: hitam,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (value) {
                                          homeController
                                              .selectedUkuranBajuAnggota4
                                              .value = value!;
                                        },
                                        selectedItem: "",
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Pendidikan Terakhir',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 0.1.w,
                                      color: hitam,
                                    )),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Obx(
                                    () {
                                      return DropdownSearch<String>(
                                        popupProps: PopupProps.modalBottomSheet(
                                          constraints:
                                              BoxConstraints(maxHeight: 42.h),
                                          showSelectedItems: true,
                                        ),
                                        items: homeController
                                            .pendidikanTerakhir
                                            // ignore: invalid_use_of_protected_member
                                            .value,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            fillColor: hitam,
                                            labelStyle: TextStyle(
                                              color: hitam,
                                            ),
                                          ),
                                          baseStyle: GoogleFonts.poppins(
                                              color: hitam,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (value) {
                                          homeController
                                              .selectedPendidikanTerakhirAnggota4
                                              .value = value!;
                                        },
                                        selectedItem: "",
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () async {
                                      if (homeController.namaAnggota3TeamController.text.isEmpty &&
                                          homeController
                                              .noHpAnggota3TeamController
                                              .text
                                              .isEmpty &&
                                          homeController
                                              .instagramAnggota3TeamController
                                              .text
                                              .isEmpty &&
                                          homeController
                                              .selectedUkuranBajuAnggota4
                                              .value
                                              .isEmpty &&
                                          homeController
                                              .selectedPendidikanTerakhirAnggota4
                                              .value
                                              .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Data Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .namaAnggota3TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Nama Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .noHpAnggota3TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Nomor Hp Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .instagramAnggota3TeamController
                                          .text
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Instagram Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .selectedUkuranBajuAnggota4
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Ukuran Baju Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else if (homeController
                                          .selectedPendidikanTerakhirAnggota4
                                          .value
                                          .isEmpty) {
                                        Get.snackbar(
                                          'Failed',
                                          'Pendidikan Terakhir Anggota Tidak Boleh Kosong',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        );
                                      } else {
                                        final fotoAnggota1File = homeController
                                            .getImageFileFromAsset(
                                                'assets/no-image.jpg',
                                                'no-image.jpg');
                                        final fotoKtpAnggota1File =
                                            homeController
                                                .getImageFileFromAsset(
                                                    'assets/no-image.jpg',
                                                    'no-image.jpg');

                                        homeController.registerInformasiAnggota(
                                          teamId: teamId,
                                          namaAnggota: [
                                            homeController
                                                .namaAnggotaTeamController.text,
                                            homeController
                                                .namaAnggota1TeamController
                                                .text,
                                            homeController
                                                .namaAnggota2TeamController
                                                .text,
                                            homeController
                                                .namaAnggota3TeamController
                                                .text,
                                          ],
                                          nohpAnggota: [
                                            homeController
                                                .noHpAnggotaTeamController.text,
                                            homeController
                                                .noHpAnggota1TeamController
                                                .text,
                                            homeController
                                                .noHpAnggota2TeamController
                                                .text,
                                            homeController
                                                .noHpAnggota3TeamController
                                                .text,
                                          ],
                                          instagramAnggota: [
                                            homeController
                                                .instagramAnggotaTeamController
                                                .text,
                                            homeController
                                                .instagramAnggota1TeamController
                                                .text,
                                            homeController
                                                .instagramAnggota2TeamController
                                                .text,
                                            homeController
                                                .instagramAnggota3TeamController
                                                .text,
                                          ],
                                          ukuranBajuAnggota: [
                                            homeController
                                                .selectedUkuranBajuAnggota1
                                                .value,
                                            homeController
                                                .selectedUkuranBajuAnggota2
                                                .value,
                                            homeController
                                                .selectedUkuranBajuAnggota3
                                                .value,
                                            homeController
                                                .selectedUkuranBajuAnggota4
                                                .value,
                                          ],
                                          pendidikanTerakhirAnggota: [
                                            homeController
                                                .selectedPendidikanTerakhirAnggota1
                                                .value,
                                            homeController
                                                .selectedPendidikanTerakhirAnggota2
                                                .value,
                                            homeController
                                                .selectedPendidikanTerakhirAnggota3
                                                .value,
                                            homeController
                                                .selectedPendidikanTerakhirAnggota4
                                                .value,
                                          ],
                                          fotoAnggota: [
                                            homeController
                                                        .imageAnggota1.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota1.value!,
                                            homeController
                                                        .imageAnggota2.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota2.value!,
                                            homeController
                                                        .imageAnggota3.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota3.value!,
                                            homeController
                                                        .imageAnggota4.value ==
                                                    null
                                                ? await fotoAnggota1File
                                                : homeController
                                                    .imageAnggota4.value!,
                                          ],
                                          fotoIdAnggota: [
                                            homeController.imageFotoKtpAnggota1
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota1
                                                    .value!,
                                            homeController.imageFotoKtpAnggota2
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota2
                                                    .value!,
                                            homeController.imageFotoKtpAnggota3
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota3
                                                    .value!,
                                            homeController.imageFotoKtpAnggota4
                                                        .value ==
                                                    null
                                                ? await fotoKtpAnggota1File
                                                : homeController
                                                    .imageFotoKtpAnggota4
                                                    .value!,
                                          ],
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Text(
                                        'Simpan',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: putih,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
