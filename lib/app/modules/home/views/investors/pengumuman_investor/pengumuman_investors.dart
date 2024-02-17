import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/investors/pengumuman_investor/detail_pengumuman_investors.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class PengumumanInvestors extends StatelessWidget {
  PengumumanInvestors({super.key});

  final HomeController homeController = Get.put(HomeController());
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
          'Pengumuman',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          if (homeController.newsInvestor.value.success == true) {
            if (homeController.newsInvestor.value.news!.isEmpty) {
              return const Center(
                child: Text('Data Kosong'),
              );
            } else {
              return ListView.builder(
                itemCount: homeController.newsInvestor.value.news!.length,
                itemBuilder: (context, index) {
                  var pengumuman =
                      homeController.newsInvestor.value.news![index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: abuabu,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Hero(
                                      tag: pengumuman.foto,
                                      child: Container(
                                        width: 25.w,
                                        height: 25.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(22),
                                            topRight: Radius.circular(22),
                                          ),
                                          border: Border.all(
                                              width: 0.5.w,
                                              color: Colors.black12),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(22),
                                            topRight: Radius.circular(22),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: pengumuman.fotoUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                      width: 25.w,
                                      child: Center(
                                        child: Text(
                                          DateFormat('dd MMM y', 'id').format(
                                              DateTime.parse(
                                                  pengumuman.createdAt)),
                                          style: GoogleFonts.poppins(
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      pengumuman.judul,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      parseHtmlString(pengumuman.desc),
                                      maxLines: 3,
                                      style: GoogleFonts.poppins(
                                        fontSize: 8.sp,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          DetailPengumumanInvestors(
                                            id: pengumuman.id.toString(),
                                          ),
                                          arguments: homeController
                                              .fetchNewsDetailInvestor(
                                                  int.parse(pengumuman.id)));
                                    },
                                    child: Container(
                                      width: 50.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                        color: pink,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Detail',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
