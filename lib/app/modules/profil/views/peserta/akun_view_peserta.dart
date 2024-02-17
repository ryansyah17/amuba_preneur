import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:entrepreneur_app/app/widgets/profil_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AkunViewPeserta extends StatelessWidget {
  AkunViewPeserta({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 25.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 20.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                                color: pink,
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: mainColor,
                                  ),
                                ]),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Your Profile Information',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      height: 35.w,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(200),
                        boxShadow: [
                          BoxShadow(blurRadius: 5, color: pembeda),
                        ],
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://akcdn.detik.net.id/community/media/visual/2023/08/13/cristiano-ronaldo-1_169.jpeg?w=600&q=90'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ProfilePicture(
                        name: authController.user.value.name!,
                        radius: 40,
                        fontsize: 30,
                        count: 2,
                        random: false,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal Information',
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: Image.asset('assets/edit.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ProfilWidget(
                      label: 'Username',
                      isian: authController.user.value.username!,
                    ),
                    ProfilWidget(
                      label: 'Nama',
                      isian: authController.user.value.name!,
                    ),
                    ProfilWidget(
                      label: 'Email',
                      isian: authController.user.value.email!,
                    ),
                    ProfilWidget(
                      label: 'Phone Number',
                      isian: authController.user.value.nohp!,
                    ),
                    // Container(
                    //   width: 100.w,
                    //   height: 5.h,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(12),
                    //     boxShadow: [
                    //       BoxShadow(blurRadius: 5, color: mainColor),
                    //     ],
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 15),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           'Address',
                    //           style: GoogleFonts.poppins(
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 10.sp,
                    //             color: Colors.blue,
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 60.w,
                    //           child: Text(
                    //             "M9XG+46R, Jl. Dr. Hamka, Pakan Kurai, Kec. Guguk Panjang, Kota Bukittinggi, Sumatera Barat",
                    //             maxLines: 1,
                    //             style: GoogleFonts.poppins(
                    //               fontWeight: FontWeight.w600,
                    //               fontSize: 10.sp,
                    //               color: Colors.grey,
                    //             ),
                    //             overflow: TextOverflow.ellipsis,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 2.h,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Security',
                    //       style: GoogleFonts.poppins(
                    //         fontSize: 15.sp,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.blue,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: 25,
                    //       child: Image.asset('assets/edit.png'),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 2.h,
                    // ),
                    // Container(
                    //   width: 100.w,
                    //   height: 5.h,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(12),
                    //     boxShadow: [
                    //       BoxShadow(blurRadius: 5, color: mainColor),
                    //     ],
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 15),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           'Password',
                    //           style: GoogleFonts.poppins(
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 10.sp,
                    //             color: Colors.blue,
                    //           ),
                    //         ),
                    //         Text(
                    //           '********',
                    //           style: GoogleFonts.poppins(
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 10.sp,
                    //             color: Colors.grey,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
