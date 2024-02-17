import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/controller/notification_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/unregister_dokumen.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/pengumuman/detail_pengumuman_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/dokumen_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/event/event_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/faq/faq_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/laporan/laporan_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/modal/modal_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/peminat/peminat.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/pengumuman/pengumuman_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/usaha_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/home_select_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

import '../../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final authContrller = Get.find<AuthController>();
  int? selectedPage;
  PageController pageController = PageController(initialPage: 0);
  HomeView({Key? key}) : super(key: key);
  RxBool isLoading = true.obs;
  final HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.put(AuthController());
  final NotificationController notifikasiController =
      Get.put(NotificationController());

  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );
  RxBool _isDialogVisible = false.obs;
  void _toggleDialog() {
    _isDialogVisible.toggle();
  }

  var _current = 0.obs;
  final CarouselController _carouselSlider = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: putih,
        elevation: 1,
        title: SizedBox(
          width: 40.w,
          child: Image.asset(
            'assets/logo_appbar.png',
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
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
                  () => notifikasiController.notifications.value.notifTotal ==
                          null
                      ? Container()
                      : notifikasiController.notifications.value.notifTotal == 0
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
          Obx(
            () {
              if (homeController.informasiUsaha.value.success == true) {
                var informasiUsaha = homeController.informasiUsaha.value.team;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32.h,
                        child: Stack(
                          children: [
                            Container(
                              height: 26.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: pembeda,
                              ),
                              child: Stack(
                                children: [
                                  Obx(
                                    () {
                                      if (homeController
                                              .bannerData.value.success ==
                                          true) {
                                        if (homeController.bannerData.value
                                            .banners!.isEmpty) {
                                          return Container(
                                            height: 26.h,
                                            child: const Center(
                                              child: Text('Kosong'),
                                            ),
                                          );
                                        } else {
                                          return CarouselSlider.builder(
                                            itemCount: homeController
                                                .bannerData.value.bannersTotal,
                                            itemBuilder:
                                                (context, index, realIndex) {
                                              final banner = homeController
                                                  .bannerData
                                                  .value
                                                  .banners![index];
                                              return GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          height: 18.h,
                                                          width: 100.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Center(
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: banner
                                                                  .photoUrl,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width, // Mengisi lebar layar
                                                  child: CachedNetworkImage(
                                                    imageUrl: banner.photoUrl,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              );
                                            },
                                            options: CarouselOptions(
                                              height: 26.h,
                                              autoPlay: true,
                                              viewportFraction: 1.2,
                                              onPageChanged: (index, reason) {
                                                _current.value = index;
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
                                    },
                                  ),
                                  homeController.bannerData.value.banners !=
                                          null
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                            top: 15.h,
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: homeController
                                                  .bannerData.value.banners!
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                return GestureDetector(
                                                  onTap: () => _carouselSlider
                                                      .animateToPage(entry.key),
                                                  child: Container(
                                                    width: 7.0,
                                                    height: 7.0,
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 4.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: (Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors.white
                                                              : Colors.black)
                                                          .withOpacity(
                                                        _current == entry.key
                                                            ? 1
                                                            : 0.5,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 22.h, left: 4.w, right: 4.w),
                              child: Container(
                                height: 8.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: putih,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 15.w,
                                        height: 15.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                            imageUrl: informasiUsaha!.logoUrl,
                                            fit: BoxFit.cover,
                                          ),
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
                                            informasiUsaha.nama,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              informasiUsaha.status == 'approve'
                                                  ? Container(
                                                      width: 3.w,
                                                      height: 3.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: birulangit,
                                                      ),
                                                    )
                                                  : informasiUsaha.status ==
                                                          'request'
                                                      ? Container(
                                                          width: 3.w,
                                                          height: 3.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                        )
                                                      : informasiUsaha.status ==
                                                              'reject'
                                                          ? Container(
                                                              width: 3.w,
                                                              height: 3.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            )
                                                          : Container(),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Obx(() {
                                                if (homeController.stageData
                                                        .value.success ==
                                                    true) {
                                                  if (homeController
                                                          .stageData
                                                          .value
                                                          .stageSchedule!
                                                          .docStatus !=
                                                      'reject') {
                                                    var stage = homeController
                                                        .stageData
                                                        .value
                                                        .stageSchedule;
                                                    if (stage!.tahap == '1') {
                                                      return Text(
                                                        'Stage 1',
                                                        style: GoogleFonts
                                                            .poppins(),
                                                      );
                                                    } else if (stage.tahap ==
                                                        '2') {
                                                      return Text(
                                                        'Stage 2',
                                                        style: GoogleFonts
                                                            .poppins(),
                                                      );
                                                    } else if (stage.tahap ==
                                                        '3') {
                                                      return Text(
                                                        'Stage 3',
                                                        style: GoogleFonts
                                                            .poppins(),
                                                      );
                                                    } else {
                                                      return Text(
                                                        'Stage 4',
                                                        style: GoogleFonts
                                                            .poppins(),
                                                      );
                                                    }
                                                  } else {
                                                    return Text(
                                                      'Tereleminasi',
                                                      style:
                                                          GoogleFonts.poppins(),
                                                    );
                                                  }
                                                } else {
                                                  return Container();
                                                }
                                              })
                                            ],
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                        ),
                        child: Obx(() {
                          if (homeController.stageData.value.success == true) {
                            var stage =
                                homeController.stageData.value.stageSchedule;
                            if (stage!.tahapStatus == 'Upcoming') {
                              return Container();
                            } else if (stage.tahapStatus == 'Active' &&
                                stage.docStatus == 'belum_upload' &&
                                stage.tahap == '1') {
                              return Container(
                                height: 15.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: putih,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 6.h,
                                            child: Image.asset(
                                                'assets/upload-file.png'),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                            width: 60.w,
                                            child: Text(
                                              'Yuk, Upload Materi Sekarang sebelum sesi berakhir!',
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 11.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: birulangit),
                                            onPressed: () {
                                              Get.off(
                                                DokumenView(
                                                  teamId: informasiUsaha.id
                                                      .toString(),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4.w,
                                              ),
                                              child: Text(
                                                'Upload',
                                                style: GoogleFonts.poppins(
                                                  color: putih,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else if ((stage.tahap == '1' ||
                                    stage.tahap == '2' ||
                                    stage.tahap == '3' ||
                                    stage.tahap == '4') &&
                                (stage.tahapStatus == 'Active' ||
                                    stage.tahapStatus == 'Expired') &&
                                (stage.docStatus == 'request' ||
                                    stage.docStatus == 'approve')) {
                              return Container();
                            } else if ((stage.tahap == '1' ||
                                    stage.tahap == '2' ||
                                    stage.tahap == '3' ||
                                    stage.tahap == '4') &&
                                stage.tahapStatus == 'Active' &&
                                stage.docStatus == 'revisi') {
                              return Container(
                                height: 15.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: putih,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 6.h,
                                            child: Image.asset(
                                                'assets/upload-file.png'),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                            width: 60.w,
                                            child: Text(
                                              'Yuk, Revisi Materi Sekarang sebelum sesi berakhir!',
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 11.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: birulangit),
                                            onPressed: () {
                                              Get.to(
                                                DokumenView(
                                                  teamId: informasiUsaha.id
                                                      .toString(),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4.w,
                                              ),
                                              child: Text(
                                                'Upload',
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
                                ),
                              );
                            } else if ((stage.tahap == '1' ||
                                    stage.tahap == '2' ||
                                    stage.tahap == '3' ||
                                    stage.tahap == '4') &&
                                (stage.tahapStatus == 'Active' ||
                                    stage.tahapStatus == 'Expired') &&
                                stage.docStatus == 'reject') {
                              return Container();
                            } else if ((stage.tahap == '1' ||
                                    stage.tahap == '2' ||
                                    stage.tahap == '3' ||
                                    stage.tahap == '4') &&
                                stage.tahapStatus == 'Expired' &&
                                (stage.docStatus == 'belum_upload' ||
                                    stage.docStatus == 'revisi')) {
                              return Container();
                            } else if ((stage.tahap == '2' ||
                                    stage.tahap == '3' ||
                                    stage.tahap == '4') &&
                                stage.tahapStatus == 'Active' &&
                                stage.docStatus == 'belum_upload') {
                              return Container(
                                height: 15.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: putih,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 6.h,
                                            child: Image.asset(
                                                'assets/upload-file.png'),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                            width: 60.w,
                                            child: Text(
                                              'Yuk, Upload Materi Sekarang sebelum sesi berakhir!',
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: birulangit),
                                            onPressed: () {
                                              Get.to(
                                                DokumenView(
                                                  teamId: informasiUsaha.id
                                                      .toString(),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4.w,
                                              ),
                                              child: Text(
                                                'Upload',
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
                                ),
                              );
                            } else {
                              return Text('');
                            }
                          } else {
                            return Container();
                          }
                        }),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(UsahaView());
                              },
                              child: const SelectMenuHome(
                                imageUrl: 'assets/shop.png',
                                title: 'My Team',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  PeminatView(),
                                );
                              },
                              child: const SelectMenuHome(
                                imageUrl: 'assets/team (1).png',
                                title: 'Peminat',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(ModalView());
                              },
                              child: const SelectMenuHome(
                                imageUrl: 'assets/investment.png',
                                title: 'Modal',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(LaporanView());
                              },
                              child: const SelectMenuHome(
                                imageUrl: 'assets/finance.png',
                                title: 'Laporan',
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(EventView());
                              },
                              child: const SelectMenuHome(
                                imageUrl: 'assets/pin.png',
                                title: 'Event',
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (informasiUsaha.status == 'draft') {
                                  return Get.to(
                                    const UnregisterDokumen(),
                                  );
                                } else {
                                  homeController.showLoading();
                                  await Future.delayed(Duration(seconds: 2));
                                  homeController.hideLoading();
                                  Get.to(
                                    DokumenView(
                                      teamId: informasiUsaha.id.toString(),
                                    ),
                                  );

                                  print(informasiUsaha.id);
                                }
                              },
                              child: const SelectMenuHome(
                                imageUrl: 'assets/upload-file.png',
                                title: 'Materi',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(FaqView());
                              },
                              child: const SelectMenuHome(
                                imageUrl: 'assets/faq.png',
                                title: 'FAQ',
                              ),
                            ),
                            Container(
                              height: 18.w,
                              width: 18.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        height: 17.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: birulangit,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Event Sponsored by',
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: putih,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SizedBox(
                                height: 10.h,
                                child: Obx(() {
                                  if (homeController.sponsorDanMediaPartner
                                          .value.success ==
                                      true) {
                                    if (homeController.sponsorDanMediaPartner
                                        .value.sponsors!.isEmpty) {
                                      return Center(
                                        child: Text(
                                          'Tidak Ada Sponsor',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: homeController
                                            .sponsorDanMediaPartner
                                            .value
                                            .sponsors!
                                            .length,
                                        itemBuilder: (context, index) {
                                          var sponsor = homeController
                                              .sponsorDanMediaPartner
                                              .value
                                              .sponsors![index];
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 1.5.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          height: 26.h,
                                                          width: 100.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 22.h,
                                                                width: 22.h,
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl: sponsor
                                                                      .logoUrl,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              Text(
                                                                sponsor.nama,
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 16.w,
                                                  height: 16.w,
                                                  decoration: BoxDecoration(
                                                    color: putih,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.black87,
                                                        blurRadius: 3,
                                                      )
                                                    ],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    child: CachedNetworkImage(
                                                      imageUrl: sponsor.logoUrl,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1.w,
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
                                        size: 30,
                                      ),
                                    );
                                  }
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            Text(
                              'News',
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(PengumumanView());
                              },
                              child: Text(
                                'See All',
                                style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
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
                          children: [
                            SizedBox(
                              child: Obx(
                                () {
                                  if (homeController
                                          .newsPeserta.value.success ==
                                      true) {
                                    if (homeController
                                        .newsPeserta.value.news!.isEmpty) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                          child: Text(
                                            'Tidak Ada Pengumuman',
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      );
                                    } else {
                                      int itemCount = homeController
                                          .newsPeserta.value.news!.length;
                                      int maxItemCount = 3;
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: itemCount > maxItemCount
                                            ? maxItemCount
                                            : itemCount,
                                        itemBuilder: (context, index) {
                                          var pengumuman = homeController
                                              .newsPeserta.value.news![index];
                                          return Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      DetailPengumumanView(
                                                        id: pengumuman.id
                                                            .toString(),
                                                      ),
                                                      arguments: homeController
                                                          .fetchDataPengumumanDetail(
                                                              pengumuman.id
                                                                  .toString()));
                                                },
                                                child: Container(
                                                  height: 12.h,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: putih,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.black87,
                                                        blurRadius: 3,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.w,
                                                            vertical: 1.h),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 60.w,
                                                              child: Text(
                                                                pengumuman
                                                                    .judul,
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: hitam,
                                                                  fontSize:
                                                                      11.sp,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 60.w,
                                                              child: Text(
                                                                parseHtmlString(
                                                                    pengumuman
                                                                        .desc),
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: hitam,
                                                                  fontSize:
                                                                      9.sp,
                                                                ),
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        SizedBox(
                                                          width: 20.w,
                                                          child: Text(
                                                            DateFormat(
                                                                    'EEEE,\ndd MMM y',
                                                                    'id')
                                                                .format(DateTime
                                                                    .parse(pengumuman
                                                                        .createdAt)),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 9.sp,
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 85,
                      ),
                    ],
                  ),
                );
              } else {
                if (homeController.informasiUsaha.value.team == null) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32.h,
                          child: Stack(
                            children: [
                              Container(
                                height: 26.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: pembeda,
                                ),
                                child: Stack(
                                  children: [
                                    Obx(
                                      () {
                                        if (homeController
                                                .bannerData.value.success ==
                                            true) {
                                          if (homeController.bannerData.value
                                              .banners!.isEmpty) {
                                            return Container(
                                              height: 26.h,
                                              child: const Center(
                                                child: Text('Kosong'),
                                              ),
                                            );
                                          } else {
                                            return CarouselSlider.builder(
                                              itemCount: homeController
                                                  .bannerData
                                                  .value
                                                  .bannersTotal,
                                              itemBuilder:
                                                  (context, index, realIndex) {
                                                final banner = homeController
                                                    .bannerData
                                                    .value
                                                    .banners![index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          content: Container(
                                                            height: 50.h,
                                                            width: 100.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: Center(
                                                              child: CachedNetworkImage(
                                                                  imageUrl: banner
                                                                      .photoUrl),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    width: MediaQuery.of(
                                                            context)
                                                        .size
                                                        .width, // Mengisi lebar layar
                                                    child: CachedNetworkImage(
                                                      imageUrl: banner.photoUrl,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                );
                                              },
                                              options: CarouselOptions(
                                                height: 26.h,
                                                autoPlay: true,
                                                viewportFraction: 1.2,
                                                onPageChanged: (index, reason) {
                                                  _current.value = index;
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
                                      },
                                    ),
                                    homeController.bannerData.value.banners !=
                                            null
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                              top: 15.h,
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: homeController
                                                    .bannerData.value.banners!
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                  return GestureDetector(
                                                    onTap: () => _carouselSlider
                                                        .animateToPage(
                                                            entry.key),
                                                    child: Container(
                                                      width: 7.0,
                                                      height: 7.0,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 4.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: (Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white
                                                                : Colors.black)
                                                            .withOpacity(
                                                          _current == entry.key
                                                              ? 1
                                                              : 0.5,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 22.h, left: 4.w, right: 4.w),
                                child: Container(
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: putih,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ProfilePicture(
                                          name: authContrller.user.value.name!,
                                          radius: 25,
                                          fontsize: 30,
                                          count: 2,
                                          random: false,
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
                                              authContrller.user.value.name!,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 3.w,
                                                  width: 3.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                  'Belum Memiliki Team',
                                                  style: GoogleFonts.poppins(),
                                                )
                                              ],
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(UsahaView());
                                },
                                child: const SelectMenuHome(
                                  imageUrl: 'assets/shop.png',
                                  title: 'My Team',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const UnregisterDokumen(),
                                  );
                                },
                                child: const SelectMenuHome(
                                  imageUrl: 'assets/team (1).png',
                                  title: 'Peminat',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const UnregisterDokumen(),
                                  );
                                },
                                child: const SelectMenuHome(
                                  imageUrl: 'assets/investment.png',
                                  title: 'Modal',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const UnregisterDokumen(),
                                  );
                                },
                                child: const SelectMenuHome(
                                  imageUrl: 'assets/finance.png',
                                  title: 'Laporan',
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(EventView());
                                },
                                child: const SelectMenuHome(
                                  imageUrl: 'assets/pin.png',
                                  title: 'Event',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const UnregisterDokumen(),
                                  );
                                },
                                child: const SelectMenuHome(
                                  imageUrl: 'assets/upload-file.png',
                                  title: 'Materi',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(FaqView());
                                },
                                child: const SelectMenuHome(
                                  imageUrl: 'assets/faq.png',
                                  title: 'FAQ',
                                ),
                              ),
                              Container(
                                height: 18.w,
                                width: 18.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          height: 17.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: birulangit,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Event Sponsored by',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: putih,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SizedBox(
                                  height: 10.h,
                                  child: Obx(
                                    () {
                                      if (homeController.sponsorDanMediaPartner
                                              .value.success ==
                                          true) {
                                        if (homeController
                                            .sponsorDanMediaPartner
                                            .value
                                            .sponsors!
                                            .isEmpty) {
                                          return Center(
                                            child: Text(
                                              'Tidak Ada Sponsor',
                                              style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: homeController
                                                .sponsorDanMediaPartner
                                                .value
                                                .sponsors!
                                                .length,
                                            itemBuilder: (context, index) {
                                              var sponsor = homeController
                                                  .sponsorDanMediaPartner
                                                  .value
                                                  .sponsors![index];
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 1.5.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            content: Container(
                                                              height: 26.h,
                                                              width: 100.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        22.h,
                                                                    width: 22.h,
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl:
                                                                          sponsor
                                                                              .logoUrl,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 1.h,
                                                                  ),
                                                                  Text(
                                                                    sponsor
                                                                        .nama,
                                                                    style: GoogleFonts.poppins(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 16.w,
                                                      height: 16.w,
                                                      decoration: BoxDecoration(
                                                        color: putih,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black87,
                                                            blurRadius: 3,
                                                          ),
                                                        ],
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              sponsor.logoUrl,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
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
                                            size: 30,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            children: [
                              Text(
                                'News',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(PengumumanView());
                                },
                                child: Text(
                                  'See All',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
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
                            children: [
                              SizedBox(
                                child: Obx(
                                  () {
                                    if (homeController
                                            .newsPeserta.value.success ==
                                        true) {
                                      if (homeController
                                          .newsPeserta.value.news!.isEmpty) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                            child: Text(
                                              'Tidak Ada Pengumuman',
                                              style: GoogleFonts.poppins(),
                                            ),
                                          ),
                                        );
                                      } else {
                                        int itemCount = homeController
                                            .newsPeserta.value.news!.length;
                                        int maxItemCount = 3;
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: itemCount > maxItemCount
                                              ? maxItemCount
                                              : itemCount,
                                          itemBuilder: (context, index) {
                                            var pengumuman = homeController
                                                .newsPeserta.value.news![index];
                                            return Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                        DetailPengumumanView(
                                                          id: pengumuman.id
                                                              .toString(),
                                                        ),
                                                        arguments: homeController
                                                            .fetchDataPengumumanDetail(
                                                                pengumuman.id
                                                                    .toString()));
                                                  },
                                                  child: Container(
                                                    height: 12.h,
                                                    width: 100.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: putih,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Colors.black87,
                                                          blurRadius: 3,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.w,
                                                              vertical: 1.h),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                width: 60.w,
                                                                child: Text(
                                                                  pengumuman
                                                                      .judul,
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color:
                                                                        hitam,
                                                                    fontSize:
                                                                        11.sp,
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 60.w,
                                                                child: Text(
                                                                  parseHtmlString(
                                                                      pengumuman
                                                                          .desc),
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    color:
                                                                        hitam,
                                                                    fontSize:
                                                                        9.sp,
                                                                  ),
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          SizedBox(
                                                            width: 20.w,
                                                            child: Text(
                                                              DateFormat(
                                                                      'EEEE,\ndd MMM y',
                                                                      'id')
                                                                  .format(DateTime.parse(
                                                                      pengumuman
                                                                          .createdAt)),
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 9.sp,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 85,
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
              }
            },
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
                                          ),
                                        ),
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

  String parseHtmlString(String htmlString) {
    // Manipulasi teks HTML di sini
    // Contoh: Hilangkan tag HTML menggunakan RegExp
    String parsedText = htmlString.replaceAll(RegExp(r'<[^>]*>'), '');

    // Batasi panjang teks jika melebihi batas tertentu
    if (parsedText.length > 80) {
      parsedText = parsedText.substring(0, 80) + '...';
    }

    return parsedText;
  }
}
