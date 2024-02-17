import 'package:dropdown_search/dropdown_search.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UpdatePlanningBisnis extends StatefulWidget {
  final String idTeam;
  final String id;
  final String namaUsaha;
  final String targetModal;
  final String minimalInvestasi;
  final String sumberProduk;
  final String targetPembeli;
  final String lokasiOperasional;
  const UpdatePlanningBisnis(
      {super.key,
      required this.id,
      required this.namaUsaha,
      required this.targetModal,
      required this.sumberProduk,
      required this.targetPembeli,
      required this.lokasiOperasional,
      required this.idTeam,
      required this.minimalInvestasi});

  @override
  State<UpdatePlanningBisnis> createState() => _UpdatePlanningBisnisState();
}

class _UpdatePlanningBisnisState extends State<UpdatePlanningBisnis> {
  @override
  void initState() {
    homeController.targerModalTeamController.text = widget.targetModal;
    homeController.selectedSumberProduk.value = widget.sumberProduk;
    homeController.minimalInvestasiTeamController.text =
        widget.minimalInvestasi;
    homeController.selectedTargetPembeli.value = widget.targetPembeli;
    homeController.selectedLokasiOperasional.value = widget.lokasiOperasional;
    super.initState();
  }

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
                                    widget.namaUsaha,
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
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: homeController.targerModalTeamController,
                      keyboardType: TextInputType.name,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.poppins(color: hitam),
                        labelText: 'Target Modal',
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
                      controller: homeController.minimalInvestasiTeamController,
                      keyboardType: TextInputType.name,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.poppins(color: hitam),
                        labelText: 'Minimal Investasi',
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
                      'Sumber Produk',
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
                                  .sumberProduk
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
                                homeController.selectedSumberProduk.value =
                                    value!;
                              },
                              selectedItem:
                                  homeController.selectedSumberProduk.value,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Target Pembeli',
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
                                  .targetPembeli
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
                                homeController.selectedTargetPembeli.value =
                                    value!;
                              },
                              selectedItem:
                                  homeController.selectedTargetPembeli.value,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Lokasi Operasional',
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
                                constraints: BoxConstraints(maxHeight: 28.h),
                                showSelectedItems: true,
                              ),
                              items: homeController
                                  .lokasiOperasional
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
                                homeController.selectedLokasiOperasional.value =
                                    value!;
                              },
                              selectedItem: homeController
                                  .selectedLokasiOperasional.value,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 40.w, right: 5.w, bottom: 10.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: birulangit,
          ),
          onPressed: () {
            var targerModal = homeController.targerModalTeamController.text;
            var minimalInvestasi =
                homeController.minimalInvestasiTeamController.text;
            var sumberProduk = homeController.selectedSumberProduk.value;
            var targetPembeli = homeController.selectedTargetPembeli.value;
            var lokasiOperasional =
                homeController.selectedLokasiOperasional.value;
            if (targerModal.isEmpty &&
                minimalInvestasi.isEmpty &&
                sumberProduk.isEmpty &&
                targetPembeli.isEmpty &&
                lokasiOperasional.isEmpty) {
              Get.snackbar(
                'Failed',
                'Semua Data Harus Diisi',
                colorText: Colors.white,
                backgroundColor: Colors.red[300],
                icon: const Icon(Icons.warning, color: Colors.white),
                snackPosition: SnackPosition.TOP,
              );
            } else if (targerModal.isEmpty) {
              Get.snackbar(
                'Failed',
                'Target Modal Tidak Boleh Kosong',
                colorText: Colors.white,
                backgroundColor: Colors.red[300],
                icon: const Icon(Icons.warning, color: Colors.white),
                snackPosition: SnackPosition.TOP,
              );
            } else if (minimalInvestasi.isEmpty) {
              Get.snackbar(
                'Failed',
                'Minimal Investasi Tidak Boleh Kosong',
                colorText: Colors.white,
                backgroundColor: Colors.red[300],
                icon: const Icon(Icons.warning, color: Colors.white),
                snackPosition: SnackPosition.TOP,
              );
            } else if (sumberProduk.isEmpty) {
              Get.snackbar(
                'Failed',
                'Sumber Produk Tidak Boleh Kosong',
                colorText: Colors.white,
                backgroundColor: Colors.red[300],
                icon: const Icon(Icons.warning, color: Colors.white),
                snackPosition: SnackPosition.TOP,
              );
            } else if (targetPembeli.isEmpty) {
              Get.snackbar(
                'Failed',
                'Target Pembeli Tidak Boleh Kosong',
                colorText: Colors.white,
                backgroundColor: Colors.red[300],
                icon: const Icon(Icons.warning, color: Colors.white),
                snackPosition: SnackPosition.TOP,
              );
            } else if (lokasiOperasional.isEmpty) {
              Get.snackbar(
                'Failed',
                'Lokasi Operasional Tidak Boleh Kosong',
                colorText: Colors.white,
                backgroundColor: Colors.red[300],
                icon: const Icon(Icons.warning, color: Colors.white),
                snackPosition: SnackPosition.TOP,
              );
            } else {
              homeController.updatePlanningBisnis(
                  targetModal: targerModal,
                  minimalInvestasi: minimalInvestasi,
                  teamId: widget.idTeam,
                  teamPlanningId: widget.id);
            }
          },
          child: Text(
            'Simpan',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: putih,
            ),
          ),
        ),
      ),
    );
  }
}
