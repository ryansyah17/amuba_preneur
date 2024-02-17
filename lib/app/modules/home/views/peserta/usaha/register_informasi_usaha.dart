import 'package:dropdown_search/dropdown_search.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

class RegisterInformasiUsaha extends StatelessWidget {
  RegisterInformasiUsaha({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          Get.back();
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
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Nama Team',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'status',
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
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: homeController.namaTeamController,
                    keyboardType: TextInputType.name,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.poppins(color: hitam),
                      labelText: 'Nama Team',
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
                    'Logo Team (Optional)',
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
                            border: Border.all(width: 0.1.w, color: hitam)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                              () => homeController.image.value == null
                                  ? Image.asset(
                                      'assets/no-image.jpg',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      homeController.image.value!,
                                      fit: BoxFit.cover,
                                    ),
                            )),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: birulangit),
                            onPressed: () {
                              homeController.getImageFromGallery();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                            () => homeController.image.value == null
                                ? SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      'Tidak ada foto yang dipilih (Optional)',
                                      style: GoogleFonts.poppins(color: hitam),
                                    ),
                                  )
                                : SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      homeController.image.value!.path
                                          .split('/')
                                          .last,
                                      style: GoogleFonts.poppins(color: hitam),
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
                    'Jenis Usaha',
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
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Obx(
                        () {
                          return DropdownSearch<String>(
                            popupProps: PopupProps.modalBottomSheet(
                              constraints: BoxConstraints(maxHeight: 14.h),
                              showSelectedItems: true,
                            ),
                            items: homeController
                                .jenisUsaha
                                // ignore: invalid_use_of_protected_member
                                .value,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                fillColor: hitam,
                                labelStyle: TextStyle(
                                  color: hitam,
                                ),
                              ),
                              baseStyle: GoogleFonts.poppins(
                                  color: hitam, fontWeight: FontWeight.w500),
                            ),
                            onChanged: (value) {
                              homeController.selectedJenisUsaha.value = value!;
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
                    'Sektor Usaha',
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
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Obx(
                        () {
                          return DropdownSearch<String>(
                            popupProps: PopupProps.modalBottomSheet(
                              constraints: BoxConstraints(maxHeight: 48.h),
                              showSelectedItems: true,
                            ),
                            items: homeController
                                .sektorUsaha
                                // ignore: invalid_use_of_protected_member
                                .value,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                fillColor: hitam,
                                labelStyle: TextStyle(
                                  color: hitam,
                                ),
                              ),
                              baseStyle: GoogleFonts.poppins(
                                  color: hitam, fontWeight: FontWeight.w500),
                            ),
                            onChanged: (value) {
                              homeController.selectedSektorUsaha.value = value!;
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
                  TextFormField(
                    controller: homeController.deskripsiTeamController,
                    keyboardType: TextInputType.name,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.poppins(color: hitam),
                      labelText: 'Deskripsi Singkat',
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
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: homeController.emailBisnisTeamController,
                    keyboardType: TextInputType.name,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.poppins(color: hitam),
                      labelText: 'Email Bisnis',
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
                    controller: homeController.nomorHpBisnisTeamController,
                    keyboardType: TextInputType.name,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: birulangit,
                        ),
                        onPressed: () {
                          var namaTeam = homeController.namaTeamController.text;
                          var jenisUsahaTeam =
                              homeController.selectedJenisUsaha.value;
                          var sektorUsahaTeam =
                              homeController.selectedSektorUsaha.value;
                          var deskripsiTeam =
                              homeController.deskripsiTeamController.text;
                          var emailBisnisTeam =
                              homeController.emailBisnisTeamController.text;
                          var nomorHpBisnisTeam =
                              homeController.nomorHpBisnisTeamController.text;
                          if (namaTeam.isEmpty &&
                              jenisUsahaTeam.isEmpty &&
                              sektorUsahaTeam.isEmpty &&
                              deskripsiTeam.isEmpty &&
                              emailBisnisTeam.isEmpty &&
                              nomorHpBisnisTeam.isEmpty) {
                            Get.snackbar(
                              'Failed',
                              'Data Tidak Boleh Kosong',
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (namaTeam.isEmpty) {
                            Get.snackbar(
                              'Failed',
                              'Nama Team Tidak Boleh Kosong',
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (jenisUsahaTeam.isEmpty) {
                            Get.snackbar(
                              'Failed',
                              'Jenis Usaha Tidak Boleh Kosong',
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (sektorUsahaTeam.isEmpty) {
                            Get.snackbar(
                              'Failed',
                              'Sektor Usaha Tidak Boleh Kosong',
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (deskripsiTeam.isEmpty) {
                            Get.snackbar(
                              'Failed',
                              'Deskripsi Tidak Boleh Kosong',
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (emailBisnisTeam.isEmpty) {
                            Get.snackbar(
                              'Failed',
                              'Email Tidak Boleh Kosong',
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else if (nomorHpBisnisTeam.isEmpty) {
                            Get.snackbar(
                              'Failed',
                              'Nomor Hp Tidak Boleh Kosong',
                              colorText: Colors.white,
                              backgroundColor: Colors.red[300],
                              icon: const Icon(Icons.warning,
                                  color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else {
                            homeController.registerInformasiUsaha(
                                namaTeam: namaTeam,
                                deskripsi: deskripsiTeam,
                                emailBisnis: emailBisnisTeam,
                                noHpBisnis: nomorHpBisnisTeam);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
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
            )
          ],
        ),
      )),
    );
  }
}
