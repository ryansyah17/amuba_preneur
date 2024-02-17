import 'package:dropdown_search/dropdown_search.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

class VerifikasiInvestor extends StatelessWidget {
  VerifikasiInvestor({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: hitam,
              size: 30,
            )),
        backgroundColor: putih,
        elevation: 1,
        title: SizedBox(
          width: 40.w,
          child: Image.asset(
            'assets/logo_appbar.png',
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: hitam,
                    size: 35,
                  ),
                ),
                Positioned(
                  top: 0.8.h,
                  right: 0.w,
                  child: Container(
                    height: 2.h,
                    width: 5.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        '12',
                        style: GoogleFonts.poppins(fontSize: 8.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: homeController.namaPemodalController,
                keyboardType: TextInputType.name,
                autofocus: false,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(color: hitam),
                  labelText: 'Nama Lengkap',
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
                        border: Border.all(width: 0.1.w, color: hitam)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Obx(
                          () => homeController.imagePemodal.value == null
                              ? Image.asset(
                                  'assets/no-image.jpg',
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  homeController.imagePemodal.value!,
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
                          homeController.getImageFromGalleryToPemodalFoto();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            'Pilih Foto',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Obx(
                        () => homeController.imagePemodal.value == null
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
                                  homeController.imagePemodal.value!.path
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
                'Foto ID',
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
                          () => homeController.imagePemodalId.value == null
                              ? Image.asset(
                                  'assets/no-image.jpg',
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  homeController.imagePemodalId.value!,
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
                          homeController.getImageFromGalleryToPemodalFotoId();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            'Pilih Foto',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Obx(
                        () => homeController.imagePemodalId.value == null
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
                                  homeController.imagePemodalId.value!.path
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
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Obx(
                    () {
                      return DropdownSearch<String>(
                        popupProps: PopupProps.modalBottomSheet(
                          constraints: BoxConstraints(maxHeight: 35.h),
                          showSelectedItems: true,
                        ),
                        items: homeController
                            .pekerjaanPemodal
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
                          homeController.selectedPekerjaan.value = value!;
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
                controller: homeController.alamatPemodalController,
                keyboardType: TextInputType.name,
                autofocus: false,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(color: hitam),
                  labelText: 'Alamat',
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
                controller: homeController.emailPemodalController,
                keyboardType: TextInputType.name,
                autofocus: false,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(color: hitam),
                  labelText: 'Email',
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
                controller: homeController.noHpPemodalController,
                keyboardType: TextInputType.name,
                autofocus: false,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(color: hitam),
                  labelText: 'No HP',
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
                      if (homeController.namaPemodalController.text.isEmpty &&
                          homeController.alamatPemodalController.text.isEmpty &&
                          homeController.emailPemodalController.text.isEmpty &&
                          homeController.noHpPemodalController.text.isEmpty &&
                          homeController.imagePemodal.value == null &&
                          homeController.imagePemodalId.value == null &&
                          homeController.selectedPekerjaan.value.isEmpty) {
                        Get.snackbar(
                          'Failed',
                          'Data tidak boleh kosong',
                          colorText: Colors.white,
                          backgroundColor: Colors.red[300],
                          icon: const Icon(Icons.warning, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (homeController
                          .namaPemodalController.text.isEmpty) {
                        Get.snackbar(
                          'Failed',
                          'Nama tidak boleh kosong',
                          colorText: Colors.white,
                          backgroundColor: Colors.red[300],
                          icon: const Icon(Icons.warning, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (homeController.imagePemodal.value == null) {
                        Get.snackbar(
                          'Failed',
                          'Foto tidak boleh kosong',
                          colorText: Colors.white,
                          backgroundColor: Colors.red[300],
                          icon: const Icon(Icons.warning, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (homeController.imagePemodalId.value == null) {
                        Get.snackbar(
                          'Failed',
                          'Foto ID tidak boleh kosong',
                          colorText: Colors.white,
                          backgroundColor: Colors.red[300],
                          icon: const Icon(Icons.warning, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (homeController
                          .selectedPekerjaan.value.isEmpty) {
                        Get.snackbar(
                          'Failed',
                          'Pekerjaan tidak boleh kosong',
                          colorText: Colors.white,
                          backgroundColor: Colors.red[300],
                          icon: const Icon(Icons.warning, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (homeController
                          .alamatPemodalController.text.isEmpty) {
                        Get.snackbar(
                          'Failed',
                          'Alamat tidak boleh kosong',
                          colorText: Colors.white,
                          backgroundColor: Colors.red[300],
                          icon: const Icon(Icons.warning, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (homeController
                          .emailPemodalController.text.isEmpty) {
                        Get.snackbar(
                          'Failed',
                          'Email tidak boleh kosong',
                          colorText: Colors.white,
                          backgroundColor: Colors.red[300],
                          icon: const Icon(Icons.warning, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (homeController
                          .noHpPemodalController.text.isEmpty) {
                        Get.snackbar(
                          'Failed',
                          'Nomor Handphone tidak boleh kosong',
                          colorText: Colors.white,
                          backgroundColor: Colors.red[300],
                          icon: const Icon(Icons.warning, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      } else {
                        homeController.registerPemodal(
                            nama: homeController.namaPemodalController.text,
                            alamat: homeController.alamatPemodalController.text,
                            email: homeController.emailPemodalController.text,
                            noHp: homeController.noHpPemodalController.text);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        'Simpan',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
