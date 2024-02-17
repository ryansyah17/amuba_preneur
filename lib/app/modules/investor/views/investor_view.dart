import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../controllers/investor_controller.dart';

class InvestorView extends GetView<InvestorController> {
  const InvestorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: putih,
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          'Investor',
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: putih,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Image.asset('assets/sl_120320_38530_15.jpg'),
      ),
    );
  }
}
