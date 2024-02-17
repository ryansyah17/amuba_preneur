import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class FundHistoryModal extends StatelessWidget {
  FundHistoryModal({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            Row(
              children: [
                SizedBox(
                  width: 30.w,
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
                  width: 30.w,
                  child: Center(
                    child: Text(
                      'Total Investasi',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                  child: Center(
                    child: Text(
                      'Tanggal',
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
              width: 100.w,
              height: 1,
              color: hitam,
            ),
            //body
            SizedBox(
              height: 1.h,
            ),
            Obx(
              () {
                if (homeController.teamModalHistory.value.success == true) {
                  if (homeController
                      .teamModalHistory.value.teamModalHistory!.isEmpty) {
                    return Center();
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: homeController
                          .teamModalHistory.value.teamModalHistoryTotal,
                      itemBuilder: (context, index) {
                        var teamModalHistory = homeController
                            .teamModalHistory.value.teamModalHistory![index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 30.w,
                                  child: Center(
                                    child: Text(
                                      teamModalHistory.investorNama,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                  child: Center(
                                    child: Text(
                                      NumberFormat.currency(
                                        locale: 'id-ID',
                                        decimalDigits: 0,
                                        symbol: 'Rp',
                                      ).format(int.parse(
                                          teamModalHistory.totalModal)),
                                      style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                  child: Center(
                                    child: Text(
                                      DateFormat(
                                              'EEE, dd MMM y HH:mm WIB', 'id')
                                          .format(DateTime.parse(
                                              teamModalHistory.createdAt)),
                                      textAlign: TextAlign.center,
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
                              width: 100.w,
                              height: 1,
                              color: hitam,
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
          ],
        ),
      ),
    );
  }
}
