import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/onboarding_widgets.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.indicator,
          onPageChanged: ((value) {
            controller.page.value = value;
            print("ini${controller.page.value}");
          }),
          children: const [
            // start page onboarding
            OnBoardingWidgets(
              image: '5469.png',
              title: 'Temukan Ide Usaha',
              subtitle:
                  'Mulai petualangan bisnis Anda! Temukan cara mengubah ide kreatif Anda menjadi kesuksesan!',
            ),
            OnBoardingWidgets(
              image: 'grow.png',
              title: 'Tumbuh dan Kembangkan Ide Usahamu',
              subtitle:
                  'Bersama kami, Anda akan tumbuh dan kembangkan bisnis Anda dengan saran dan strategi yang tepat!',
            ),
            OnBoardingWidgets(
              image: 'start-on.png',
              title: 'Lets Get Started',
              subtitle:
                  'Saatnya memulai! Ikuti panduan kami untuk menjalankan ide bisnis Anda ke dunia nyata!',
            ),
            // end
          ],
        ),
        Obx(
          () => controller.page.value == 2
              ? Container()
              : Container(
                  alignment: const Alignment(0.8, -0.85),
                  child: GestureDetector(
                    onTap: () {
                      controller.indicator.jumpToPage(3);
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
        ),
        Obx(
          () => Container(
            alignment: const Alignment(0, 0.85),
            child: controller.page.value != 2
                ? SmoothPageIndicator(
                    controller: controller.indicator,
                    count: 3,
                    effect: SlideEffect(
                      activeDotColor: blue,
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 8,
                      dotHeight: 8,
                      dotColor: Colors.grey[600]!,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      Get.offNamed(Routes.LOGINPAGE);
                    },
                    child: Container(
                      height: 55,
                      width: Get.width * 0.8,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Getting Started',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ),
        )
      ],
    ));
  }
}
