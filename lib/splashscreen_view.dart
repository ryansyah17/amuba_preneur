import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SplashscreenView extends StatefulWidget {
  SplashscreenView({Key? key}) : super(key: key);

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  final authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
    bool isFirstTime = GetStorage().read('firstTime') ?? true;

    Future.delayed(const Duration(seconds: 2), () {
      if (isFirstTime) {
        Get.toNamed('/onboarding');
        GetStorage().write('firstTime', false); // Setelah onboarding selesai
      } else {
        // Langsung ke halaman beranda
        authController.checkLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg.jpeg'), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 18.h,
                          child: Image.asset('assets/square-05.png'),
                        ),
                        Text(
                          'AmubaPreneur',
                          style: GoogleFonts.poppins(
                            color: putih,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                SpinKitThreeBounce(
                  color: putih,
                  size: 35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
