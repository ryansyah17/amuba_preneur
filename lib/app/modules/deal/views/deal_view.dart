import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/deal/views/detail_team_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

import '../../../shared/theme.dart';
import '../controllers/deal_controller.dart';

// ignore: must_be_immutable
class DealView extends GetView<DealController> {
  int? selectedPage;
  PageController pageController = PageController(initialPage: 0);
  DealView({Key? key}) : super(key: key);
  final DealController dealController = Get.put(DealController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          'My Team',
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
              child: Obx(() {
                if (dealController.myTeam.value.success == true) {
                  if (dealController.myTeam.value.team!.isEmpty) {
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
                      itemCount: dealController.myTeam.value.team!.length,
                      itemBuilder: (context, index) {
                        var teamList = dealController.myTeam.value.team![index];
                        return Padding(
                          padding: EdgeInsets.fromLTRB(1.5.w, 1.h, 1.5.w, 0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        DetailMyTeamView(
                                          id: teamList.id.toString(),
                                        ),
                                        arguments: dealController
                                            .fetchMyTeamDetail(teamList.id),
                                      );
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
                                                    imageUrl: teamList.logoUrl,
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
                                                              teamList.nama,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 10.sp,
                                                              ),
                                                            ),
                                                            Text(
                                                              teamList
                                                                  .sektorUsaha,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 9.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
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
                                                                decimalDigits:
                                                                    0,
                                                                symbol: 'Rp',
                                                              ).format(int.parse(
                                                                  teamList
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
                                                                decimalDigits:
                                                                    0,
                                                                symbol: 'Rp',
                                                              ).format(int.parse(
                                                                  teamList
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
                                                                            teamList.persentase) *
                                                                        0.625.w,
                                                                    height: 4,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
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
                                  int.parse(teamList.terkumpul) >=
                                          int.parse(teamList.targetModal)
                                      ? Positioned(
                                          top: -5.h,
                                          right: -20.w,
                                          child: RotationTransition(
                                            turns: const AlwaysStoppedAnimation(
                                                45 / 360),
                                            child: Container(
                                              height: 10.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                color: '757575'.toColor(),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Sold',
                                                    style: GoogleFonts.poppins(
                                                      color: putih,
                                                      fontSize: 9.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
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
            SizedBox(
              height: 7.h,
            )
          ],
        ),
      ),
    );
  }
}
