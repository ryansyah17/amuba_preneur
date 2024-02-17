import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/team_list/controllers/team_list_controller.dart';
import 'package:entrepreneur_app/app/modules/team_list/views/detail_team_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/widget_unregisted_team_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../controllers/favorite_controller.dart';

// ignore: must_be_immutable
class FavoriteView extends GetView<FavoriteController> {
  FavoriteView({Key? key}) : super(key: key);
  int? selectedPage;
  PageController pageController = PageController(initialPage: 0);
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final HomeController homeController = Get.put(HomeController());
  final TeamListController teamListController = Get.put(TeamListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          'Watch List',
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: putih,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(2.w),
              child: Obx(
                () {
                  if (favoriteController.teamWatchList.value.success == true) {
                    if (favoriteController.teamWatchList.value.team!.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30.h,
                              child: Image.asset('assets/noData.png'),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Data Kosong',
                              style: GoogleFonts.poppins(
                                color: hitam,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            favoriteController.teamWatchList.value.teamTotal,
                        itemBuilder: (context, index) {
                          var teamWatchList = favoriteController
                              .teamWatchList.value.team![index];
                          return Padding(
                            padding: EdgeInsets.fromLTRB(1.5.w, 1.h, 1.5.w, 0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    homeController.pemodalData.value.success ==
                                                true &&
                                            homeController.pemodalData.value
                                                    .investor !=
                                                null
                                        ? Get.to(
                                            DetailTeamView(
                                              id: teamWatchList.id.toString(),
                                              statusPeminat:
                                                  teamWatchList.statusPeminat,
                                            ),
                                            arguments: teamListController
                                                .fetchTeamListDetail(
                                                    teamWatchList.id),
                                          )
                                        : Get.to(UnregistedWidget());
                                  },
                                  child: Container(
                                    height: 14.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                                                    BorderRadius.circular(5),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      teamWatchList.logoUrl,
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
                                                            teamWatchList.nama,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 11.sp,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 50.w,
                                                            child: Text(
                                                              teamWatchList
                                                                  .sektorUsaha,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 9.sp,
                                                              ),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      teamWatchList.watchlist ==
                                                              'no'
                                                          ? GestureDetector(
                                                              onTap: () {
                                                                homeController
                                                                    .watchlistPost(
                                                                        teamWatchList
                                                                            .id);
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_border_outlined,
                                                                color: hitam,
                                                                size: 30,
                                                              ),
                                                            )
                                                          : teamWatchList
                                                                      .watchlist ==
                                                                  'yes'
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    homeController
                                                                        .watchlistDelete(
                                                                            teamWatchList.id);
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
                                                ),
                                                SizedBox(
                                                  width: 63.w,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Target Modal',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 10.sp,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            NumberFormat
                                                                .currency(
                                                              locale: 'id-ID',
                                                              decimalDigits: 0,
                                                              symbol: 'Rp',
                                                            ).format(int.parse(
                                                                teamWatchList
                                                                    .targetModal)),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 10.sp,
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
                                                              fontSize: 10.sp,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            NumberFormat
                                                                .currency(
                                                              locale: 'id-ID',
                                                              decimalDigits: 0,
                                                              symbol: 'Rp',
                                                            ).format(int.parse(
                                                                teamWatchList
                                                                    .terkumpul)),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 10.sp,
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
                                                              fontSize: 10.sp,
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
                                                                  width: double.parse(
                                                                          teamWatchList
                                                                              .persentase) *
                                                                      0.625.w,
                                                                  height: 4,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: blue,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
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
                            ),
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
            SizedBox(
              height: 7.h,
            ),
          ],
        ),
      ),
    );
  }
}
