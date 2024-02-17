import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/controller/notification_controller.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class EventView extends StatelessWidget {
  EventView({super.key});
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
          'Event',
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
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(2.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() {
                    if (homeController.eventByTeamId.value.success == true) {
                      if (homeController
                          .eventByTeamId.value.teamEvent!.isEmpty) {
                        return Center();
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              homeController.eventByTeamId.value.teamEventTotal,
                          itemBuilder: (context, index) {
                            var eventByTeamId = homeController
                                .eventByTeamId.value.teamEvent![index];
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: putih,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 5,
                                              spreadRadius: 3,
                                              color: Colors.black12,
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 20.w,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: pembeda,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        eventByTeamId.fotoUrl,
                                                    fit: BoxFit.cover,
                                                  ),
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
                                                    width: 60.w,
                                                    child: Text(
                                                      eventByTeamId.judul,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 11.sp,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    DateFormat('EEE, dd MMM y ',
                                                            'id')
                                                        .format(DateTime.parse(
                                                            eventByTeamId
                                                                .tanggal)),
                                                    style:
                                                        GoogleFonts.poppins(),
                                                  ),
                                                  Text(
                                                    '${eventByTeamId.jamMulai} WIB -${eventByTeamId.jamSelesai} WIB',
                                                    style:
                                                        GoogleFonts.poppins(),
                                                  ),
                                                  SizedBox(
                                                    width: 65.w,
                                                    child: Text(
                                                      eventByTeamId.lokasi,
                                                      maxLines: 2,
                                                      style:
                                                          GoogleFonts.poppins(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await openUrl(
                                                          eventByTeamId.url);
                                                    },
                                                    child: Container(
                                                      height: 3.h,
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                        color: birulangit,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            color:
                                                                Colors.black12,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Kunjungi',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: putih,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          SizedBox(
                                                            height: 2.h,
                                                            child: Image.asset(
                                                                'assets/send.png'),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -4.h,
                                      right: -18.w,
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            45 / 360),
                                        child: Container(
                                          height: 10.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: blue,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                eventByTeamId.status,
                                                style: GoogleFonts.poppins(
                                                  color: putih,
                                                  fontSize: 9.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                      return Container();
                    }
                  }),
                  Obx(() {
                    if (homeController.eventTeamData.value.success == true) {
                      if (homeController
                          .eventTeamData.value.teamEvent!.isEmpty) {
                        return Center();
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              homeController.eventTeamData.value.teamEventTotal,
                          itemBuilder: (context, index) {
                            var eventTeamData = homeController
                                .eventTeamData.value.teamEvent![index];
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: putih,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 5,
                                              spreadRadius: 3,
                                              color: Colors.black12,
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 20.w,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: pembeda,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        eventTeamData.fotoUrl,
                                                    fit: BoxFit.cover,
                                                  ),
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
                                                    width: 60.w,
                                                    child: Text(
                                                      eventTeamData.judul,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 11.sp,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    DateFormat('EEE, dd MMM y ',
                                                            'id')
                                                        .format(DateTime.parse(
                                                            eventTeamData
                                                                .tanggal)),
                                                    style:
                                                        GoogleFonts.poppins(),
                                                  ),
                                                  Text(
                                                    '${eventTeamData.jamMulai} WIB -${eventTeamData.jamSelesai} WIB',
                                                    style:
                                                        GoogleFonts.poppins(),
                                                  ),
                                                  SizedBox(
                                                    width: 65.w,
                                                    child: Text(
                                                      eventTeamData.lokasi,
                                                      maxLines: 2,
                                                      style:
                                                          GoogleFonts.poppins(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await openUrl(
                                                          eventTeamData.url);
                                                    },
                                                    child: Container(
                                                      height: 3.h,
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                        color: birulangit,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            color:
                                                                Colors.black12,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Kunjungi',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: putih,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          SizedBox(
                                                            height: 2.h,
                                                            child: Image.asset(
                                                                'assets/send.png'),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -4.h,
                                      right: -18.w,
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            45 / 360),
                                        child: Container(
                                          height: 10.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: blue,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                eventTeamData.status,
                                                style: GoogleFonts.poppins(
                                                  color: putih,
                                                  fontSize: 9.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                ],
              ),
            ),
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
                                            onTap: () {
                                              // print('oke');
                                              // final notificationId =
                                              //     notification.id;
                                              // notificationController
                                              //     .markNotificationAsRead(
                                              //         notificationId);
                                              // print(notificationId);
                                            },
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

  Future<void> openUrl(String url,
      {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launch(url,
        forceSafariVC: forceWebView, enableJavaScript: enableJavaScript);
  }
}
