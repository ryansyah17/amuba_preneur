import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DetailLinkVideoPage extends StatelessWidget {
  final String judul;
  final String tahap;
  final String url;
  final String status;
  const DetailLinkVideoPage(
      {super.key,
      required this.judul,
      required this.tahap,
      required this.url,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: putih,
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
          'Detail Stage 1',
          style: GoogleFonts.poppins(
            color: hitam,
            fontSize: 14.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            Container(
              height: 6.h,
              width: 100.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 1, color: hitam),
                ],
                color: birubg,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  judul,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: putih,
                  ),
                ),
              ),
            ),
            Container(
              height: 20.h,
              width: 100.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 1, color: hitam),
                ],
                color: putih,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.w,
                          height: 3.h,
                          decoration: BoxDecoration(
                              color: birulangit,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Tahap $tahap',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: putih),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'URL',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                        ),
                        Container(
                          width: 100.w,
                          height: 3.h,
                          decoration: BoxDecoration(
                              color: birulangit,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              url,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: putih),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                        ),
                        Container(
                          width: 100.w,
                          height: 3.h,
                          decoration: BoxDecoration(
                              color: birulangit,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              status,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: putih),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
