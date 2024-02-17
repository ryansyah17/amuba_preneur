import 'package:entrepreneur_app/app/modules/profil/controllers/profil_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SyaratDanKetentuanView extends StatelessWidget {
  SyaratDanKetentuanView({super.key});
  final ProfilController profilController = Get.put(ProfilController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Syarat & Ketentuan',
          style: GoogleFonts.poppins(
            color: putih,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Obx(() {
          if (profilController.peraturanData.value.success == true) {
            if (profilController.peraturanData.value.peraturan!.isEmpty) {
              return const Center(
                child: Text('Kosong'),
              );
            } else {
              return ListView.builder(
                itemCount: profilController.peraturanData.value.peraturanTotal,
                itemBuilder: (context, index) {
                  var peraturan =
                      profilController.peraturanData.value.peraturan![index];
                  var nomor = index + 1;
                  return Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: birulangit,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                15,
                              ),
                              topRight: Radius.circular(
                                15,
                              )),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '#${nomor.toString()}. ',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                color: putih,
                              ),
                            ),
                            Text(
                              peraturan.judul,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                color: putih,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: putih,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              blurStyle: BlurStyle.solid,
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Html(
                            data: peraturan.desk,
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
                color: putih,
              ),
            );
          }
        }),
      ),
    );
  }
}
