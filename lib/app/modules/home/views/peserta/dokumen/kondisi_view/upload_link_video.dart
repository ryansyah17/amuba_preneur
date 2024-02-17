import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/kondisi_view/materi_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UploadLinkVideo extends StatelessWidget {
  final String teamId;
  UploadLinkVideo({super.key, required this.teamId});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: putih,
        leading: IconButton(
          onPressed: () {
            Get.to(MateriView());
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: hitam,
          ),
        ),
        title: Text(
          'Upload Link Video',
          style: GoogleFonts.poppins(
            color: hitam,
            fontSize: 14.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Judul',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: homeController.judulDocumentController,
                keyboardType: TextInputType.name,
                autofocus: false,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(color: hitam),
                  labelText: 'Judul',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: hitam,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Link Video',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                controller: homeController.urlDocumentController,
                keyboardType: TextInputType.name,
                autofocus: false,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(color: hitam),
                  labelText: 'Link Video Usaha',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: hitam,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                ),
                maxLines: 5,
              ),
              Text(
                'Note : Video di upload ke Youtube, dan tempelkan link Youtube tersebut ke form diatas',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: hitam,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: birubg),
                    onPressed: () {
                      homeController.uploadLinkVideo(
                          linkvideo: homeController.urlDocumentController.text,
                          judul: homeController.judulDocumentController.text,
                          teamId: teamId);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: putih,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
