import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PeminatDetailPage extends StatelessWidget {
  final String id;
  PeminatDetailPage({
    super.key,
    required this.id,
  });
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: putih,
        elevation: 1,
        centerTitle: false,
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
          'Detail Peminat',
          style: GoogleFonts.poppins(
            color: hitam,
          ),
        ),
      ),
      body: Obx(
        () {
          if (homeController.peminatDetail.value.success == true) {
            var peminatDetail =
                homeController.peminatDetail.value.teamPeminatDetail;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: pembeda,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                imageUrl: peminatDetail!.investorFotoUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            peminatDetail.investorNama,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: 100.w,
                  color: hitam,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Alamat Email',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              peminatDetail.investorEmail,
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 100.w,
                        color: hitam,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pendidikan Terakhir',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              peminatDetail.investorPekerjaan,
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 100.w,
                        color: hitam,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nomor Hp',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              peminatDetail.investorNohp,
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 100.w,
                        color: hitam,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25.w,
                                child: Text(
                                  'Alamat',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 60.w,
                                child: Text(
                                  peminatDetail.investorAlamat,
                                  maxLines: 2,
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 1,
                            color: hitam,
                            width: 100.w,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Label',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              peminatDetail.status,
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: 100.w,
                  color: hitam,
                ),
              ],
            );
          } else {
            return Center(
              child: SpinKitThreeBounce(
                color: pembeda,
              ),
            );
          }
        },
      ),
    );
  }
}
