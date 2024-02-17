import 'package:entrepreneur_app/app/modules/register/views/investors/register_investors.dart';
import 'package:entrepreneur_app/app/modules/register/views/peserta/register_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SelectRegister extends StatelessWidget {
  const SelectRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        color: blue,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
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
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(RegisterView());
                  },
                  child: Container(
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: pink,
                    ),
                    child: Center(
                      child: Text(
                        'Peserta',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: putih,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(RegisterInvestors());
                  },
                  child: Container(
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: pink,
                    ),
                    child: Center(
                      child: Text(
                        'Investor',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: putih,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: putih),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Kembali',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: hitam),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
