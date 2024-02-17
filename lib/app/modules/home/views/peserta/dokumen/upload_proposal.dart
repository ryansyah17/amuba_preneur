import 'package:entrepreneur_app/app/modules/home/controllers/home_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UploadProposal extends StatelessWidget {
  final String teamId;
  UploadProposal({super.key, required this.teamId});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: putih,
        centerTitle: false,
        elevation: 1,
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
          'Upload Proposal',
          style: GoogleFonts.poppins(
            color: hitam,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: homeController.judulDocumentController,
                keyboardType: TextInputType.name,
                autofocus: false,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.poppins(fontSize: 10.sp, color: hitam),
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.poppins(color: hitam),
                  labelText: 'Judul Proposal',
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
                maxLines: 3,
              ),
              SizedBox(
                height: 2.h,
              ),
              // Text(
              //   'Tahap',
              //   style: GoogleFonts.poppins(
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // // Container(
              // //   height: 5.h,
              // //   width: 100.w,
              // //   decoration: BoxDecoration(
              // //       borderRadius: BorderRadius.circular(5),
              // //       border: Border.all(
              // //         width: 0.1.w,
              // //         color: hitam,
              // //       )),
              // //   child: Padding(
              // //     padding: EdgeInsets.symmetric(horizontal: 4.w),
              // //     child: Obx(
              // //       () {
              // //         return DropdownSearch<String>(
              // //           popupProps: PopupProps.modalBottomSheet(
              // //             constraints: BoxConstraints(maxHeight: 20.h),
              // //             showSelectedItems: true,
              // //           ),
              // //           items: homeController
              // //               .tahapDokumen
              // //               // ignore: invalid_use_of_protected_member
              // //               .value,
              // //           dropdownDecoratorProps: DropDownDecoratorProps(
              // //             dropdownSearchDecoration: InputDecoration(
              // //               fillColor: hitam,
              // //               labelStyle: TextStyle(
              // //                 color: hitam,
              // //               ),
              // //             ),
              // //             baseStyle: GoogleFonts.poppins(
              // //                 color: hitam, fontWeight: FontWeight.w500),
              // //           ),
              // //           onChanged: (value) {
              // //             homeController.selectedtahapDokumen.value = value!;
              // //           },
              // //           selectedItem: "",
              // //         );
              // //       },
              // //     ),
              // //   ),
              // // ),
              // SizedBox(
              //   height: 4.h,
              // ),
              Row(
                children: [
                  Container(
                    height: 15.w,
                    width: 15.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                            image: AssetImage('assets/upload.png'))),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(backgroundColor: blue),
                            onPressed: () async {
                              homeController.pickPdf();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.w),
                              child: Text(
                                'Upload File',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: putih,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Note: File Pdf Max: 20Mb',
                        style: GoogleFonts.poppins(
                            fontSize: 8.sp, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Text(
                    'File : ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Obx(() => homeController.fileName.value.isEmpty
                      ? Text(
                          'Belum ada file yang dipilih',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Text(
                          homeController.fileName.value,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: birulangit),
                    onPressed: () {
                      homeController.uploadFile(
                          filePath: homeController.filePdf.value,
                          judul: homeController.judulDocumentController.text,
                          teamId: teamId,
                          tahap: homeController
                              .stageData.value.stageSchedule!.tahap);
                      print(
                          homeController.stageData.value.stageSchedule!.tahap);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: putih,
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
    );
  }
}
