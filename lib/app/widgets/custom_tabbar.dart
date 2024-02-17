import 'package:entrepreneur_app/app/modules/home/views/peserta/modal/fund_history_modal.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/modal/investor_modal.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({super.key});

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar>
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
        height: 50.h,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurStyle: BlurStyle.solid,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
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
                                      'Investor',
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
                                      'Fund History',
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
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  InvestorModal(),
                  FundHistoryModal(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
