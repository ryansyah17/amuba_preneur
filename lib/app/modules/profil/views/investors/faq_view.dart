import 'package:entrepreneur_app/app/modules/profil/controllers/profil_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

class FaqViewInvestors extends StatelessWidget {
  FaqViewInvestors({super.key});
  final ProfilController profilController = Get.put(ProfilController());
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
          'FAQ',
          style: GoogleFonts.poppins(
            color: hitam,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 90.h,
                child: Obx(() {
                  if (profilController.faqData.value.success == true) {
                    if (profilController.faqData.value.faqs!.isEmpty) {
                      return Center(
                        child: Text(
                          'Tidak Ada Data',
                          style: GoogleFonts.poppins(),
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: () async {
                          await profilController.fetchFaqData();
                        },
                        child: ListView.builder(
                          itemCount:
                              profilController.faqData.value.faqs!.length,
                          itemBuilder: (context, index) {
                            var faqData =
                                profilController.faqData.value.faqs![index];
                            return Column(
                              children: [
                                ExpansionTile(
                                  iconColor: '3b8382'.toColor(),
                                  textColor: '3b8382'.toColor(),
                                  title: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                            offset: Offset(0, 0),
                                            blurStyle: BlurStyle.normal),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                100,
                                            child: Text(
                                              faqData.question,
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Html(
                                        data:
                                            """<p style='color: black; font-size: 12px; font-family: ${GoogleFonts.poppins().fontFamily};'>${faqData.answer}</p>"""
                                            "",
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
