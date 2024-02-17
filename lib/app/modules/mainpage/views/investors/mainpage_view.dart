import 'package:entrepreneur_app/app/modules/deal/views/deal_view.dart';
import 'package:entrepreneur_app/app/modules/favorite/views/favorite_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/investors/home_view.dart';
import 'package:entrepreneur_app/app/modules/investor/views/investor_view.dart';
import 'package:entrepreneur_app/app/modules/mainpage/views/investors/navbar_page.dart';
import 'package:entrepreneur_app/app/modules/profil/views/investors/profil_view.dart';
import 'package:entrepreneur_app/app/modules/team_list/views/team_list_view.dart';
import 'package:flutter/material.dart';

class MainPageViewInvestors extends StatefulWidget {
  final int? initialPage;
  final int? index;
  const MainPageViewInvestors({super.key, this.initialPage, this.index});

  @override
  State<MainPageViewInvestors> createState() => _MainPageViewInvestorsState();
}

class _MainPageViewInvestorsState extends State<MainPageViewInvestors> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  void initState() {
    super.initState();

    selectedPage = widget.initialPage!;
    pageController = PageController(initialPage: widget.initialPage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
          child: Container(
            color: Colors.black12,
          ),
        ),
        SafeArea(
            child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          children: [
            Center(
              child: HomeViewInvestors(),
            ),
            Center(
              child: TeamListView(),
            ),
            Center(
              child: FavoriteView(),
            ),
            Center(
              child: DealView(),
            ),
            Center(
              child: InvestorView(),
            ),
            Center(
              child: ProfilViewInvestors(),
            ),
          ],
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: NavBarPageInvestors(
            selectedIndex: selectedPage,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
              pageController.jumpToPage(selectedPage);
            },
          ),
        )
      ],
    ));
  }
}
