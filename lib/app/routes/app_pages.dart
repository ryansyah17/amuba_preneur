import 'package:get/get.dart';

import '../../splashscreen_view.dart';
import '../modules/deal/bindings/deal_binding.dart';
import '../modules/deal/views/deal_view.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/peserta/home_view.dart';
import '../modules/investor/bindings/investor_binding.dart';
import '../modules/investor/views/investor_view.dart';
import '../modules/loginpage/bindings/loginpage_binding.dart';
import '../modules/loginpage/views/peserta/loginpage_view.dart';
import '../modules/mainpage/bindings/mainpage_binding.dart';
import '../modules/mainpage/views/peserta/mainpage_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/peserta/profil_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/peserta/register_view.dart';
import '../modules/team_list/bindings/team_list_binding.dart';
import '../modules/team_list/views/team_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE,
      page: () => LoginpageView(),
      binding: LoginpageBinding(),
    ),
    GetPage(
      name: _Paths.MAINPAGE,
      page: () => const MainPageView(),
      binding: MainpageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TEAM_LIST,
      page: () => TeamListView(),
      binding: TeamListBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.DEAL,
      page: () => DealView(),
      binding: DealBinding(),
    ),
    GetPage(
      name: _Paths.INVESTOR,
      page: () => InvestorView(),
      binding: InvestorBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
  ];
}
