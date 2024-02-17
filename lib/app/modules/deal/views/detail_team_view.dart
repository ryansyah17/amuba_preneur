import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/deal/controllers/deal_controller.dart';
import 'package:entrepreneur_app/app/modules/deal/views/detail_link_video.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/detail_tim_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class DetailMyTeamView extends StatelessWidget {
  final String id;
  DetailMyTeamView({super.key, required this.id});
  final DealController dealController = Get.put(DealController());
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );

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
          'Detail MyTeam',
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: Obx(
        () {
          if (dealController.myTeamDetail.value.success == true) {
            var team = dealController.myTeamDetail.value.team;
            var planning = dealController.myTeamDetail.value.teamPlanning;
            var anggota = dealController.myTeamDetail.value.teamAnggota;
            var docs = dealController.myTeamDetail.value.teamDocs;
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
                          isilabel: team!.nama,
                        ),
                        DetailTimWidget(
                          label: 'Jenis Usaha',
                          isilabel: team.jenisUsaha,
                        ),
                        DetailTimWidget(
                          label: 'Sektor',
                          isilabel: team.sektorUsaha,
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
                                    team.deskripsi,
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
                        Column(
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 24.w,
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
                                  child: GestureDetector(
                                    onLongPress: () {
                                      Clipboard.setData(
                                          ClipboardData(text: team.email));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text("Text copied to clipboard"),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      team.email,
                                      textAlign: TextAlign.right,
                                      maxLines: 4,
                                      style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                          isilabel: team.nohp,
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
                          ).format(int.parse(planning!.targetModal)),
                        ),
                        DetailTimWidget(
                          label: 'Sumber Produk',
                          isilabel: planning.sumberProduk,
                        ),
                        DetailTimWidget(
                          label: 'Target Pembeli',
                          isilabel: planning.targetPembeli,
                        ),
                        DetailTimWidget(
                          label: 'Lokasi Operasional',
                          isilabel: planning.lokasiOperasional,
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
                      itemCount: anggota!.length,
                      itemBuilder: (context, index) {
                        var daftarAnggota = anggota[index];
                        return Padding(
                          padding: EdgeInsets.all(2.w),
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
                                                imageUrl: daftarAnggota.fotoUrl,
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
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
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
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    color: putih,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  daftarAnggota.nohp,
                                                  style: GoogleFonts.poppins(
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
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    color: putih,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  daftarAnggota.instagram,
                                                  style: GoogleFonts.poppins(
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
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    color: putih,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  daftarAnggota.ukuranBaju,
                                                  style: GoogleFonts.poppins(
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
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    color: putih,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  daftarAnggota
                                                      .pendidikanTerakhir,
                                                  style: GoogleFonts.poppins(
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
                  //dOKUMEN
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Row(
                          children: [
                            Text(
                              'Rancangan Proposal Team',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Icon(
                              Icons.book,
                              color: Colors.amber,
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
                  docs!.isEmpty
                      ? Center(
                          child: Text(
                            'Kosong',
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            var teamDocs = docs[index];
                            return Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Container(
                                height: 12.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: putih,
                                  boxShadow: const [
                                    BoxShadow(blurRadius: 5),
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                        child: teamDocs.file == null
                                            ? Image.asset('assets/play.png')
                                            : Image.asset(
                                                'assets/pdf.png',
                                              ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 50.w,
                                            child: Text(
                                              teamDocs.judul,
                                              maxLines: 1,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11.sp),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            'Tahap ${teamDocs.tahap!}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          teamDocs.file == null
                                              ? Get.to(DetailLinkVideoPage(
                                                  judul: teamDocs.judul,
                                                  tahap: teamDocs.tahap!,
                                                  url: teamDocs.url!,
                                                  status: teamDocs.status!,
                                                ))
                                              : downloadFile(
                                                  context, teamDocs.fileUrl);
                                        },
                                        child: Container(
                                          width: 15.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: birulangit,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Buka',
                                              style: GoogleFonts.poppins(
                                                color: putih,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                  SizedBox(height: 3.h),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 5.w),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //             backgroundColor: birulangit),
                  //         onPressed: () async {
                  //           await openUrl(team.url);
                  //           print(team.url);
                  //         },
                  //         child: Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: 4.w),
                  //           child: Text(
                  //             'Buka Video',
                  //             style: GoogleFonts.poppins(),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
    );
  }

  Future<void> downloadFile(BuildContext context, String pdfUrl) async {
    final url = pdfUrl;

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;

        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/dokumen.pdf');

        await file.writeAsBytes(bytes);

        final pdfPath = file.path;
        Get.to(
          Stack(
            children: [
              PDFView(
                filePath: pdfPath,
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: Row(
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: birulangit),
                      child: Text(
                        'Download',
                        style: GoogleFonts.montserrat(
                          color: putih,
                        ),
                      ),
                      onPressed: () async {
                        await openUrl(url);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => Get.back(),
                      child: Text('Back',
                          style: GoogleFonts.montserrat(
                            color: putih,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        print('Failed to download PDF: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  Future<void> openUrl(String url,
      {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launch(url,
        forceSafariVC: forceWebView, enableJavaScript: enableJavaScript);
  }
}
