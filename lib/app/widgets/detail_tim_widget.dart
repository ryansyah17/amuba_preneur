import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DetailTimWidget extends StatelessWidget {
  final String label;
  final String isilabel;

  const DetailTimWidget(
      {super.key, required this.label, required this.isilabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40.w,
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              child: Text(
                isilabel,
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: 1,
          color: hitam,
          width: 100.w,
        ),
      ],
    );
  }
}
