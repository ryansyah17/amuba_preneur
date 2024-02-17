import 'dart:io';

import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/dokumen_update.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/kondisi_view/detail_link_video.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/kondisi_view/update_link_video.dart';
import 'package:entrepreneur_app/app/modules/mainpage/views/peserta/mainpage_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class MateriView extends StatelessWidget {
  MateriView({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: putih,
        leading: IconButton(
          onPressed: () {
            Get.off(
              MainPageView(
                initialPage: 0,
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: hitam,
          ),
        ),
        title: Text(
          'Materi',
          style: GoogleFonts.poppins(
            color: hitam,
            fontSize: 14.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            //list
            Obx(
              () => SizedBox(
                height: homeController.documentData.value.teamDocsTotal == 3
                    ? 85.h
                    : 60.h,
                child: Obx(() {
                  if (homeController.documentData.value.success == true) {
                    if (homeController.documentData.value.teamDocs!.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35.h,
                            width: 100.h,
                            child: Image.asset('assets/noData.png'),
                          ),
                          Text(
                            'Data Materi Kosong',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            homeController.documentData.value.teamDocsTotal,
                        itemBuilder: (context, index) {
                          var documentData = homeController
                              .documentData.value.teamDocs![index];
                          return Column(
                            children: [
                              Container(
                                height: 8.h,
                                decoration: BoxDecoration(
                                    color: putih,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        color: hitam,
                                      )
                                    ]),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Row(
                                    children: [
                                      documentData.file == null
                                          ? SizedBox(
                                              height: 5.h,
                                              child: Image.asset(
                                                  'assets/play.png'),
                                            )
                                          : SizedBox(
                                              height: 5.h,
                                              child:
                                                  Image.asset('assets/pdf.png'),
                                            ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 60.w,
                                            child: Text(
                                              documentData.judul,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 60.w,
                                            child: Text(
                                              documentData.status!
                                                  .toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 9.sp,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      documentData.status == 'approve'
                                          ? GestureDetector(
                                              onTap: () {
                                                documentData.file == null
                                                    ? Get.to(DetailLinkVideo(
                                                        judul:
                                                            documentData.judul,
                                                        tahap:
                                                            documentData.tahap!,
                                                        url: documentData.url!,
                                                        status: documentData
                                                            .status!,
                                                      ))
                                                    : downloadFile(context,
                                                        documentData.fileUrl);
                                              },
                                              child: SizedBox(
                                                height: 4.h,
                                                child: Image.asset(
                                                    'assets/detail.png'),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              documentData.status == 'request'
                                  ? Row(
                                      mainAxisAlignment: homeController
                                                  .stageData
                                                  .value
                                                  .stageSchedule!
                                                  .tahapStatus ==
                                              'Expired'
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.spaceBetween,
                                      children: [
                                        homeController
                                                    .stageData
                                                    .value
                                                    .stageSchedule!
                                                    .tahapStatus !=
                                                'Expired'
                                            ? SizedBox(
                                                width: 28.w,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red[300],
                                                  ),
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      isDismissible: false,
                                                      useSafeArea: true,
                                                      builder: (context) {
                                                        return SizedBox(
                                                          height: 15.h,
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                  height: 1.h),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width: 20.w,
                                                                    height: 1.h,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color:
                                                                          hitam,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              Text(
                                                                'Apakah anda yakin ?',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        fontSize:
                                                                            13.sp),
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors.red),
                                                                    onPressed:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.w),
                                                                      child:
                                                                          Text(
                                                                        'Batal',
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                putih,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            birulangit),
                                                                    onPressed:
                                                                        () async {
                                                                      Get.back();
                                                                      await homeController.deleteDocument(
                                                                          documentData
                                                                              .id,
                                                                          int.parse(
                                                                              documentData.teamId));
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.w),
                                                                      child:
                                                                          Text(
                                                                        'Hapus',
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                putih,
                                                                            fontWeight:
                                                                                FontWeight.w500),
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
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.w),
                                                    child: Text(
                                                      'Hapus',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: putih,
                                                              fontSize: 9.sp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        SizedBox(
                                          width: 28.w,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: birubg,
                                            ),
                                            onPressed: () {
                                              documentData.file == null
                                                  ? Get.to(DetailLinkVideo(
                                                      judul: documentData.judul,
                                                      tahap:
                                                          documentData.tahap!,
                                                      url: documentData.url!,
                                                      status:
                                                          documentData.status!,
                                                    ))
                                                  : downloadFile(context,
                                                      documentData.fileUrl);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              child: Text(
                                                'Detail',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 9.sp,
                                                    color: putih),
                                              ),
                                            ),
                                          ),
                                        ),
                                        homeController
                                                    .stageData
                                                    .value
                                                    .stageSchedule!
                                                    .tahapStatus !=
                                                'Expired'
                                            ? SizedBox(
                                                width: 28.w,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: pembeda,
                                                  ),
                                                  onPressed: () {
                                                    documentData.file == null
                                                        ? Get.to(
                                                            UpdateLinkVideo(
                                                              teamId:
                                                                  documentData
                                                                      .teamId,
                                                              judul:
                                                                  documentData
                                                                      .judul,
                                                              id: documentData
                                                                  .id
                                                                  .toString(),
                                                              linkVideo:
                                                                  documentData
                                                                      .url!,
                                                            ),
                                                          )
                                                        : Get.to(UpdateDokumen(
                                                            id: documentData.id
                                                                .toString(),
                                                            teamId: documentData
                                                                .teamId,
                                                            judulProposal:
                                                                documentData
                                                                    .judul,
                                                            tahap: documentData
                                                                .tahap!,
                                                            dokumen:
                                                                documentData
                                                                    .file!));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.w),
                                                    child: Text(
                                                      'Edit',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: putih,
                                                              fontSize: 9.sp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : documentData.status == 'approve'
                                      ? Container()
                                      : documentData.status == 'revisi'
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 28.w,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: birubg,
                                                    ),
                                                    onPressed: () {
                                                      documentData.file == null
                                                          ? Get.to(
                                                              DetailLinkVideo(
                                                              judul:
                                                                  documentData
                                                                      .judul,
                                                              tahap:
                                                                  documentData
                                                                      .tahap!,
                                                              url: documentData
                                                                  .url!,
                                                              status:
                                                                  documentData
                                                                      .status!,
                                                            ))
                                                          : downloadFile(
                                                              context,
                                                              documentData
                                                                  .fileUrl);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.w),
                                                      child: Text(
                                                        'Detail',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: putih,
                                                                fontSize: 9.sp),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                homeController
                                                            .stageData
                                                            .value
                                                            .stageSchedule!
                                                            .tahapStatus !=
                                                        'Expired'
                                                    ? SizedBox(
                                                        width: 28.w,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                pembeda,
                                                          ),
                                                          onPressed: () {
                                                            documentData.file ==
                                                                    null
                                                                ? Get.to(
                                                                    UpdateLinkVideo(
                                                                      teamId: documentData
                                                                          .teamId,
                                                                      judul: documentData
                                                                          .judul,
                                                                      id: documentData
                                                                          .id
                                                                          .toString(),
                                                                      linkVideo:
                                                                          documentData
                                                                              .url!,
                                                                    ),
                                                                  )
                                                                : Get.to(UpdateDokumen(
                                                                    id: documentData
                                                                        .id
                                                                        .toString(),
                                                                    teamId: documentData
                                                                        .teamId,
                                                                    judulProposal:
                                                                        documentData
                                                                            .judul,
                                                                    tahap: documentData
                                                                        .tahap!,
                                                                    dokumen:
                                                                        documentData
                                                                            .file!));
                                                          },
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2.w),
                                                            child: Text(
                                                              'Edit',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      fontSize:
                                                                          9.sp,
                                                                      color:
                                                                          putih),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            )
                                          : Container(),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    return Center(
                        child: SpinKitThreeBounce(
                      color: pembeda,
                    ));
                  }
                }),
              ),
            ),
          ],
        ),
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
                        style: GoogleFonts.montserrat(color: putih),
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
