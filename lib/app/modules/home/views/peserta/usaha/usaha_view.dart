import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/register_informasi_anggota.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/register_informasi_usaha.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/register_planning_bisnis.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/update_informasi_anggota.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/update_informasi_usaha.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/update_planing_bisnis.dart';
import 'package:entrepreneur_app/app/modules/mainpage/views/peserta/mainpage_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/detail_tim_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class UsahaView extends StatelessWidget {
  UsahaView({super.key});
  final HomeController homeController = Get.put(HomeController());
  var planning_usaha = 'berisi'.obs;
  var informasi_pemilik = 'berisi'.obs;
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
                            Get.off(
                              const MainPageView(
                                initialPage: 0,
                              ),
                            );
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
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Obx(
                                      () => CachedNetworkImage(
                                        imageUrl: homeController.informasiUsaha
                                                    .value.team !=
                                                null
                                            ? homeController.informasiUsaha
                                                .value.team!.logoUrl
                                            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu4wPmtkbNqp2aKis3pgfC2azM9OHL7AdFSg&usqp=CAU',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                      homeController
                                                  .informasiUsaha.value.team !=
                                              null
                                          ? homeController
                                              .informasiUsaha.value.team!.nama
                                          : 'Nama Team',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      homeController
                                                  .informasiUsaha.value.team !=
                                              null
                                          ? homeController
                                              .informasiUsaha.value.team!.status
                                              .toUpperCase()
                                          : 'Nama Team',
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
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

              Obx(() {
                if (homeController.informasiUsaha.value.success == true) {
                  var informasiUsaha = homeController.informasiUsaha.value.team;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            Text(
                              'Informasi Usaha',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Icon(
                              Icons.store,
                              color: Colors.green,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                    UpdateInformasiUsaha(
                                      namaUsaha: informasiUsaha!.nama,
                                      logoUsaha: informasiUsaha.logo!,
                                      jenisUsaha: informasiUsaha.jenisUsaha,
                                      sektorUsaha: informasiUsaha.sektorUsaha,
                                      deskripsiUsaha: informasiUsaha.deskripsi,
                                      emailUsaha: informasiUsaha.email,
                                      nomorHpUsaha: informasiUsaha.nohp,
                                      id: informasiUsaha.id.toString(),
                                    ),
                                    arguments:
                                        homeController.fetchInformasiUsaha());
                              },
                              child: Text(
                                'Edit',
                                style: GoogleFonts.poppins(
                                  color: birulangit,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          children: [
                            DetailTimWidget(
                              label: 'Nama Usaha',
                              isilabel: informasiUsaha!.nama,
                            ),
                            DetailTimWidget(
                              label: 'Jenis Usaha',
                              isilabel: informasiUsaha.jenisUsaha,
                            ),
                            DetailTimWidget(
                              label: 'Sektor Usaha',
                              isilabel: informasiUsaha.sektorUsaha,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      child: Text(
                                        'Deskripsi',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 70.w,
                                      child: Text(
                                        informasiUsaha.deskripsi,
                                        textAlign: TextAlign.right,
                                        maxLines: 4,
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  height: 1,
                                  color: hitam,
                                  width: 100.w,
                                ),
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     SizedBox(
                            //       height: 1.h,
                            //     ),
                            //     Row(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         SizedBox(
                            //           width: 25.w,
                            //           child: Text(
                            //             'Link Video',
                            //             style: GoogleFonts.poppins(
                            //               fontSize: 11.sp,
                            //             ),
                            //           ),
                            //         ),
                            //         const Spacer(),
                            //         SizedBox(
                            //           width: 60.w,
                            //           child: Text(
                            //             informasiUsaha.url,
                            //             maxLines: 2,
                            //             textAlign: TextAlign.right,
                            //             style: GoogleFonts.poppins(
                            //               fontSize: 11.sp,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     SizedBox(
                            //       height: 1.h,
                            //     ),
                            //     Container(
                            //       height: 1,
                            //       color: hitam,
                            //       width: 100.w,
                            //     ),
                            //   ],
                            // ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 25.w,
                                      child: Text(
                                        'Email Bisnis',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 60.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            informasiUsaha.email,
                                            maxLines: 1,
                                            style: GoogleFonts.poppins(
                                              fontSize: 11.sp,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  height: 1,
                                  color: hitam,
                                  width: 100.w,
                                ),
                              ],
                            ),
                            DetailTimWidget(
                              label: 'Nomor HP',
                              isilabel: informasiUsaha.nohp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            Text(
                              'Informasi Usaha',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Icon(
                              Icons.store,
                              color: Colors.green,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(RegisterInformasiUsaha());
                              },
                              child: Text(
                                'Lengkapi',
                                style: GoogleFonts.poppins(
                                  color: birulangit,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          'Lengkapi Data usaha untuk segera di review oleh Tim Amuba',
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }),
              SizedBox(
                height: 1.h,
              ),
              //planning bisnis
              Obx(() {
                if (homeController.planningUsaha.value.success == true) {
                  var planingUsaha =
                      homeController.planningUsaha.value.teamPlanning;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Row(
                          children: [
                            Text(
                              'Planning Bisnis ',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Icon(
                              Icons.telegram,
                              color: Colors.red,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                    UpdatePlanningBisnis(
                                      id: planingUsaha!.id.toString(),
                                      namaUsaha: planingUsaha.teamNama,
                                      targetModal: planingUsaha.targetModal,
                                      sumberProduk: planingUsaha.sumberProduk,
                                      targetPembeli: planingUsaha.targetPembeli,
                                      lokasiOperasional:
                                          planingUsaha.lokasiOperasional,
                                      idTeam: planingUsaha.teamId,
                                      minimalInvestasi:
                                          planingUsaha.minInvestasi,
                                    ),
                                    arguments:
                                        homeController.fetchPlanningUsaha(
                                            int.parse(planingUsaha.teamId)));
                              },
                              child: Text(
                                'Edit',
                                style: GoogleFonts.poppins(
                                  color: birulangit,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 100.w,
                        color: hitam,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          children: [
                            DetailTimWidget(
                              label: 'Target Modal',
                              isilabel: NumberFormat.currency(
                                locale: 'id-ID',
                                decimalDigits: 0,
                                symbol: 'Rp',
                              ).format(int.parse(planingUsaha!.targetModal)),
                            ),
                            DetailTimWidget(
                              label: 'Sumber Produk',
                              isilabel: planingUsaha.sumberProduk,
                            ),
                            DetailTimWidget(
                              label: 'Target Pembeli',
                              isilabel: planingUsaha.targetPembeli,
                            ),
                            DetailTimWidget(
                              label: 'Lokasi Operasional',
                              isilabel: planingUsaha.lokasiOperasional,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            Text(
                              'Planning Bisnis',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Icon(
                              Icons.telegram,
                              color: Colors.red,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                homeController.informasiUsaha.value.team == null
                                    ? Get.snackbar(
                                        'Failed',
                                        'Silangkan Isi Data Informasi Usaha Terlebih Dahulu',
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red[300],
                                        icon: const Icon(Icons.warning,
                                            color: Colors.white),
                                        snackPosition: SnackPosition.TOP,
                                      )
                                    : Get.to(
                                        RegisterPlanningView(
                                          namaTeam: homeController
                                              .informasiUsaha.value.team!.nama,
                                          teamId: homeController
                                              .informasiUsaha.value.team!.id
                                              .toString(),
                                          status: homeController.informasiUsaha
                                              .value.team!.status,
                                        ),
                                      );
                                print(homeController
                                    .informasiUsaha.value.team!.id
                                    .toString());
                              },
                              child: Text(
                                'Lengkapi',
                                style: GoogleFonts.poppins(
                                  color: birulangit,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          'Lengkapi Data usaha untuk segera di review oleh Tim Amuba',
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }),
              SizedBox(
                height: 1.h,
              ),
              //anggota
              Obx(() {
                if (homeController.informasiAnggota.value.success == true) {
                  if (homeController
                      .informasiAnggota.value.teamAnggota!.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            children: [
                              Text(
                                'Informasi Anggota',
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Icon(
                                Icons.diversity_3,
                                color: birulangit,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  homeController.informasiUsaha.value.team ==
                                          null
                                      ? Get.snackbar(
                                          'Failed',
                                          'Silangkan Isi Data Informasi Usaha Terlebih Dahulu',
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red[300],
                                          icon: const Icon(Icons.warning,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.TOP,
                                        )
                                      : Get.to(
                                          InformasiAnggotaView(
                                            namaTeam: homeController
                                                .informasiUsaha
                                                .value
                                                .team!
                                                .nama,
                                            teamId: homeController
                                                .informasiUsaha.value.team!.id
                                                .toString(),
                                            status: homeController
                                                .informasiUsaha
                                                .value
                                                .team!
                                                .status,
                                          ),
                                        );
                                  print(homeController
                                      .informasiUsaha.value.team!.id
                                      .toString());
                                },
                                child: Text(
                                  'Lengkapi',
                                  style: GoogleFonts.poppins(
                                    color: birulangit,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 1,
                              width: 100.w,
                              color: hitam,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            'Lengkapi Data Anggota Pemilik Usaha',
                            style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            children: [
                              Text(
                                'Informasi Anggota',
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Icon(
                                Icons.diversity_3,
                                color: birulangit,
                              ),
                              const Spacer(),
                              Obx(() => homeController.informasiAnggota.value
                                          .teamAnggotaTotal ==
                                      4
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          InformasiAnggotaView(
                                            namaTeam: homeController
                                                .informasiUsaha
                                                .value
                                                .team!
                                                .nama,
                                            teamId: homeController
                                                .informasiUsaha.value.team!.id
                                                .toString(),
                                            status: homeController
                                                .informasiUsaha
                                                .value
                                                .team!
                                                .status,
                                          ),
                                        );
                                        print(homeController
                                            .informasiUsaha.value.team!.id
                                            .toString());
                                      },
                                      child: Text(
                                        'Add',
                                        style: GoogleFonts.poppins(
                                          color: birulangit,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ))
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 1,
                              width: 100.w,
                              color: hitam,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: SizedBox(
                            height: 32.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: homeController
                                  .informasiAnggota.value.teamAnggotaTotal,
                              itemBuilder: (context, index) {
                                var informasiAnggota = homeController
                                    .informasiAnggota.value.teamAnggota![index];
                                return Row(
                                  children: [
                                    Container(
                                      height: 30.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: birulangit,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.w),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 20.w,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: pembeda,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: CachedNetworkImage(
                                                      imageUrl: informasiAnggota
                                                          .fotoUrl,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.sp,
                                                        color: putih,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30.w,
                                                      child: Text(
                                                        informasiAnggota.nama,
                                                        maxLines: 1,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.sp,
                                                        color: putih,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 10.w,
                                                      height: 5.h,
                                                      decoration: BoxDecoration(
                                                        color: blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Get.to(
                                                            UpdateInformasiAnggota(
                                                              id: informasiAnggota
                                                                  .id
                                                                  .toString(),
                                                              namaAnggota:
                                                                  informasiAnggota
                                                                      .nama,
                                                              noHpAnggota:
                                                                  informasiAnggota
                                                                      .nohp,
                                                              instagramAnggota:
                                                                  informasiAnggota
                                                                      .instagram,
                                                              ukuranBajuAnggota:
                                                                  informasiAnggota
                                                                      .ukuranBaju,
                                                              pendidikanAnggota:
                                                                  informasiAnggota
                                                                      .pendidikanTerakhir,
                                                              fotoAnggota:
                                                                  informasiAnggota
                                                                      .fotoUrl,
                                                              fotoIdAnggota:
                                                                  informasiAnggota
                                                                      .fotoKtpUrl,
                                                              namaTeam:
                                                                  informasiAnggota
                                                                      .teamNama,
                                                              teamId:
                                                                  informasiAnggota
                                                                      .teamId,
                                                            ),
                                                            arguments:
                                                                homeController
                                                                    .fetchInformasiAnggota(
                                                              int.parse(
                                                                  informasiAnggota
                                                                      .teamId),
                                                            ),
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            Icons.edit),
                                                        color: birulangit,
                                                        iconSize: 20,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Container(
                                                      width: 10.w,
                                                      height: 5.h,
                                                      decoration: BoxDecoration(
                                                        color: blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () async {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isDismissible:
                                                                false,
                                                            useSafeArea: true,
                                                            builder: (context) {
                                                              return SizedBox(
                                                                height: 15.h,
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            1.h),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              20.w,
                                                                          height:
                                                                              1.h,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                            color:
                                                                                hitam,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          1.h,
                                                                    ),
                                                                    Text(
                                                                      'Apakah anda yakin ?',
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              13.sp),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          1.h,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        ElevatedButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 10.w),
                                                                            child:
                                                                                Text(
                                                                              'Batal',
                                                                              style: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w500,
                                                                                color: putih,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        ElevatedButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(backgroundColor: birulangit),
                                                                          onPressed:
                                                                              () async {
                                                                            await homeController.deleteAnggota(informasiAnggota.id);
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 10.w),
                                                                            child:
                                                                                Text(
                                                                              'Hapus',
                                                                              style: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w500,
                                                                                color: putih,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete),
                                                        color: Colors.red,
                                                        iconSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              height: 1,
                                              width: 100.w,
                                              color: putih,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Nomor Hp',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        informasiAnggota.nohp,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width: 100.w,
                                                    color: putih,
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Instagram',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        informasiAnggota
                                                            .instagram,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width: 100.w,
                                                    color: putih,
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Ukuran Baju',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        informasiAnggota
                                                            .ukuranBaju,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width: 100.w,
                                                    color: putih,
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Pendidikan Terakhir',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        informasiAnggota
                                                            .pendidikanTerakhir,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10.sp,
                                                          color: putih,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width: 100.w,
                                                    color: putih,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            Text(
                              'Informasi Anggota',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(
                              Icons.diversity_3,
                              color: birulangit,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                homeController.informasiUsaha.value.team == null
                                    ? Get.snackbar(
                                        'Failed',
                                        'Silangkan Isi Data Informasi Usaha Terlebih Dahulu',
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red[300],
                                        icon: const Icon(Icons.warning,
                                            color: Colors.white),
                                        snackPosition: SnackPosition.TOP,
                                      )
                                    : Get.to(
                                        InformasiAnggotaView(
                                          namaTeam: homeController
                                              .informasiUsaha.value.team!.nama,
                                          teamId: homeController
                                              .informasiUsaha.value.team!.id
                                              .toString(),
                                          status: homeController.informasiUsaha
                                              .value.team!.status,
                                        ),
                                      );
                                print(homeController
                                    .informasiUsaha.value.team!.id
                                    .toString());
                              },
                              child: Text(
                                'Lengkapi',
                                style: GoogleFonts.poppins(
                                  color: birulangit,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          'Lengkapi Data Anggota Pemilik Usaha',
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => homeController.informasiUsaha.value.team == null ||
                        homeController.planningUsaha.value.teamPlanning ==
                            null ||
                        homeController
                                .informasiAnggota.value.teamAnggotaTotal ==
                            0 ||
                        homeController.informasiUsaha.value.team!.status ==
                            'request' ||
                        homeController.informasiUsaha.value.team!.status ==
                            'approve'
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: birulangit),
                              onPressed: () async {
                                homeController.submitPendaftaran(homeController
                                    .informasiUsaha.value.team!.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
