import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingWidgets extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  const OnBoardingWidgets({super.key, this.image, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blue,
      height: Get.height,
      child: Column(
        children: [
          Container(
            height: Get.height * 0.65,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$image'),
                scale: 1.75,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.35,
            width: Get.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$title',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 18),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '$subtitle',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
