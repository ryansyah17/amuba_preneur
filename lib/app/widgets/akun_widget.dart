import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AkunWidget extends StatelessWidget {
  final String imageUrl;
  final String teks;
  const AkunWidget({super.key, required this.imageUrl, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        height: 6.h,
        width: 100.w,
        decoration: BoxDecoration(color: putih, boxShadow: const []),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              SizedBox(
                height: 5.h,
                child: Image.asset(imageUrl),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                teks,
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
