import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class DetailPengumumanView extends StatelessWidget {
  final String id;
  DetailPengumumanView({super.key, required this.id});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (homeController.newsDetailPeserta.value.success == true) {
          var pengumumanDetail = homeController.newsDetailPeserta.value.news;
          return Container(
            width: 100.w,
            height: 100.h,
            color: abuabu,
            child: SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 40.h,
                    child: Hero(
                        key: UniqueKey(),
                        tag: pengumumanDetail!.foto,
                        child: CachedNetworkImage(
                          imageUrl: pengumumanDetail.fotoUrl,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 100.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: blue,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 5.h,
                          left: 4.w,
                          right: 4.w,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pengumumanDetail.judul,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: putih,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    DateFormat('EEEE, dd MMMM y', 'id').format(
                                        DateTime.parse(
                                            pengumumanDetail.createdAt)),
                                    style: GoogleFonts.poppins(
                                      color: putih,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${DateFormat.Hm().format(DateTime.parse(pengumumanDetail.createdAt))} WIB',
                                    style: GoogleFonts.poppins(
                                      fontSize: 8.sp,
                                      color: putih,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: putih,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Html(data: pengumumanDetail.desc),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: SpinKitThreeBounce(
              color: pembeda,
            ),
          );
        }
      }),
      // floatingActionButton: Container(
      //   width: 35.w,
      //   height: 5.h,
      //   decoration: BoxDecoration(boxShadow: const [
      //     BoxShadow(blurRadius: 2),
      //   ], borderRadius: BorderRadius.circular(12), color: pink),
      //   child: Center(
      //     child: Text(
      //       'Buka PDF',
      //       style: GoogleFonts.poppins(
      //         fontSize: 12.sp,
      //         color: Colors.white,
      //         fontWeight: FontWeight.w600,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
