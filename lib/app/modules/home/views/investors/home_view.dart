import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/controller/notification_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/investors/available_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/investors/register_investor.dart';
import 'package:entrepreneur_app/app/modules/home/views/investors/pengumuman_investor/detail_pengumuman_investors.dart';
import 'package:entrepreneur_app/app/modules/home/views/investors/pengumuman_investor/pengumuman_investors.dart';
import 'package:entrepreneur_app/app/modules/team_list/controllers/team_list_controller.dart';
import 'package:entrepreneur_app/app/modules/team_list/views/detail_team_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/widget_unregisted_team_detail.dart';
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
class HomeViewInvestors extends GetView<HomeController> {
  final authContrller = Get.find<AuthController>();
  int? selectedPage;
  PageController pageController = PageController(initialPage: 0);
  HomeViewInvestors({Key? key}) : super(key: key);

  RxBool isLoading = true.obs;
  final HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.put(AuthController());
  final TeamListController teamListController = Get.put(TeamListController());
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
  final List<Color> colors = [
    const Color(0xFFF5A44D),
    const Color(0xFF8D74B1),
    const Color(0xFF65B4CE),
  ];

  Color getRandomColor() {
    Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

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
          SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => SizedBox(
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
                              Obx(() {
                                if (homeController.bannerData.value.success ==
                                    true) {
                                  if (homeController
                                      .bannerData.value.banners!.isEmpty) {
                                    return Container(
                                      height: 26.h,
                                    );
                                  } else {
                                    return CarouselSlider.builder(
                                      itemCount: homeController
                                          .bannerData.value.bannersTotal,
                                      itemBuilder: (context, index, realIndex) {
                                        final banner = homeController
                                            .bannerData.value.banners![index];
                                        return SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width, // Mengisi lebar layar
                                          child: Image.network(
                                            banner.photoUrl,
                                            fit: BoxFit.fill,
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
                              }),
                              homeController.bannerData.value.banners != null
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 8.0,
                                                  horizontal: 4.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
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
                          padding:
                              EdgeInsets.only(top: 22.h, left: 4.w, right: 4.w),
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
                                child: Obx(() {
                                  if (homeController
                                          .pemodalData.value.success ==
                                      true) {
                                    if (homeController
                                            .pemodalData.value.investor ==
                                        null) {
                                      return Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(VerifikasiInvestor());
                                          },
                                          child: Container(
                                            height: 5.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                              color: birulangit,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Register Investor',
                                                style: GoogleFonts.poppins(
                                                  color: putih,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      var pemodal = homeController
                                          .pemodalData.value.investor;
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ProfilePicture(
                                            name: pemodal!.nama,
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
                                                pemodal.nama,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 3.w,
                                                    height: 3.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: pemodal.status ==
                                                                'approve'
                                                            ? birulangit
                                                            : pemodal.status ==
                                                                    'reject'
                                                                ? Colors.red
                                                                : putih),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Text(
                                                    pemodal.status
                                                        .toUpperCase(),
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    }
                                  } else {
                                    return Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(VerifikasiInvestor());
                                        },
                                        child: Container(
                                          height: 5.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            color: birulangit,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Register Investor',
                                              style: GoogleFonts.poppins(
                                                color: putih,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                })

                                //
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //popular team
                      Row(
                        children: [
                          Text(
                            'Popular Team',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 20.h,
                        child: Obx(
                          () {
                            if (homeController.teamPopular.value.success ==
                                true) {
                              if (homeController
                                  .teamPopular.value.team!.isEmpty) {
                                return Center(
                                  child: Container(
                                    height: 20.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black12),
                                      borderRadius: BorderRadius.circular(5),
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('assets/noData.png'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: homeController
                                        .teamPopular.value.team!.length,
                                    itemBuilder: (context, index) {
                                      var timPopular = homeController
                                          .teamPopular.value.team![index];
                                      return Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              homeController.pemodalData.value
                                                              .success ==
                                                          true &&
                                                      homeController.pemodalData
                                                              .value.investor !=
                                                          null
                                                  ? Get.to(
                                                      DetailTeamView(
                                                        id: timPopular.id
                                                            .toString(),
                                                        statusPeminat:
                                                            timPopular
                                                                .statusPeminat,
                                                      ),
                                                      arguments: teamListController
                                                          .fetchTeamListDetail(
                                                              timPopular.id),
                                                    )
                                                  : Get.to(UnregistedWidget());
                                            },
                                            child: Container(
                                              height: 20.h,
                                              width: 75.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: getRandomColor(),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5,
                                                    color: abu,
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w,
                                                    vertical: 1.h),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 20.w,
                                                          height: 20.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: pink,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  timPopular
                                                                      .logoUrl,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 40.w,
                                                              child: Text(
                                                                timPopular.nama,
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: putih,
                                                                ),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 40.w,
                                                              child: Text(
                                                                timPopular
                                                                    .sektorUsaha,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontSize:
                                                                      9.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: putih,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 1.h,
                                                            ),
                                                            Text(
                                                              '${timPopular.totalAnggota} Anggota',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: putih,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        timPopular.watchlist ==
                                                                'no'
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  homeController
                                                                      .watchlistPost(
                                                                          timPopular
                                                                              .id);
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .favorite_border_outlined,
                                                                  color: hitam,
                                                                  size: 30,
                                                                ),
                                                              )
                                                            : timPopular.watchlist ==
                                                                    'yes'
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      homeController
                                                                          .watchlistDelete(
                                                                              timPopular.id);
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .favorite,
                                                                      color: Colors
                                                                          .red,
                                                                      size: 30,
                                                                    ),
                                                                  )
                                                                : Container()
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Target Modal',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: putih,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Text(
                                                          NumberFormat.currency(
                                                            locale: 'id-ID',
                                                            decimalDigits: 0,
                                                            symbol: 'Rp',
                                                          ).format(int.parse(
                                                              timPopular
                                                                  .targetModal)),
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 10.sp,
                                                            color: putih,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Modal Terkumpul',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: putih,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Text(
                                                          NumberFormat.currency(
                                                            locale: 'id-ID',
                                                            decimalDigits: 0,
                                                            symbol: 'Rp',
                                                          ).format(int.parse(
                                                              timPopular
                                                                  .terkumpul)),
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 10.sp,
                                                            color: putih,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Capaian',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: putih,
                                                            fontSize: 10.sp,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          height: 4,
                                                          width: 50.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: putih,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: double.parse(
                                                                        timPopular
                                                                            .persentase) *
                                                                    0.5.w,
                                                                height: 4,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
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
                                  size: 35,
                                ),
                              );
                            }
                          },
                        ),
                      ),

                      SizedBox(
                        height: 2.h,
                      ),

                      //Sponsor
                      Row(
                        children: [
                          Text(
                            'Event Sponsored by',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 10.h,
                        child: Obx(() {
                          if (homeController
                                  .sponsorDanMediaPartner.value.success ==
                              true) {
                            if (homeController.sponsorDanMediaPartner.value
                                .sponsors!.isEmpty) {
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
                                itemCount: homeController.sponsorDanMediaPartner
                                    .value.sponsors!.length,
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
                                        width: 1.w,
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
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 22.h,
                                                        width: 22.h,
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              sponsor.logoUrl,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        sponsor.nama,
                                                        style:
                                                            GoogleFonts.poppins(
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
                                                BorderRadius.circular(100),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black87,
                                                blurRadius: 3,
                                              )
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                      SizedBox(
                        height: 2.h,
                      ),

                      //Schedule
                      Row(
                        children: [
                          Text(
                            'Available Team',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(Get.to(AvailableView()));
                            },
                            child: Text(
                              'Selengkapnya>>',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.amber[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Obx(() {
                        if (homeController.teamAvailabe.value.success == true) {
                          if (homeController.teamAvailabe.value.team!.isEmpty) {
                            return Center();
                          } else {
                            int itemCount =
                                homeController.teamAvailabe.value.team!.length;
                            int maxItemCount = 2;
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: itemCount > maxItemCount
                                  ? maxItemCount
                                  : itemCount,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var teamAvailable = homeController
                                    .teamAvailabe.value.team![index];
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        homeController.pemodalData.value
                                                        .success ==
                                                    true &&
                                                homeController.pemodalData.value
                                                        .investor !=
                                                    null
                                            ? Get.to(
                                                DetailTeamView(
                                                  id: teamAvailable.id
                                                      .toString(),
                                                  statusPeminat: teamAvailable
                                                      .statusPeminat,
                                                ),
                                                arguments: teamListController
                                                    .fetchTeamListDetail(
                                                        teamAvailable.id),
                                              )
                                            : Get.to(UnregistedWidget());
                                      },
                                      child: Container(
                                        height: 14.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: putih,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black87,
                                              blurRadius: 3,
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w, vertical: 1.h),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 18.w,
                                                  height: 20.w,
                                                  decoration: BoxDecoration(
                                                    color: putih,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          teamAvailable.logoUrl,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 62.w,
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                teamAvailable
                                                                    .nama,
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      11.sp,
                                                                ),
                                                              ),
                                                              Text(
                                                                teamAvailable
                                                                    .sektorUsaha,
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontSize:
                                                                      9.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          teamAvailable
                                                                      .watchlist ==
                                                                  'no'
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    homeController
                                                                        .watchlistPost(
                                                                            teamAvailable.id);
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_border_outlined,
                                                                    color:
                                                                        hitam,
                                                                    size: 30,
                                                                  ),
                                                                )
                                                              : teamAvailable
                                                                          .watchlist ==
                                                                      'yes'
                                                                  ? GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        homeController
                                                                            .watchlistDelete(teamAvailable.id);
                                                                      },
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .favorite,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            30,
                                                                      ),
                                                                    )
                                                                  : Container()
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 63.w,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Target Modal',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontSize:
                                                                      10.sp,
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                NumberFormat
                                                                    .currency(
                                                                  locale:
                                                                      'id-ID',
                                                                  decimalDigits:
                                                                      0,
                                                                  symbol: 'Rp',
                                                                ).format(int.parse(
                                                                    teamAvailable
                                                                        .targetModal)),
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Modal Terkumpul',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontSize:
                                                                      10.sp,
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                NumberFormat
                                                                    .currency(
                                                                  locale:
                                                                      'id-ID',
                                                                  decimalDigits:
                                                                      0,
                                                                  symbol: 'Rp',
                                                                ).format(int.parse(
                                                                    teamAvailable
                                                                        .terkumpul)),
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Capaian',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontSize:
                                                                      10.sp,
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Container(
                                                                height: 4,
                                                                width: 40.w,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black12,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      width: double.parse(teamAvailable
                                                                              .persentase) *
                                                                          0.625
                                                                              .w,
                                                                      height: 4,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            blue,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
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

                      SizedBox(
                        height: 2.h,
                      ),

                      //news
                      Row(
                        children: [
                          Text(
                            'News',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(PengumumanInvestors());
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            child: Obx(() {
                              if (homeController.newsInvestor.value.success ==
                                  true) {
                                if (homeController
                                    .newsInvestor.value.news!.isEmpty) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        'Tidak Ada Pengumuman',
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                  );
                                } else {
                                  int itemCount = homeController
                                      .newsInvestor.value.news!.length;
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
                                          .newsInvestor.value.news![index];
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  DetailPengumumanInvestors(
                                                    id: pengumuman.id
                                                        .toString(),
                                                  ),
                                                  arguments: homeController
                                                      .fetchNewsDetailInvestor(
                                                          int.parse(
                                                              pengumuman.id)));
                                            },
                                            child: Container(
                                              height: 12.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: putih,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black87,
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
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
                                                            pengumuman.judul,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: hitam,
                                                              fontSize: 11.sp,
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
                                                              color: hitam,
                                                              fontSize: 9.sp,
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
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 9.sp,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
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
                            }),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 85,
                      ),
                    ],
                  ),
                ),
              ],
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
