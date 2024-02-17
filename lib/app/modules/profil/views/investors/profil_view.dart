import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/modules/profil/views/investors/akun_view_investor.dart';
import 'package:entrepreneur_app/app/modules/profil/views/investors/faq_view.dart';
import 'package:entrepreneur_app/app/modules/profil/views/view_syarat_dan_ketentuan.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/akun_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:supercharged/supercharged.dart';

import '../../controllers/profil_controller.dart';

class ProfilViewInvestors extends GetView<ProfilController> {
  final authContrller = Get.find<AuthController>();
  ProfilViewInvestors({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Container(
                height: 10.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: putih,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfilePicture(
                        name: authContrller.user.value.name!,
                        radius: 25,
                        fontsize: 30,
                        count: 2,
                        random: false,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            authContrller.user.value.name!.toUpperCase(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 3.w,
                                height: 3.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: 'F3CB51'.toColor(),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Investor',
                                style: GoogleFonts.poppins(),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(AkunViewInvestor());
              },
              child: const AkunWidget(
                imageUrl: 'assets/profil.png',
                teks: 'Profil',
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(FaqViewInvestors());
              },
              child: const AkunWidget(
                imageUrl: 'assets/faq.png',
                teks: 'FAQ',
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(SyaratDanKetentuanView());
              },
              child: const AkunWidget(
                imageUrl: 'assets/terms-and-conditions.png',
                teks: 'Syarat dan Ketentuan',
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () async {
                final fcmToken = await FirebaseMessaging.instance.getToken();
                authContrller.logout();
                authContrller.deleteToken(fcmToken!);
              },
              child: const AkunWidget(
                imageUrl: 'assets/check-out.png',
                teks: 'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
