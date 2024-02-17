import 'package:entrepreneur_app/app/modules/home/views/peserta/home_view.dart';
import 'package:entrepreneur_app/app/modules/mainpage/views/peserta/navbar_page.dart';
import 'package:entrepreneur_app/app/modules/profil/views/peserta/profil_view.dart';
import 'package:flutter/material.dart';

class MainPageView extends StatefulWidget {
  final int? initialPage;
  final int? index;
  const MainPageView({super.key, this.initialPage, this.index});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
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
              child: HomeView(),
            ),
            Center(
              child: ProfilView(),
            ),
          ],
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: NavBarPage(
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
