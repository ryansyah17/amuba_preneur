import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../shared/theme.dart';

class InformasiWidget extends StatelessWidget {
  final Widget image;
  final String title;
  const InformasiWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 7.h,
            decoration: BoxDecoration(
              color: abuabu,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    height: 4.h,
                    child: image,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 15.w,
            height: 7.h,
            decoration: BoxDecoration(
                color: pink,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: putih,
              ),
            ),
          )
        ],
      ),
    );
  }
}
