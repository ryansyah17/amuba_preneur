import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SelectMenuHome extends StatelessWidget {
  final String imageUrl;
  final String title;
  const SelectMenuHome(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 18.w,
          width: 18.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: birulangit,
          ),
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 11.sp,
          ),
        )
      ],
    );
  }
}
