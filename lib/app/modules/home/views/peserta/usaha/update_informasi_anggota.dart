import 'package:dropdown_search/dropdown_search.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

class UpdateInformasiAnggota extends StatefulWidget {
  final String teamId;
  final String id;
  final String namaAnggota;
  final String namaTeam;
  final String noHpAnggota;
  final String instagramAnggota;
  final String ukuranBajuAnggota;
  final String pendidikanAnggota;
  final String? fotoAnggota;
  final String? fotoIdAnggota;
  const UpdateInformasiAnggota(
      {super.key,
      required this.id,
      required this.namaAnggota,
      required this.noHpAnggota,
      required this.instagramAnggota,
      required this.ukuranBajuAnggota,
      required this.pendidikanAnggota,
      this.fotoAnggota,
      this.fotoIdAnggota,
      required this.namaTeam,
      required this.teamId});

  @override
  State<UpdateInformasiAnggota> createState() => _UpdateInformasiAnggotaState();
}

class _UpdateInformasiAnggotaState extends State<UpdateInformasiAnggota> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.namaAnggotaTeamController.text = widget.namaAnggota;
    homeController.noHpAnggotaTeamController.text = widget.noHpAnggota;
    homeController.instagramAnggotaTeamController.text =
        widget.instagramAnggota;
    homeController.selectedUkuranBajuAnggota1.value = widget.ukuranBajuAnggota;
    homeController.selectedPendidikanTerakhirAnggota1.value =
        widget.pendidikanAnggota;
    super.initState();
  }

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
                                  widget.namaTeam,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '',
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
                    controller: homeController.namaAnggotaTeamController,
                    keyboardType: TextInputType.name,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
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
                            border: Border.all(width: 0.1.w, color: hitam)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                              () => homeController.imageAnggota1.value == null
                                  ? Image.network(
                                      widget.fotoAnggota!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      homeController.imageAnggota1.value!,
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
                              homeController.getImageFromGalleryAnggota1();
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
                            () => homeController.imageAnggota1.value == null
                                ? SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      'Tidak ada foto yang dipilih',
                                      style: GoogleFonts.poppins(color: hitam),
                                    ),
                                  )
                                : SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      homeController.imageAnggota1.value!.path
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
                            border: Border.all(width: 0.1.w, color: hitam)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                              () => homeController.imageFotoKtpAnggota1.value ==
                                      null
                                  ? Image.network(
                                      widget.fotoIdAnggota!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      homeController
                                          .imageFotoKtpAnggota1.value!,
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
                              homeController.getImageFromGalleryKtpAnggota1();
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
                            () => homeController.imageFotoKtpAnggota1.value ==
                                    null
                                ? SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      'Tidak ada foto yang dipilih',
                                      style: GoogleFonts.poppins(color: hitam),
                                    ),
                                  )
                                : SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      homeController
                                          .imageFotoKtpAnggota1.value!.path
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
                  TextFormField(
                    controller: homeController.noHpAnggotaTeamController,
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
                  TextFormField(
                    controller: homeController.instagramAnggotaTeamController,
                    keyboardType: TextInputType.name,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
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
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Obx(
                        () {
                          return DropdownSearch<String>(
                            popupProps: PopupProps.modalBottomSheet(
                              constraints: BoxConstraints(maxHeight: 35.h),
                              showSelectedItems: true,
                            ),
                            items: homeController
                                .ukuranBaju
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
                              homeController.selectedUkuranBajuAnggota1.value =
                                  value!;
                            },
                            selectedItem:
                                homeController.selectedUkuranBajuAnggota1.value,
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
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Obx(
                        () {
                          return DropdownSearch<String>(
                            popupProps: PopupProps.modalBottomSheet(
                              constraints: BoxConstraints(maxHeight: 42.h),
                              showSelectedItems: true,
                            ),
                            items: homeController
                                .pendidikanTerakhir
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
                              homeController.selectedPendidikanTerakhirAnggota1
                                  .value = value!;
                            },
                            selectedItem: homeController
                                .selectedPendidikanTerakhirAnggota1.value,
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
                        onPressed: () {
                          if (homeController.namaAnggotaTeamController.text.isEmpty &&
                              homeController
                                  .noHpAnggotaTeamController.text.isEmpty &&
                              homeController.instagramAnggotaTeamController.text
                                  .isEmpty &&
                              homeController
                                  .selectedUkuranBajuAnggota1.value.isEmpty &&
                              homeController.selectedPendidikanTerakhirAnggota1
                                  .value.isEmpty &&
                              homeController.imageAnggota1.value == null &&
                              homeController.imageFotoKtpAnggota1.value ==
                                  null) {
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
                              .namaAnggotaTeamController.text.isEmpty) {
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
                              .noHpAnggotaTeamController.text.isEmpty) {
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
                              .instagramAnggotaTeamController.text.isEmpty) {
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
                              .selectedUkuranBajuAnggota1.value.isEmpty) {
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
                            homeController.updateInformasiAnggota(
                                teamId: widget.teamId,
                                namaAnggota: homeController
                                    .namaAnggotaTeamController.text,
                                nohpAnggota: homeController
                                    .noHpAnggotaTeamController.text,
                                instagramAnggota: homeController
                                    .instagramAnggotaTeamController.text,
                                teamAnggotaId: widget.id);
                          }
                          print(widget.id);
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
            ),
          ],
        ),
      )),
    );
  }
}
