import 'package:cached_network_image/cached_network_image.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DetailAnggotaWidget extends StatelessWidget {
  final String label;
  final String image;
  final String nama;
  final String taq;
  const DetailAnggotaWidget(
      {super.key,
      required this.label,
      required this.image,
      required this.nama,
      required this.taq});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: taq,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: CachedNetworkImage(
              width: 30.w,
              height: 15.h,
              imageUrl: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 30.w,
          height: 5.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: pembeda,
                )
              ],
              color: blue,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              )),
          child: Center(
            child: Text(
              nama.toUpperCase(),
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.poppins(
                fontSize: 9.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
