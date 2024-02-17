import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class InvestorModal extends StatelessWidget {
  InvestorModal({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            Row(
              children: [
                SizedBox(
                  width: 18.w,
                  child: Center(
                    child: Text(
                      'Foto',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28.w,
                  child: Center(
                    child: Text(
                      'Nama Investor',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28.w,
                  child: Center(
                    child: Text(
                      'Total Modal',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                  child: Center(
                    child: Text(
                      'Modal%',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 1,
              width: 100.w,
              color: hitam,
            ),
            SizedBox(
              height: 1.h,
            ),
            //body

            Obx(() {
              if (homeController.teamModalInvestor.value.success == true) {
                if (homeController
                    .teamModalInvestor.value.teamModalInvestor!.isEmpty) {
                  return Container();
                } else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeController
                        .teamModalInvestor.value.teamModalInvestorTotal,
                    itemBuilder: (context, index) {
                      var teamModalInvestor = homeController
                          .teamModalInvestor.value.teamModalInvestor![index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 18.w,
                                height: 18.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black12,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CachedNetworkImage(
                                    imageUrl: teamModalInvestor.fotoUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 28.w,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        teamModalInvestor.investorNama,
                                        style: GoogleFonts.poppins(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        teamModalInvestor.investorPekerjaan,
                                        style: GoogleFonts.poppins(
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 28.w,
                                child: Center(
                                  child: Text(
                                    NumberFormat.currency(
                                      locale: 'id-ID',
                                      decimalDigits: 0,
                                      symbol: 'Rp',
                                    ).format(int.parse(
                                        teamModalInvestor.totalModal)),
                                    style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                                child: Center(
                                  child: Text(
                                    teamModalInvestor.persentase,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 1,
                            width: 100.w,
                            color: hitam,
                          ),
                          SizedBox(
                            height: 1.h,
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
    );
  }
}
