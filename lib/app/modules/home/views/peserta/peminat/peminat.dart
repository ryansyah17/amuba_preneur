import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/controller/notification_controller.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/peminat/peminat_detail.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

// ignore: must_be_immutable
class PeminatView extends StatelessWidget {
  PeminatView({
    super.key,
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
          'Peminat',
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
                                  fontSize: 8.sp,
                                  color: putih,
                                ),
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
            padding: EdgeInsets.all(4.w),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  if (homeController.peminatRequest.value.success == true) {
                    if (homeController
                        .peminatRequest.value.teamPeminatRequest!.isEmpty) {
                      return Container();
                    } else {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeController
                            .peminatRequest.value.teamPeminatRequestTotal,
                        itemBuilder: (context, index) {
                          var peminatRequest = homeController
                              .peminatRequest.value.teamPeminatRequest![index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      PeminatDetailPage(
                                        id: peminatRequest.investorId,
                                      ),
                                      arguments: homeController
                                          .fetchPeminatTeamDetail(int.parse(
                                              peminatRequest.investorId)));
                                },
                                child: Container(
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: pembeda,
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 15.w,
                                              height: 15.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: mainColor,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: CachedNetworkImage(
                                                    imageUrl: peminatRequest
                                                        .investorFotoUrl,
                                                    fit: BoxFit.cover),
                                              ),
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
                                                  width: 30.w,
                                                  child: Text(
                                                    peminatRequest.investorNama,
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: putih,
                                                      fontSize: 11.sp,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  peminatRequest
                                                      .investorPekerjaan,
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 9.sp,
                                                    color: putih,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 4.h,
                                              child: GestureDetector(
                                                onTap: () async {
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
                                                                        BorderRadius
                                                                            .circular(5),
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
                                                                          Colors
                                                                              .red),
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.w),
                                                                    child: Text(
                                                                      'Batal',
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          backgroundColor:
                                                                              birulangit),
                                                                  onPressed:
                                                                      () async {
                                                                    Get.back();
                                                                    await homeController
                                                                        .tolakPeminat(
                                                                            peminatRequest.id);
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.w),
                                                                    child: Text(
                                                                      'Tolak',
                                                                      style: GoogleFonts.poppins(
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
                                                child: Image.asset(
                                                  'assets/button.png',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                              child: GestureDetector(
                                                onTap: () async {
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
                                                                        BorderRadius
                                                                            .circular(5),
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
                                                                          Colors
                                                                              .red),
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.w),
                                                                    child: Text(
                                                                      'Batal',
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          backgroundColor:
                                                                              birulangit),
                                                                  onPressed:
                                                                      () async {
                                                                    Get.back();
                                                                    await homeController
                                                                        .terimaPeminat(
                                                                            peminatRequest.id);
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.w),
                                                                    child: Text(
                                                                      'Terima',
                                                                      style: GoogleFonts.poppins(
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
                                                child: Image.asset(
                                                    'assets/checklist.png'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              )
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    return Container();
                  }
                }),
                Text(
                  'Daftar Peminat',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(() {
                  if (homeController.peminatApprove.value.success == true) {
                    if (homeController
                        .peminatApprove.value.teamPeminatApprove!.isEmpty) {
                      return Center(
                        child: SizedBox(
                          height: 80.h,
                          width: 70.w,
                          child: Image.asset('assets/noData.png'),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: homeController
                            .peminatApprove.value.teamPeminatApproveTotal,
                        itemBuilder: (context, index) {
                          var peminatApprove = homeController
                              .peminatApprove.value.teamPeminatApprove![index];
                          return Column(
                            children: [
                              Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: pembeda,
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 15.w,
                                        height: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: mainColor,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                              imageUrl: peminatApprove
                                                  .investorFotoUrl),
                                        ),
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
                                          Text(
                                            peminatApprove.investorNama,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.sp,
                                            ),
                                          ),
                                          Text(
                                            peminatApprove.investorPekerjaan,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 4.h,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                PeminatDetailPage(
                                                  id: peminatApprove.investorId,
                                                ),
                                                arguments: homeController
                                                    .fetchPeminatTeamDetail(
                                                        int.parse(peminatApprove
                                                            .investorId)));
                                          },
                                          child: Image.asset(
                                              'assets/search-file.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                        child: GestureDetector(
                                          onTap: () async {
                                            showModalBottomSheet(
                                              context: context,
                                              isDismissible: false,
                                              useSafeArea: true,
                                              builder: (context) {
                                                return SizedBox(
                                                  height: 15.h,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: 1.h),
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: hitam,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        'Apakah anda yakin ?',
                                                        style:
                                                            GoogleFonts.poppins(
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
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red),
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10.w),
                                                              child: Text(
                                                                'Batal',
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        birulangit),
                                                            onPressed:
                                                                () async {
                                                              Get.back();
                                                              await homeController
                                                                  .deletePeminatApprove(
                                                                      peminatApprove
                                                                          .id);
                                                            },
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10.w),
                                                              child: Text(
                                                                'Hapus',
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
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
                                          child:
                                              Image.asset('assets/delete.png'),
                                        ),
                                      ),
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
                      child: SizedBox(
                        height: 80.h,
                        width: 70.w,
                        child: Image.asset('assets/noData.png'),
                      ),
                    );
                  }
                }),
              ],
            )),
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
}
