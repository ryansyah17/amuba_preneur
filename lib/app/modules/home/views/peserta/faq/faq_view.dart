import 'package:entrepreneur_app/app/controller/notification_controller.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

// ignore: must_be_immutable
class FaqView extends StatelessWidget {
  FaqView({super.key});
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
          'FAQ',
          style: GoogleFonts.poppins(
            color: hitam,
          ),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 90.h,
                    child: Obx(() {
                      if (homeController.faqData.value.success == true) {
                        if (homeController.faqData.value.faqs!.isEmpty) {
                          return Center(
                            child: Text(
                              'Tidak Ada Data',
                              style: GoogleFonts.poppins(),
                            ),
                          );
                        } else {
                          return RefreshIndicator(
                            onRefresh: () async {
                              await homeController.fetchFaqData();
                            },
                            child: ListView.builder(
                              itemCount:
                                  homeController.faqData.value.faqs!.length,
                              itemBuilder: (context, index) {
                                var faqData =
                                    homeController.faqData.value.faqs![index];
                                return Column(
                                  children: [
                                    ExpansionTile(
                                      iconColor: '3b8382'.toColor(),
                                      textColor: '3b8382'.toColor(),
                                      title: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                                offset: Offset(0, 0),
                                                blurStyle: BlurStyle.normal),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    100,
                                                child: Text(
                                                  faqData.question,
                                                  style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Html(
                                            data:
                                                """<p style='color: black; font-size: 12px; font-family: ${GoogleFonts.poppins().fontFamily};'>${faqData.answer}</p>"""
                                                "",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
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
                                            // notificationController
                                            //     .markAllNotificationsAsRead();
                                            // notificationController.notifications
                                            //     .clear();
                                            // await notificationController
                                            //     .fetchNotifications();
                                            // notificationController
                                            //     .update(['total_notif']);
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
                                            onPressed: () {
                                              // notificationController
                                              //     .markAllNotificationsAsRead();
                                              // notificationController
                                              //     .notifications
                                              //     .clear();
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
                                  SizedBox( height: 30.h,
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
