import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/controller/notification_controller.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/pengumuman/detail_pengumuman_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

// ignore: must_be_immutable
class PengumumanView extends StatelessWidget {
  PengumumanView({super.key});
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
      appBar: AppBar(
        backgroundColor: putih,
        centerTitle: false,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: hitam,
          ),
        ),
        title: Text(
          'News',
          style: GoogleFonts.poppins(
            color: hitam,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Stack(
              children: [
                IconButton(
                  onPressed: _toggleDialog,
                  icon: Icon(
                    Icons.notifications,
                    color: hitam,
                    size: 35,
                  ),
                ),
                Obx(
                  () => notifikasiController.notifications.value.notifTotal == 0
                      ? Container()
                      : Positioned(
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
                                notifikasiController
                                    .notifications.value.notifTotal
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 8.sp, color: putih),
                              ),
                            ),
                          ),
                        ),
                )
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              if (homeController.newsPeserta.value.success == true) {
                if (homeController.newsPeserta.value.news!.isEmpty) {
                  return const Center(
                    child: Text('Data Kosong'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: homeController.newsPeserta.value.news!.length,
                    itemBuilder: (context, index) {
                      var pengumuman =
                          homeController.newsPeserta.value.news![index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: abuabu,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Hero(
                                          tag: pengumuman.foto,
                                          child: Container(
                                            width: 25.w,
                                            height: 25.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(22),
                                                  topRight: Radius.circular(22),
                                                ),
                                                border: Border.all(
                                                    width: 0.5.w,
                                                    color: Colors.black12)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(22),
                                                topRight: Radius.circular(22),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: pengumuman.fotoUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          width: 25.w,
                                          child: Center(
                                            child: Text(
                                              DateFormat('dd MMM y', 'id')
                                                  .format(DateTime.parse(
                                                      pengumuman.createdAt)),
                                              style: GoogleFonts.poppins(
                                                fontSize: 8.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          pengumuman.judul,
                                          maxLines: 2,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          parseHtmlString(pengumuman.desc),
                                          maxLines: 3,
                                          style: GoogleFonts.poppins(
                                            fontSize: 8.sp,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              DetailPengumumanView(
                                                id: pengumuman.id.toString(),
                                              ),
                                              arguments: homeController
                                                  .fetchDataPengumumanDetail(
                                                      pengumuman.id
                                                          .toString()));
                                          print(pengumuman.id);
                                        },
                                        child: Container(
                                          width: 50.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            color: birulangit,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Detail',
                                              style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
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
                  ),
                );
              }
            }),
          ),
          Obx(() {
            if (_isDialogVisible.value) {
              return GestureDetector(
                onTap: _toggleDialog,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        width: 80.w,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.normal,
                                color: Colors.black12,
                                spreadRadius: 3,
                                blurRadius: 5,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                            color: Colors.white),
                        child: notifikasiController
                                .notifications.value.notifications!.isEmpty
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                        TextButton(
                                          onPressed: () async {
                                            await notifikasiController
                                                .tandaiDiBacaSemua();
                                          },
                                          child: Text(
                                            'Tandai Dibaca Semua',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              color: '3b8382'.toColor(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black12,
                                    height: 1,
                                  ),
                                  // ignore: unnecessary_null_comparison
                                ],
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                        TextButton(
                                            onPressed: () async {
                                              await notifikasiController
                                                  .tandaiDiBacaSemua();
                                            },
                                            child: Text(
                                              'Tandai Dibaca Semua',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black12,
                                    height: 1,
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                    child: Obx(
                                      () => ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: notifikasiController
                                            .notifications.value.notifTotal,
                                        itemBuilder: (context, index) {
                                          final notification =
                                              notifikasiController.notifications
                                                  .value.notifications![index];
                                          return InkWell(
                                            onTap: () async {},
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SizedBox(
                                                          width: 5.h,
                                                          height: 5.h,
                                                          child: Image.asset(
                                                              'assets/notification.png'),
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            DateFormat(
                                                                    'EEE d MMM y')
                                                                .format(DateTime.parse(
                                                                    notification
                                                                        .createdAt)),
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 60.w,
                                                            child: Text(
                                                              notification
                                                                  .message,
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.black12,
                                                  height: 1,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }

  String parseHtmlString(String htmlString) {
    // Manipulasi teks HTML di sini
    // Contoh: Hilangkan tag HTML menggunakan RegExp
    String parsedText = htmlString.replaceAll(RegExp(r'<[^>]*>'), '');

    // Batasi panjang teks jika melebihi batas tertentu
    if (parsedText.length > 80) {
      parsedText = '${parsedText.substring(0, 80)}...';
    }

    return parsedText;
  }
}
