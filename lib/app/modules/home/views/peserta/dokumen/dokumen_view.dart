import 'package:entrepreneur_app/app/controller/notification_controller.dart';
import 'package:entrepreneur_app/app/data/peserta/data_document_team.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/dokumen_update.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/kondisi_view/materi_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/kondisi_view/update_link_video.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/kondisi_view/upload_link_video.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/upload_proposal.dart';
import 'package:entrepreneur_app/app/modules/mainpage/views/peserta/mainpage_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DokumenView extends StatelessWidget {
  final String teamId;
  DokumenView({
    super.key,
    required this.teamId,
  });
  final HomeController homeController = Get.put(HomeController());
  final NotificationController notifikasiController =
      Get.put(NotificationController());
  RxBool _isDialogVisible = false.obs;
  void _toggleDialog() {
    _isDialogVisible.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () {
              if (homeController.stageData.value.success == true) {
                var stage = homeController.stageData.value.stageSchedule;
                if (stage!.tahapStatus == 'Upcoming' && (stage.tahap == '1')) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/bg_materi.png'),
                              Positioned(
                                top: 3.h,
                                right: 0.w,
                                child: IconButton(
                                  onPressed: () {
                                    Get.off(
                                      const MainPageView(
                                        initialPage: 0,
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: putih,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Sesi belum dimulai',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Saat ini tahap pengunggahan video belum dimulai. Mohon bersabar dan pantau informasi terkini dari panitia lomba. Sebagai peserta, pastikan anda telah menyiapkan materi video Anda agar dapat segera mengunggahnya begitu tahap tersebut dibuka. Kami sangat mengapresiasi partisipasi Anda dan berharap untuk melihat ide bisnis kreatif dan inovatif yang akan Anda bagikan dalam lomba ini.',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 6.h,
                                            width: 14.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: birubg,
                                            ),
                                            child: Center(
                                              child: Text(
                                                homeController.daysStart.value
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  color: putih,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        'Hari',
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Column(
                                    children: [
                                      Container(
                                        height: 6.h,
                                        width: 14.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: birubg,
                                        ),
                                        child: Center(
                                          child: Text(
                                            homeController.hoursStart.value
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        'Jam',
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Column(
                                    children: [
                                      Container(
                                        height: 6.h,
                                        width: 14.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: birubg,
                                        ),
                                        child: Center(
                                          child: Text(
                                            homeController.minutesStart.value
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        'Menit',
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Column(
                                    children: [
                                      Container(
                                        height: 6.h,
                                        width: 14.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: birubg,
                                        ),
                                        child: Center(
                                          child: Text(
                                            homeController.secondsStart.value
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        'Detik',
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: birubg),
                            onPressed: () {
                              Get.to(MateriView());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                'Ok',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (stage.tahapStatus == 'Upcoming' &&
                    (stage.tahap == '2' ||
                        stage.tahap == '3' ||
                        stage.tahap == '4')) {
                  print('logic 1');
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/bg_materi.png'),
                              Positioned(
                                top: 3.h,
                                right: 0.w,
                                child: IconButton(
                                  onPressed: () {
                                    Get.off(
                                      const MainPageView(
                                        initialPage: 0,
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: putih,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Sesi belum dimulai',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Saat ini tahap pengunggahan materi belum dimulai. Mohon bersabar dan pantau informasi terkini dari panitia lomba. Sebagai peserta, pastikan anda telah menyiapkan materi proposal Anda agar dapat segera mengunggahnya begitu tahap tersebut dibuka. Kami sangat mengapresiasi partisipasi Anda dan berharap untuk melihat ide bisnis kreatif dan inovatif yang akan Anda bagikan dalam lomba ini.',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 6.h,
                                            width: 14.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: birubg,
                                            ),
                                            child: Center(
                                              child: Text(
                                                homeController.daysStart.value
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  color: putih,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        'Hari',
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Column(
                                    children: [
                                      Container(
                                        height: 6.h,
                                        width: 14.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: birubg,
                                        ),
                                        child: Center(
                                          child: Text(
                                            homeController.hoursStart.value
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        'Jam',
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Column(
                                    children: [
                                      Container(
                                        height: 6.h,
                                        width: 14.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: birubg,
                                        ),
                                        child: Center(
                                          child: Text(
                                            homeController.minutesStart.value
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        'Menit',
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Column(
                                    children: [
                                      Container(
                                        height: 6.h,
                                        width: 14.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: birubg,
                                        ),
                                        child: Center(
                                          child: Text(
                                            homeController.secondsStart.value
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: putih,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        'Detik',
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: birubg),
                            onPressed: () {
                              Get.to(MateriView());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                'Ok',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (stage.tahapStatus == 'Active' &&
                    stage.docStatus == 'belum_upload' &&
                    stage.tahap == '1') {
                  print('logic 2');
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/bg_materi.png'),
                              Positioned(
                                top: 3.h,
                                right: 0.w,
                                child: IconButton(
                                  onPressed: () {
                                    Get.off(const MainPageView(
                                      initialPage: 0,
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: putih,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Upload Link Video',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Pada tahap pertama lomba ide bisnis ini, setiap peserta diwajibkan untuk mengunggah link video Youtube yang memperkenalkan ide bisnisnya. Video ini menjadi wadah bagi peserta untuk menjelaskan secara komprehensif tentang konsep, potensi dan keunikan dari ide bisnis yang diajukan. Dengan tautan video ini, tim juri dapat mendapatkan gambaran yang jelas dan mendalam tentang ide bisnis peserta, memungkinkan evaluasi yang lebih terperinci. Peserta diharapkan menyajikan ide bisnis mereka dengan kreativitas meyakinkan agar dapat bersaing secara maksimal dalam kompetensi ini.',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: birubg),
                            onPressed: () {
                              Get.to(
                                UploadLinkVideo(
                                  teamId: teamId,
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                'Lanjutkan',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ],
                  );
                } else if ((stage.tahap == '1' ||
                        stage.tahap == '2' ||
                        stage.tahap == '3' ||
                        stage.tahap == '4') &&
                    (stage.tahapStatus == 'Active' ||
                        stage.tahapStatus == 'Expired') &&
                    (stage.docStatus == 'request' ||
                        stage.docStatus == 'approve')) {
                  print('logic 3');
                  return MateriView();
                } else if ((stage.tahap == '1' ||
                        stage.tahap == '2' ||
                        stage.tahap == '3' ||
                        stage.tahap == '4') &&
                    stage.tahapStatus == 'Active' &&
                    stage.docStatus == 'revisi') {
                  print('logic 4');
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/bg_materi.png'),
                              Positioned(
                                top: 3.h,
                                right: 0.w,
                                child: IconButton(
                                  onPressed: () {
                                    Get.off(const MainPageView(
                                      initialPage: 0,
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: putih,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Ops! Mohon lakukan revisi',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Untuk melengkapi tahap evaluasi, kami memerlukan revisi pada materi ide bisnis yang telah Anda unggah. Dikarenakan ${stage.reason}. Mohon untuk memperhatikan feedback dan panduan yang akan kami berikan secara lebih rinci melalui pesan pribadi atau platform komunikasi resmi kami. Kami mengapresiasi kerjasama Anda dalam meningkatkan kualitas presentasi ide bisnis Anda. Terima kasih atas dedikasi dan partisipasi Anda dalam lomba ini.',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: birubg),
                            onPressed: () {
                              List<TeamDocs> dataNull = homeController
                                  .documentData.value.teamDocs!
                                  .where((data) => data.file != null)
                                  .toList();
                              if (dataNull.isNotEmpty) {
                                print('true');
                                List<TeamDocs> revisiData = homeController
                                    .documentData.value.teamDocs!
                                    .where((data) => data.status == 'revisi')
                                    .toList();
                                if (revisiData.isNotEmpty) {
                                  TeamDocs revisiItem = revisiData[0];
                                  Get.to(UpdateDokumen(
                                      teamId: teamId,
                                      judulProposal: revisiItem.judul,
                                      tahap: revisiItem.tahap ?? '',
                                      dokumen: revisiItem.file!,
                                      id: revisiItem.id.toString()));
                                } else {
                                  print('No data with "revisi" status found.');
                                }
                              } else {
                                print('false');
                                List<TeamDocs> revisiData = homeController
                                    .documentData.value.teamDocs!
                                    .where((data) => data.status == 'revisi')
                                    .toList();
                                if (revisiData.isNotEmpty) {
                                  TeamDocs revisiItem = revisiData[
                                      0]; // Assuming you want the first item
                                  Get.to(UpdateLinkVideo(
                                    teamId: teamId,
                                    judul: revisiItem.judul,
                                    id: revisiItem.id.toString(),
                                    linkVideo: revisiItem.url == null
                                        ? ''
                                        : revisiItem.url!,
                                  ));
                                } else {
                                  print('No data with "revisi" status found.');
                                }
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                'Revisi',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ],
                  );
                } else if ((stage.tahap == '1' ||
                        stage.tahap == '2' ||
                        stage.tahap == '3' ||
                        stage.tahap == '4') &&
                    (stage.tahapStatus == 'Active' ||
                        stage.tahapStatus == 'Expired') &&
                    stage.docStatus == 'reject') {
                  print('logic 5');
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/bg_materi.png'),
                              Positioned(
                                top: 3.h,
                                right: 0.w,
                                child: IconButton(
                                  onPressed: () {
                                    Get.off(const MainPageView(
                                      initialPage: 0,
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: putih,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Ops! Team anda tereliminasi',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Dengan berat hati kami sampaikan bahwa ide bisnis Anda telah ditolak dan Anda telah tereliminasi dari kompetisi. Keputusan ini diambil dengan alasan ${stage.reason}. Meskipun demikian, kami menghargai partisipasi Anda dalam lomba ini. Terima kasih telah berkontribusi dengan ide bisnis Anda. Kami berharap kesuksesan bagi perjalanan bisnis Anda ke depannya.',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: birubg),
                            onPressed: () {
                              Get.to(MateriView());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                'Ok',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ],
                  );
                } else if ((stage.tahap == '1' ||
                        stage.tahap == '2' ||
                        stage.tahap == '3' ||
                        stage.tahap == '4') &&
                    stage.tahapStatus == 'Expired' &&
                    (stage.docStatus == 'belum_upload' ||
                        stage.docStatus == 'revisi')) {
                  print('logic 6');
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/bg_materi.png'),
                              Positioned(
                                top: 3.h,
                                right: 0.w,
                                child: IconButton(
                                  onPressed: () {
                                    Get.off(const MainPageView(
                                      initialPage: 0,
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: putih,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Ops! Sesi telah berakhir',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Sesi pengunggahan materi telah berakhir. Kami ingin berterima kasih kepada semua peserta yang telah berkontribusi dengan ide bisnis kreatif dan inspiratif. Tim juri telah memulai proses evaluasi. Tetap pantau informasi terbaru unutuk pembaruan mengenai tahapan selanjutnya dan pengumuman hasil lomba. Terima kasih atas partisipasi Anda dalam lomba ide bisnis ini.',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: birubg),
                            onPressed: () {
                              Get.off(MainPageView(
                                initialPage: 0,
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                'Kembali',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ],
                  );
                } else if ((stage.tahap == '2' ||
                        stage.tahap == '3' ||
                        stage.tahap == '4') &&
                    stage.tahapStatus == 'Active' &&
                    stage.docStatus == 'belum_upload') {
                  print('logic 7');
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/bg_materi.png'),
                              Positioned(
                                top: 3.h,
                                right: 0.w,
                                child: IconButton(
                                  onPressed: () {
                                    Get.off(const MainPageView(
                                      initialPage: 0,
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: putih,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Upload Materi',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Pada tahap ini, setiap peserta diwajibkan untuk mengunggah materi bisnis mereka. Mohon pastikan bahwa materi yang diunggah mencakup informasi yang komprehensif mengenai ide bisnis, strategi pemasaran, proyeksi keuangan, dan elemen kunci lainnya. Materi yang lengkap dan berkualitas akan menjadi dasar bagi evaluasi tim juri. Pastikan untuk mengikuti panduan yang telah disediakan untuk memastikan kelengkapan dan kesesuaian materi dengan ketentuan lomba. Semangat dalam menyusun dan mengunggah materi bisnis Anda!.',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: birubg),
                            onPressed: () {
                              Get.to(UploadProposal(teamId: teamId));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                'Lanjutkan',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              } else {
                return const Text('lOADING');
              }
            },
          ),
        ],
      ),
    );
  }
}
