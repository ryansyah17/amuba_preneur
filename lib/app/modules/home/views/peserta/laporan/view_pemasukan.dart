import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ViewLaporanPemasukan extends StatelessWidget {
  const ViewLaporanPemasukan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: blue),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Pemasukan',
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
