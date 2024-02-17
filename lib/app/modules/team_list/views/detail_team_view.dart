import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/team_list/controllers/team_list_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/detail_tim_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTeamView extends StatelessWidget {
  final String id;
  final String statusPeminat;
  DetailTeamView({super.key, required this.id, required this.statusPeminat});
  final TeamListController teamListController = Get.put(TeamListController());
  final HomeController homeController = Get.put(HomeController());
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );
  // final aksesData = 'terkunci'.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        title: Text(
          'Info Team',
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Obx(
            () {
              if (teamListController.teamDetail.value.success == true) {
                var teamDetailTeam = teamListController.teamDetail.value.team;
                var teamDetailAnggota =
                    teamListController.teamDetail.value.teamAnggota;
                var teamDetailPlanning =
                    teamListController.teamDetail.value.teamPlanning;
                var teamDetailPeminat =
                    teamListController.teamDetail.value.teamPeminat;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.w),
                            child: Row(
                              children: [
                                Text(
                                  'Informasi Usaha',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Icon(
                                  Icons.store,
                                  color: pembeda,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          children: [
                            DetailTimWidget(
                              label: 'Nama Usaha',
                              isilabel: teamDetailTeam!.nama,
                            ),
                            DetailTimWidget(
                              label: 'Jenis Usaha',
                              isilabel: teamDetailTeam.jenisUsaha,
                            ),
                            DetailTimWidget(
                              label: 'Sektor',
                              isilabel: teamDetailTeam.sektorUsaha,
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
                                        teamDetailTeam.deskripsi,
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
                            //           width: 20.w,
                            //           child: Text(
                            //             'Video',
                            //             style: GoogleFonts.poppins(
                            //               fontSize: 11.sp,
                            //             ),
                            //           ),
                            //         ),
                            //         const Spacer(),
                            //         ElevatedButton(
                            //           style: ElevatedButton.styleFrom(
                            //             backgroundColor: birulangit,
                            //           ),
                            //           onPressed: () async {
                            //             await openUrl(teamDetailTeam.url);
                            //           },
                            //           child: Padding(
                            //             padding: EdgeInsets.symmetric(
                            //                 horizontal: 4.w),
                            //             child: Text(
                            //               'Buka Video',
                            //               style: GoogleFonts.poppins(
                            //                 fontSize: 11.sp,
                            //                 fontWeight: FontWeight.w500,
                            //               ),
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
                                      width: 65.w,
                                      child: Text(
                                        teamDetailTeam.email,
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
                            DetailTimWidget(
                              label: 'Nomor HP',
                              isilabel: teamDetailTeam.nohp,
                            ),
                          ],
                        ),
                      ),
                      Column(
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
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
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
                              ).format(
                                  int.parse(teamDetailPlanning!.targetModal)),
                            ),
                            DetailTimWidget(
                              label: 'Sumber Produk',
                              isilabel: teamDetailPlanning.sumberProduk,
                            ),
                            DetailTimWidget(
                              label: 'Target Pembeli',
                              isilabel: teamDetailPlanning.targetPembeli,
                            ),
                            DetailTimWidget(
                              label: 'Lokasi Operasional',
                              isilabel: teamDetailPlanning.lokasiOperasional,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.w),
                            child: Row(
                              children: [
                                Text(
                                  'Informasi Pemilik',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Icon(
                                  Icons.diversity_3,
                                  color: birulangit,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      //anggota
                      SizedBox(
                        height: 35.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: teamDetailAnggota!.length,
                          itemBuilder: (context, index) {
                            var daftarAnggota = teamDetailAnggota[index];
                            return Padding(
                              padding: EdgeInsets.all(3.w),
                              child: Row(
                                children: [
                                  //1
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
                                            children: [
                                              Container(
                                                height: 20.w,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: pembeda,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        daftarAnggota.fotoUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Text(
                                                daftarAnggota.nama,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11.sp,
                                                  color: putih,
                                                ),
                                              )
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
                                                      daftarAnggota.nohp,
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
                                                      daftarAnggota.instagram,
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
                                                      daftarAnggota.ukuranBaju,
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
                                                      daftarAnggota
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
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      //Peminat
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.w),
                            child: Row(
                              children: [
                                Text(
                                  'Peminat',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const Icon(
                                  Icons.monetization_on,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                      teamDetailPeminat!.isEmpty
                          ? Center(
                              child: Text(
                                'Belum Ada Peminat',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: teamDetailPeminat.length,
                              itemBuilder: (context, index) {
                                var peminatDetail = teamDetailPeminat[index];
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 10.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: birulangit,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 15.w,
                                                width: 15.w,
                                                decoration: BoxDecoration(
                                                  color: pembeda,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: CachedNetworkImage(
                                                    imageUrl: peminatDetail
                                                        .investorFotoUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    peminatDetail.investorNama,
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 11.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    peminatDetail
                                                        .investorPekerjaan,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 9.sp,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: SpinKitThreeBounce(
                    color: pembeda,
                  ),
                );
              }
            },
          ),
          Visibility(
            visible: statusPeminat == 'approve' ? false : true,
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: putih,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                    child: Image.asset('assets/padlock.png'),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    statusPeminat == 'null'
                        ? 'Kirim Permintaan Akses Data'
                        : statusPeminat == 'request'
                            ? 'Harap ditunggu, Sedang Verifikasi'
                            : statusPeminat == 'reject'
                                ? 'Permintaan Anda di Tolak'
                                : 'Permintaan Anda di Hapus',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                  statusPeminat == 'null'
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: birulangit),
                          onPressed: () async {
                            await homeController
                                .permintaanAksesData(int.parse(id));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              'Kirim',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  color: putih),
                            ),
                          ),
                        )
                      : statusPeminat == 'request'
                          ? Container()
                          : statusPeminat == 'reject'
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: birulangit),
                                  onPressed: () async {
                                    await homeController
                                        .permintaanAksesData(int.parse(id));
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: Text(
                                      'Kirim Ulang',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp),
                                    ),
                                  ),
                                )
                              : Container()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> openUrl(String url,
      {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launch(url,
        forceSafariVC: forceWebView, enableJavaScript: enableJavaScript);
  }
}
