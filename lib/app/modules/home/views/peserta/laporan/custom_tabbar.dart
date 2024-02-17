import 'package:entrepreneur_app/app/modules/home/views/peserta/laporan/view_pemasukan.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/laporan/view_pengeluaran.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTabbarLaporan extends StatefulWidget {
  const CustomTabbarLaporan({super.key});

  @override
  State<CustomTabbarLaporan> createState() => _CustomTabbarLaporanState();
}

class _CustomTabbarLaporanState extends State<CustomTabbarLaporan>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: 85.h,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    height: 4.h,
                    child: TabBar(
                      unselectedLabelColor: hitam,
                      labelColor: putih,
                      indicatorColor: Colors.white,
                      indicatorWeight: 1,
                      labelPadding: EdgeInsets.symmetric(),
                      indicator: BoxDecoration(
                        color: birulangit,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      controller: tabController,
                      tabs: [
                        Tab(
                          child: Stack(
                            children: [
                              Container(
                                height: 4.h,
                                // Set the height here
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Pemasukan',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Stack(
                            children: [
                              Container(
                                height: 4.h, // Set the height here
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Pengeluaran',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 0.2.h,
                  color: hitam,
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ViewLaporanPemasukan(),
                  ViewLaporanPengeluaran(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
