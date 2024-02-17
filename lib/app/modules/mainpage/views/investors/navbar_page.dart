import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarPageInvestors extends StatelessWidget {
  final int? selectedIndex;
  final Function(int index)? onTap;

  const NavBarPageInvestors({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(
                15,
              )),
          color: putih,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Colors.grey,
              spreadRadius: 0.3,
            )
          ]),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(0);
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: selectedIndex == 0
                              ? Image.asset('assets/home_black.png')
                              : Image.asset('assets/home_white.png')),
                      Container(
                        child: Text(
                          'Home',
                          style: (selectedIndex == 0)
                              ? GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: hitam,
                                  fontWeight: FontWeight.w600,
                                )
                              : GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: abu,
                                  fontWeight: FontWeight.w600,
                                ),
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(1);
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: selectedIndex == 1
                            ? Image.asset('assets/team_black.png')
                            : Image.asset('assets/team_white.png'),
                      ),
                      Container(
                        child: Text(
                          'Team List',
                          style: (selectedIndex == 1)
                              ? GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: hitam,
                                  fontWeight: FontWeight.w600,
                                )
                              : GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: abu,
                                  fontWeight: FontWeight.w600,
                                ),
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(2);
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: selectedIndex == 2
                            ? Image.asset('assets/favorite_black.png')
                            : Image.asset('assets/favorite_white.png'),
                      ),
                      Container(
                        child: Text(
                          'Favorit',
                          style: (selectedIndex == 2)
                              ? GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: hitam,
                                  fontWeight: FontWeight.w600,
                                )
                              : GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: abu,
                                  fontWeight: FontWeight.w600,
                                ),
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(3);
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: selectedIndex == 3
                            ? Image.asset('assets/deal_black.png')
                            : Image.asset('assets/deal_white.png'),
                      ),
                      Container(
                        child: Text(
                          'MyTeam',
                          style: (selectedIndex == 3)
                              ? GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: hitam,
                                  fontWeight: FontWeight.w600,
                                )
                              : GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: abu,
                                  fontWeight: FontWeight.w600,
                                ),
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(4);
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: selectedIndex == 4
                            ? Image.asset('assets/invest_black.png')
                            : Image.asset('assets/invest_white.png'),
                      ),
                      Container(
                        child: Text(
                          'Investing',
                          style: (selectedIndex == 4)
                              ? GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: hitam,
                                  fontWeight: FontWeight.w600,
                                )
                              : GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: abu,
                                  fontWeight: FontWeight.w600,
                                ),
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(5);
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: selectedIndex == 5
                            ? Image.asset('assets/akun_black.png')
                            : Image.asset('assets/akun_white.png'),
                      ),
                      Container(
                        child: Text(
                          'Profil',
                          style: (selectedIndex == 5)
                              ? GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: hitam,
                                  fontWeight: FontWeight.w600,
                                )
                              : GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: abu,
                                  fontWeight: FontWeight.w600,
                                ),
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
