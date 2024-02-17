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

class AvailableView extends StatelessWidget {
  AvailableView({super.key});
  final HomeController homeController = Get.put(HomeController());
  final TeamListController teamListController = Get.put(TeamListController());

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
          'Available Team',
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(2.w),
        child: Obx(() {
          if (homeController.teamAvailabe.value.success == true) {
            if (homeController.teamAvailabe.value.team!.isEmpty) {
              return Center();
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.teamAvailabe.value.teamTotal,
                itemBuilder: (context, index) {
                  var teamAvailable =
                      homeController.teamAvailabe.value.team![index];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            homeController.pemodalData.value.success == true &&
                                    homeController.pemodalData.value.investor !=
                                        null
                                ? Get.to(
                                    DetailTeamView(
                                      id: teamAvailable.id.toString(),
                                      statusPeminat:
                                          teamAvailable.statusPeminat,
                                    ),
                                    arguments: teamListController
                                        .fetchTeamListDetail(teamAvailable.id),
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: CachedNetworkImage(
                                          imageUrl: teamAvailable.logoUrl,
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    teamAvailable.nama,
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50.w,
                                                    child: Text(
                                                      teamAvailable.sektorUsaha,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 9.sp,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              teamAvailable.watchlist == 'no'
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        homeController
                                                            .watchlistPost(
                                                                teamAvailable
                                                                    .id);
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .favorite_border_outlined,
                                                        color: hitam,
                                                        size: 30,
                                                      ),
                                                    )
                                                  : teamAvailable.watchlist ==
                                                          'yes'
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            homeController
                                                                .watchlistDelete(
                                                                    teamAvailable
                                                                        .id);
                                                          },
                                                          child: const Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
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
                                                    style: GoogleFonts.poppins(
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
                                                        teamAvailable
                                                            .targetModal)),
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Modal Terkumpul',
                                                    style: GoogleFonts.poppins(
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
                                                        teamAvailable
                                                            .terkumpul)),
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Capaian',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    height: 4,
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black12,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: double.parse(
                                                                  teamAvailable
                                                                      .persentase) *
                                                              0.625.w,
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
        }),
      ),
    );
  }
}
