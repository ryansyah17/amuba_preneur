import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/kondisi_view/materi_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UpdateLinkVideo extends StatefulWidget {
  final String teamId;
  final String judul;
  final String id;
  final String linkVideo;
  UpdateLinkVideo(
      {super.key,
      required this.teamId,
      required this.judul,
      required this.id,
      required this.linkVideo});

  @override
  State<UpdateLinkVideo> createState() => _UpdateLinkVideoState();
}

class _UpdateLinkVideoState extends State<UpdateLinkVideo> {
  @override
  void initState() {
    homeController.judulDocumentController.text = widget.judul;
    homeController.urlDocumentController.text = widget.linkVideo;
    super.initState();
  }

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
          'Update Link Video',
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
                      homeController.updateLinkVideo(
                          linkVideo: homeController.urlDocumentController.text,
                          judul: homeController.judulDocumentController.text,
                          teamId: int.parse(widget.teamId),
                          teamDocsId: widget.id);
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
