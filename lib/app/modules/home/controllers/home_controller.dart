import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:entrepreneur_app/app/api/base_url.dart';
import 'package:entrepreneur_app/app/data/data_banner.dart';
import 'package:entrepreneur_app/app/data/data_banner_detail.dart';
import 'package:entrepreneur_app/app/data/data_stage.dart';
import 'package:entrepreneur_app/app/data/faq_data.dart';
import 'package:entrepreneur_app/app/data/investor/data_news_detail_investor.dart';
import 'package:entrepreneur_app/app/data/investor/data_news_investor.dart';
import 'package:entrepreneur_app/app/data/investor/data_team_available_home.dart';
import 'package:entrepreneur_app/app/data/investor/data_tim_available.dart';
import 'package:entrepreneur_app/app/data/investor/data_tim_popular.dart';
import 'package:entrepreneur_app/app/data/investor/pemodal_data.dart';
import 'package:entrepreneur_app/app/data/peserta/data_document_team.dart';
import 'package:entrepreneur_app/app/data/peserta/data_event_by_team_id.dart';
import 'package:entrepreneur_app/app/data/peserta/data_event_team.dart';
import 'package:entrepreneur_app/app/data/peserta/data_informasi_anggota.dart';
import 'package:entrepreneur_app/app/data/peserta/data_informasi_usaha.dart';
import 'package:entrepreneur_app/app/data/peserta/data_modal_history_team.dart';
import 'package:entrepreneur_app/app/data/peserta/data_modal_investor_team.dart';
import 'package:entrepreneur_app/app/data/peserta/data_modal_team.dart';
import 'package:entrepreneur_app/app/data/peserta/data_news_detail_peserta.dart';
import 'package:entrepreneur_app/app/data/peserta/data_news_peserta.dart';
import 'package:entrepreneur_app/app/data/peserta/data_peminat_approve_team.dart';
import 'package:entrepreneur_app/app/data/peserta/data_peminat_request_team.dart';
import 'package:entrepreneur_app/app/data/peserta/data_peminat_team_detail.dart';
import 'package:entrepreneur_app/app/data/peserta/data_planning_usaha.dart';
import 'package:entrepreneur_app/app/data/sponsor_dan_mediapartner_model.dart';
import 'package:entrepreneur_app/app/modules/deal/controllers/deal_controller.dart';
import 'package:entrepreneur_app/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/dokumen/kondisi_view/materi_view.dart';
import 'package:entrepreneur_app/app/modules/home/views/peserta/usaha/usaha_view.dart';
import 'package:entrepreneur_app/app/modules/mainpage/views/investors/mainpage_view.dart';
import 'package:entrepreneur_app/app/modules/team_list/controllers/team_list_controller.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class HomeController extends GetxController {
  PageController indicator = PageController();
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  RxInt page = 0.obs;
  final box = GetStorage();
  final loggedInUserId = RxnInt(0);
  final Rx<Duration> currentTime = Rx<Duration>(const Duration(days: 0));

  final sponsorDanMediaPartner = SponsorMediaPartner().obs;
  final faqData = FaqData().obs;
  final newsPeserta = NewsPesertaData().obs;
  final newsDetailPeserta = NewsDetailPesertaData().obs;
  final bannerData = DataBanner().obs;
  final bannerDataDetail = DataBannerDetail().obs;
  void showLoading() {
    Get.dialog(
      Center(
        child: SpinKitThreeBounce(
          color: pembeda,
        ),
      ),
      barrierDismissible:
          false, // This prevents users from dismissing the loading overlay
    );
  }

  void hideLoading() {
    Get.back();
  }

  @override
  void onInit() {
    fetchSponsordanMediaPartner();
    fetchPemodal();
    fetchInformasiUsaha();
    fetchFaqData();
    fetchNewsPeserta();
    fetchEventTeam();
    fetchNewsInvestor();
    fetchDataBanner();
    onConnectPressed();
    emailPemodalController.text = box.read('email');
    noHpPemodalController.text = box.read('nohp');
    super.onInit();
  }

  //pusher
  void onConnectPressed() async {
    try {
      await pusher.init(
        apiKey: "e58169119b2303d141e3",
        cluster: "ap1",
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
      );
      await pusher.subscribe(channelName: 'amuba-mobile');
      await pusher.connect();
    } catch (e) {
      print("Print ERROR: $e");
    }
  }

  Future<void> onEvent(PusherEvent event) async {
    final box = GetStorage();
    loggedInUserId.value = box.read('loggedInUserId');
    print("Print onEvent/ event masuk: $event ini${loggedInUserId.value}");

    if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'peserta-daftar-${loggedInUserId.value}') {
      await fetchInformasiUsaha();
      await fetchPlanningUsaha(globalInvestorId.value!);
      await fetchInformasiAnggota(globalInvestorId.value!);
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'peserta-daftar') {
      await fetchTeamPopular();
      await fetchTeamAvailabe();
      await fetchTeamAvailabeHome();
      await teamListController.fetchTeamList(globalInvestorId.value!);
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'investor-daftar-${loggedInUserId.value}') {
      await fetchPemodal();
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'peserta-access-${loggedInUserId.value}') {
      await fetchPeminatTeamRequest(globalTeamId.value!);
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'peserta-access-req-${loggedInUserId.value}') {
      await fetchTeamPopular();
      await fetchTeamAvailabe();
      await fetchTeamAvailabeHome();
      await teamListController.fetchTeamList(globalInvestorId.value!);
      await favoriteController.fetchTeamWatchList(globalInvestorId.value!);
      await dealController.fetchMyTeam(globalInvestorId.value!);
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'news-all') {
      await fetchNewsPeserta();
      await fetchNewsInvestor();
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'news-peserta') {
      await fetchNewsPeserta();
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'news-investor') {
      await fetchNewsInvestor();
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'schedule-all') {
      await fetchEventTeam();
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'schedule-team-${loggedInUserId.value}') {
      await fetchEventByTeamId(globalTeamId.value!);
    } else if (event.channelName == 'amuba-mobile' &&
        event.eventName == 'peserta-dokumen-${loggedInUserId.value}') {
      await fetchDocumentTeam(globalTeamId.value!);
      await fetchDataStage(globalTeamId.value!);
    }
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    print("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    print("Print Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    print("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    print("onDecryptionFailure: $event reason: $reason");
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    print("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    print("onError: $message code: $code exception: $e");
  }

  //UMUM
  Future<void> fetchDataBanner() async {
    var url = '${baseUrl}m/banners';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        bannerData.value = DataBanner.fromJson(jsonData);
      } else {
        // Error handling
        print('Request bannerData failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error bannerData: $e');
    }
  }

  Future<void> fetchDataBannerDetail(String id) async {
    var url = '${baseUrl}m/banners?banner_id=$id';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        bannerDataDetail.value = DataBannerDetail.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request bannerDataDetail failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error bannerDataDetail: $e');
    }
  }

  Future<void> fetchSponsordanMediaPartner() async {
    var url = '${baseUrl}m/sponsors';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        sponsorDanMediaPartner.value = SponsorMediaPartner.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request Sponsor Dan MediaPartner failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error Sponsor Dan MediaPartner: $e');
    }
  }

  Future<void> fetchNewsPeserta() async {
    var url = '${baseUrl}m/news/peserta';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        newsPeserta.value = NewsPesertaData.fromJson(jsonData);
      } else {
        // Error handling
        print('Request newsPeserta with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error newsPeserta: $e');
    }
  }

  Future<void> fetchDataPengumumanDetail(String id) async {
    var url = '${baseUrl}m/news/peserta?news_id=$id';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        newsDetailPeserta.value = NewsDetailPesertaData.fromJson(jsonData);
      } else {
        // Error handling
        print('Request newsDetailPeserta with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error newsDetailPeserta: $e');
    }
  }

  Future<void> fetchFaqData() async {
    var url = '${baseUrl}m/faqs';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        faqData.value = FaqData.fromJson(jsonData);
      } else {
        // Error handling
        print('Request failed faqData with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error faqData: $e');
    }
  }

  //REGISTRASI-MENU-USAHA
  Rx<File?> image = Rx<File?>(null);
  Rx<File?> imageAnggota1 = Rx<File?>(null);
  Rx<File?> imageAnggota2 = Rx<File?>(null);
  Rx<File?> imageAnggota3 = Rx<File?>(null);
  Rx<File?> imageAnggota4 = Rx<File?>(null);
  Rx<File?> imageFotoKtpAnggota1 = Rx<File?>(null);
  Rx<File?> imageFotoKtpAnggota2 = Rx<File?>(null);
  Rx<File?> imageFotoKtpAnggota3 = Rx<File?>(null);
  Rx<File?> imageFotoKtpAnggota4 = Rx<File?>(null);
  RxString selectedUkuranBajuAnggota1 = "".obs;
  RxString selectedUkuranBajuAnggota2 = "".obs;
  RxString selectedUkuranBajuAnggota3 = "".obs;
  RxString selectedUkuranBajuAnggota4 = "".obs;
  RxString selectedPendidikanTerakhirAnggota1 = "".obs;
  RxString selectedPendidikanTerakhirAnggota2 = "".obs;
  RxString selectedPendidikanTerakhirAnggota3 = "".obs;
  RxString selectedPendidikanTerakhirAnggota4 = "".obs;
  RxString selectedJenisUsaha = "".obs;
  RxString selectedSektorUsaha = "".obs;
  RxString selectedSumberProduk = "".obs;
  RxString selectedTargetPembeli = "".obs;
  RxString selectedLokasiOperasional = "".obs;

  RxList<String> jenisUsaha = RxList<String>([
    "Produk",
    "Jasa",
  ]);
  RxList<String> sumberProduk = RxList<String>([
    "Produk Mandiri",
    "Beli dari Produsen",
  ]);
  RxList<String> targetPembeli = RxList<String>([
    "Penjual Lain",
    "Langsung ke Konsumen",
  ]);
  RxList<String> lokasiOperasional = RxList<String>([
    "Rumah",
    "Kantor",
    "Toko",
    "Lainnya",
  ]);
  RxList<String> sektorUsaha = RxList<String>([
    "Pertanian dan Perkebunan",
    "Pertambangan",
    "Manufaktur",
    "Konstruksi",
    "Perdagangan",
    "Keuangan dan Perbankan",
    "Pariwisata",
    "Pendidikan",
    "Teknologi Informasi dan Komunikasi",
    "Energi",
    "Kesehatan",
    "Properti dan Real Estat"
  ]);
  RxList<String> ukuranBaju = RxList<String>([
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ]);
  RxList<String> pendidikanTerakhir = RxList<String>([
    "TK",
    "SD",
    "SMP",
    "SMA",
    "D1/D2/D3",
    "S1",
    "S2",
    "S3",
  ]);
  Future<void> getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryAnggota1() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imageAnggota1.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryAnggota2() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imageAnggota2.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryAnggota3() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imageAnggota3.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryAnggota4() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imageAnggota4.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryKtpAnggota1() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imageFotoKtpAnggota1.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryKtpAnggota2() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imageFotoKtpAnggota2.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryKtpAnggota3() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imageFotoKtpAnggota3.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryKtpAnggota4() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imageFotoKtpAnggota4.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  //Peserta Registrasi Team
  final namaTeamController = TextEditingController();
  final deskripsiTeamController = TextEditingController();
  final emailBisnisTeamController = TextEditingController();
  final nomorHpBisnisTeamController = TextEditingController();
  final targerModalTeamController = TextEditingController();
  final minimalInvestasiTeamController = TextEditingController();
  final namaAnggotaTeamController = TextEditingController();
  final namaAnggota1TeamController = TextEditingController();
  final namaAnggota2TeamController = TextEditingController();
  final namaAnggota3TeamController = TextEditingController();
  final noHpAnggotaTeamController = TextEditingController();
  final noHpAnggota1TeamController = TextEditingController();
  final noHpAnggota2TeamController = TextEditingController();
  final noHpAnggota3TeamController = TextEditingController();
  final instagramAnggotaTeamController = TextEditingController();
  final instagramAnggota1TeamController = TextEditingController();
  final instagramAnggota2TeamController = TextEditingController();
  final instagramAnggota3TeamController = TextEditingController();
  final globalTeamId = RxnInt(0);
  final informasiUsaha = InformasiUsahaData().obs;
  final planningUsaha = PlanningUsahaData().obs;
  final informasiAnggota = InformasiAnggotaData().obs;

  Future<void> registerInformasiUsaha({
    required String namaTeam,
    required String deskripsi,
    required String emailBisnis,
    required String noHpBisnis,
  }) async {
    showLoading();
    loggedInUserId.value = box.read('loggedInUserId');
    var url = '${baseUrl}m/team/store';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['user_id'] = loggedInUserId.value.toString();
    request.fields['nama'] = namaTeam;
    if (image.value != null && image.value!.lengthSync() > 0) {
      request.files.add(
        http.MultipartFile('logo', image.value!.readAsBytes().asStream(),
            image.value!.lengthSync(),
            filename: image.value!.path.split('/').last),
      );
    }
    request.fields['jenis_usaha'] = selectedJenisUsaha.value;
    request.fields['sektor_usaha'] = selectedSektorUsaha.value;
    request.fields['deskripsi'] = deskripsi;
    request.fields['email'] = emailBisnis;
    request.fields['nohp'] = noHpBisnis;
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Silahkan Lengkapi Data Lainnya',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(UsahaView());
        await fetchInformasiUsaha();
        update();
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Menyimpan Data Informasi Usaha',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan registrasi.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<File> getImageFileFromAsset(String assetPath, String fileName) async {
    final ByteData data = await rootBundle.load(assetPath);
    final List<int> bytes = data.buffer.asUint8List();
    final String tempPath = (await getTemporaryDirectory()).path;
    final File imageFile = File('$tempPath/$fileName');
    await imageFile.writeAsBytes(bytes, flush: true);
    return imageFile;
  }

  Future<void> updateInformasiUsaha({
    required String teamid,
    required String namaTeam,
    required String deskripsi,
    required String emailBisnis,
    required String noHpBisnis,
  }) async {
    showLoading();
    loggedInUserId.value = box.read('loggedInUserId');
    var url = '${baseUrl}m/team/update';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_id'] = teamid;
    request.fields['nama'] = namaTeam;
    if (image.value != null && image.value!.lengthSync() > 0) {
      request.files.add(
        http.MultipartFile('logo', image.value!.readAsBytes().asStream(),
            image.value!.lengthSync(),
            filename: image.value!.path.split('/').last),
      );
    }
    request.fields['jenis_usaha'] = selectedJenisUsaha.value;
    request.fields['sektor_usaha'] = selectedSektorUsaha.value;
    request.fields['deskripsi'] = deskripsi;
    request.fields['email'] = emailBisnis;
    request.fields['nohp'] = noHpBisnis;
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Silahkan Lengkapi Data Lainnya',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(UsahaView());
        await fetchInformasiUsaha();
        update();
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Menyimpan Data Informasi Usaha',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan registrasi.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> fetchInformasiUsaha() async {
    loggedInUserId.value = box.read('loggedInUserId');
    var url = '${baseUrl}m/team?user_id=$loggedInUserId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        informasiUsaha.value = InformasiUsahaData.fromJson(jsonData);
        globalTeamId.value = informasiUsaha.value.team!.id;
        await fetchDataStage(globalTeamId.value!);
        await fetchPlanningUsaha(globalTeamId.value!);
        await fetchInformasiAnggota(globalTeamId.value!);
        await fetchPeminatTeamRequest(globalTeamId.value!);
        await fetchPeminatTeamApprove(globalTeamId.value!);
        await fetchTeamModal(globalTeamId.value!);
        await fetchTeamModalInvestor(globalTeamId.value!);
        await fetchTeamModalHistory(globalTeamId.value!);
        await fetchEventByTeamId(globalTeamId.value!);
        await fetchDocumentTeam(globalTeamId.value!);
      } else {
        // Error handling
        print(
            'Request failed informasiUsaha with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error informasiUsaha: $e');
    }
  }

  Future<void> registerPlanningBisnis({
    required String targetModal,
    required String minimalInvestasi,
    required String teamId,
  }) async {
    showLoading();
    var url = '${baseUrl}m/team-planning/store';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_id'] = teamId;
    request.fields['target_modal'] = targetModal;
    request.fields['min_investasi'] = minimalInvestasi;
    request.fields['sumber_produk'] = selectedSumberProduk.value;
    request.fields['target_pembeli'] = selectedTargetPembeli.value;
    request.fields['lokasi_operasional'] = selectedLokasiOperasional.value;
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Silahkan Lengkapi Data Selanjutnya',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(
          UsahaView(),
        );
        await fetchPlanningUsaha(int.parse(teamId));
        update();
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Menyimpan Data Planning Usaha',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan registrasi.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> updatePlanningBisnis({
    required String targetModal,
    required String minimalInvestasi,
    required String teamPlanningId,
    required String teamId,
  }) async {
    showLoading();
    var url = '${baseUrl}m/team-planning/update';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_planning_id'] = teamPlanningId;
    request.fields['target_modal'] = targetModal;
    request.fields['min_investasi'] = minimalInvestasi;
    request.fields['sumber_produk'] = selectedSumberProduk.value;
    request.fields['target_pembeli'] = selectedTargetPembeli.value;
    request.fields['lokasi_operasional'] = selectedLokasiOperasional.value;
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Berhasil Update Data Planning Bisnis',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(
          UsahaView(),
        );
        await fetchPlanningUsaha(int.parse(teamId));
        update();
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Menyimpan Data Planning Usaha',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan perubahan data.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> fetchPlanningUsaha(int id) async {
    var url = '${baseUrl}m/team-planning?team_id=$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        planningUsaha.value = PlanningUsahaData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed planningUsaha with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error planningUsaha: $e');
    }
  }

  Future<void> registerInformasiAnggota({
    required String teamId,
    required List<String>? namaAnggota,
    required List<String> nohpAnggota,
    required List<String> instagramAnggota,
    required List<String> ukuranBajuAnggota,
    required List<String> pendidikanTerakhirAnggota,
    List<File>? fotoAnggota,
    List<File>? fotoIdAnggota,
  }) async {
    showLoading();
    var url = '${baseUrl}m/team-anggota/store';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_id'] = teamId;
    for (var i = 0; i < namaAnggota!.length; i++) {
      request.fields['nama_anggota[$i]'] = namaAnggota[i];
      request.fields['nohp_anggota[$i]'] = nohpAnggota[i];
      request.fields['instagram_anggota[$i]'] = instagramAnggota[i];
      request.fields['ukuran_baju_anggota[$i]'] = ukuranBajuAnggota[i];
      request.fields['pendidikan_terakhir_anggota[$i]'] =
          pendidikanTerakhirAnggota[i];
      // ignore: unnecessary_null_comparison
      if (fotoAnggota != null &&
          fotoAnggota[i].existsSync() &&
          fotoAnggota[i].lengthSync() > 0) {
        request.files.add(
          http.MultipartFile(
            'foto_anggota[$i]',
            fotoAnggota[i].readAsBytes().asStream(),
            fotoAnggota[i].lengthSync(),
            filename: fotoAnggota[i].path.split('/').last,
          ),
        );
      }

      if (fotoIdAnggota != null &&
          fotoIdAnggota[i].existsSync() &&
          fotoIdAnggota[i].lengthSync() > 0) {
        request.files.add(
          http.MultipartFile(
            'foto_ktp_anggota[$i]',
            fotoIdAnggota[i].readAsBytes().asStream(),
            fotoIdAnggota[i].lengthSync(),
            filename: fotoIdAnggota[i].path.split('/').last,
          ),
        );
      }
    }
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Silahkan Lengkapi Data Selanjutnya',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(
          UsahaView(),
        );
        await fetchInformasiAnggota(int.parse(teamId));
        update();
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Menyimpan Data Planning Usaha',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan registrasi.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> updateInformasiAnggota({
    required String teamId,
    required String teamAnggotaId,
    required String namaAnggota,
    required String nohpAnggota,
    required String instagramAnggota,
  }) async {
    showLoading();
    var url = '${baseUrl}m/team-anggota/update';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_anggota_id'] = teamAnggotaId;
    request.fields['nama_anggota'] = namaAnggota;
    request.fields['nohp_anggota'] = nohpAnggota;
    request.fields['instagram_anggota'] = instagramAnggota;
    request.fields['ukuran_baju_anggota'] = selectedUkuranBajuAnggota1.value;
    request.fields['pendidikan_terakhir_anggota'] =
        selectedPendidikanTerakhirAnggota1.value;
    if (imageAnggota1.value != null && imageAnggota1.value!.lengthSync() > 0) {
      request.files.add(
        http.MultipartFile(
            'foto_anggota',
            imageAnggota1.value!.readAsBytes().asStream(),
            imageAnggota1.value!.lengthSync(),
            filename: imageAnggota1.value!.path.split('/').last),
      );
    }
    if (imageFotoKtpAnggota1.value != null &&
        imageFotoKtpAnggota1.value!.lengthSync() > 0) {
      request.files.add(
        http.MultipartFile(
            'foto_ktp_anggota',
            imageFotoKtpAnggota1.value!.readAsBytes().asStream(),
            imageFotoKtpAnggota1.value!.lengthSync(),
            filename: imageFotoKtpAnggota1.value!.path.split('/').last),
      );
    }
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Berhasil Update Data Planning Bisnis',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(
          UsahaView(),
        );
        await fetchInformasiAnggota(int.parse(teamId));
        update();
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Menyimpan Data Planning Usaha',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan perubahan data.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> fetchInformasiAnggota(int id) async {
    var url = '${baseUrl}m/team-anggota?team_id=$id';
    print('ini url anggota$url');
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        informasiAnggota.value = InformasiAnggotaData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed informasiAnggota with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error informasiAnggota: $e');
    }
  }

  Future<void> deleteAnggota(int teamAnggotaId) async {
    showLoading();
    var url = '${baseUrl}m/team-anggota/delete?team_anggota_id=$teamAnggotaId';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        Get.back();
        hideLoading();
        Get.snackbar(
          'Success',
          'Berhasil Delete Anggota',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );

        await fetchInformasiAnggota(globalTeamId.value!);
        update();
      } else {
        hideLoading();
        print('Failed to Delete');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  Future<void> submitPendaftaran(int teamId) async {
    showLoading();
    var url = '${baseUrl}m/team/submit?team_id=$teamId';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        hideLoading();
        Get.snackbar(
          'Success',
          'Berhasil Submit Data Usaha',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        await fetchInformasiUsaha();
        update();
        Get.back();
      } else {
        hideLoading();
        print('Failed Submit Pendaftaran');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  //Peserta-Peminat
  final peminatRequest = PeminatTeamRequestData().obs;
  final peminatApprove = PeminatTeamApproveData().obs;
  final peminatDetail = PeminatDetailData().obs;

  Future<void> terimaPeminat(int peminatId) async {
    showLoading();
    var url = '${baseUrl}m/team-peminat/terima?team_peminat_id=$peminatId';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        hideLoading();
        Get.snackbar(
          'Success',
          'Berhasil Terima Investor',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.back();
        await fetchPeminatTeamApprove(globalTeamId.value!);
        await fetchPeminatTeamRequest(globalTeamId.value!);
        update();
      } else {
        hideLoading();
        print('Failed to Terima Investor');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  Future<void> tolakPeminat(int peminatId) async {
    showLoading();
    var url = '${baseUrl}m/team-peminat/tolak?team_peminat_id=$peminatId';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        hideLoading();
        Get.snackbar(
          'Success',
          'Berhasil Tolak Investor',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.back();
        await fetchPeminatTeamApprove(globalTeamId.value!);
        await fetchPeminatTeamRequest(globalTeamId.value!);
        update();
      } else {
        hideLoading();
        print('Failed to Tolak Investor');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  Future<void> fetchPeminatTeamRequest(int id) async {
    var url = '${baseUrl}m/team-peminat/request?team_id=$id';
    print(url);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        peminatRequest.value = PeminatTeamRequestData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed peminatRequest with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error peminatRequest: $e');
    }
  }

  Future<void> fetchPeminatTeamApprove(int id) async {
    var url = '${baseUrl}m/team-peminat/approve?team_id=$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        peminatApprove.value = PeminatTeamApproveData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed peminatApprove with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error peminatApprove: $e');
    }
  }

  Future<void> fetchPeminatTeamDetail(int id) async {
    var url = '${baseUrl}m/team-peminat/detail?investor_id=$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        peminatDetail.value = PeminatDetailData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed peminatDetail with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error peminatDetail: $e');
    }
  }

  Future<void> deletePeminatApprove(int peminatId) async {
    showLoading();
    var url = '${baseUrl}m/team-peminat/delete?team_peminat_id=$peminatId';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        hideLoading();
        Get.snackbar(
          'Success',
          'Berhasil Delete Peminat Biaya',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.back();
        await fetchPeminatTeamApprove(globalTeamId.value!);
        update();
      } else {
        hideLoading();
        print('Failed to Delete');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  //peserta-modal
  final teamModal = TeamModalData().obs;
  final teamModalInvestor = TeamModalInvestorData().obs;
  final teamModalHistory = TeamModalHistoryData().obs;

  Future<void> fetchTeamModal(int id) async {
    var url = '${baseUrl}m/team-modal?team_id=$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamModal.value = TeamModalData.fromJson(jsonData);
      } else {
        // Error handling
        print('Request failed teamModal with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error teamModal: $e');
    }
  }

  Future<void> fetchTeamModalInvestor(int id) async {
    var url = '${baseUrl}m/team-modal/investor?team_id=$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamModalInvestor.value = TeamModalInvestorData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed teamModalHistory with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error teamModalHistory: $e');
    }
  }

  Future<void> fetchTeamModalHistory(int id) async {
    var url = '${baseUrl}m/team-modal/history?team_id=$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamModalHistory.value = TeamModalHistoryData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed teamModalInvestor with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error teamModalInvestor: $e');
    }
  }

  //peserta-event
  final eventByTeamId = EventByTeamIdData().obs;
  final eventTeamData = EventTeamData().obs;

  Future<void> fetchEventByTeamId(int id) async {
    var url = '${baseUrl}m/team-event?team_id=$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        eventByTeamId.value = EventByTeamIdData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed eventByTeamId with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error eventByTeamId: $e');
    }
  }

  Future<void> fetchEventTeam() async {
    var url = '${baseUrl}m/team-event';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        eventTeamData.value = EventTeamData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed eventTeamData with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error eventTeamData: $e');
    }
  }

  //peserta-document
  final judulDocumentController = TextEditingController();
  final urlDocumentController = TextEditingController();
  final documentData = DocumentTeamData().obs;
  var fileName = ''.obs;
  var filePdf = ''.obs;
  RxString selectedtahapDokumen = "".obs;
  RxList<String> tahapDokumen = RxList<String>([
    "2",
    "3",
    "4",
  ]);

  Future<void> fetchDocumentTeam(int teamid) async {
    var url = '${baseUrl}m/team-docs?team_id=$teamid';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        documentData.value = DocumentTeamData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed documentData with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error evedocumentDatantTeamData: $e');
    }
  }

  void pickPdf() async {
    final permissionStatus = await Permission.storage.status;
    if (permissionStatus != PermissionStatus.granted) {
      await Permission.storage.request();
    }

    final file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (file != null) {
      fileName.value = file.files.single.name;
      filePdf.value = file.files.single.path!;
    } else {
      fileName.value = 'No file selected';
    }
  }

  Future<void> uploadFile({
    required String judul,
    required String teamId,
    required String filePath,
    required String tahap,
  }) async {
    showLoading();
    String fileName = filePath.split('/').last;
    var url = '${baseUrl}m/team-docs/store';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_id'] = teamId;
    request.fields['judul'] = judul;
    request.fields['tahap'] = tahap;
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      filePath,
      filename: fileName,
    ));
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Berhasil Upload Dokumen',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        await fetchDocumentTeam(int.parse(teamId));
        await fetchDataStage(int.parse(teamId));
        update();
        Get.to(MateriView());
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Upload File',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan Upload file.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> uploadLinkVideo({
    required String judul,
    required String teamId,
    required String linkvideo,
  }) async {
    showLoading();

    var url = '${baseUrl}m/team-docs/store';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_id'] = teamId;
    request.fields['judul'] = judul;
    request.fields['url'] = linkvideo;
    request.fields['tahap'] = '1';
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Berhasil Upload Link Video',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        await fetchDocumentTeam(int.parse(teamId));
        await fetchDataStage(int.parse(teamId));
        update();
        Get.to(MateriView());
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Upload Link Video',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan Upload Link Video.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> updateFile(
      {String? filePath,
      required String judul,
      required String tahap,
      required String teamDocsId,
      required int teamId}) async {
    String? fileName;
    if (filePath != null) {
      fileName = filePath.split('/').last;
    }
    showLoading();
    var url = '${baseUrl}m/team-docs/update';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_docs_id'] = teamDocsId;
    request.fields['judul'] = judul;
    request.fields['tahap'] = tahap;
    if (filePath != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        filePath,
        filename: fileName!,
      ));
    }
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Berhasil Upload Dokumen',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        await fetchDocumentTeam(teamId);
        await fetchDataStage(teamId);
        update();
        Get.off(MateriView());
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Upload File',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan Upload file.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> updateLinkVideo({
    required String judul,
    required String teamDocsId,
    required String linkVideo,
    required int teamId,
  }) async {
    showLoading();
    var url = '${baseUrl}m/team-docs/update';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['team_docs_id'] = teamDocsId;
    request.fields['judul'] = judul;
    request.fields['tahap'] = '1';
    request.fields['url'] = linkVideo;
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Berhasil Upload Dokumen',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        await fetchDocumentTeam(teamId);
        await fetchDataStage(teamId);
        update();
        Get.off(MateriView());
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'Gagal Upload File',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan Upload file.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> deleteDocument(int id, int teamid) async {
    showLoading();
    var url = '${baseUrl}m/team-docs/delete?team_docs_id=$id';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        fetchDocumentTeam(teamid);
        update();
        hideLoading();
      } else {
        hideLoading();
        print('Failed to Delete');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  //registrasi Investor-pemodal
  final TeamListController teamListController = Get.put(TeamListController());
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final DealController dealController = Get.put(DealController());
  final globalInvestorId = RxnInt(0);
  Rx<File?> imagePemodal = Rx<File?>(null);
  Rx<File?> imagePemodalId = Rx<File?>(null);
  RxString selectedPekerjaan = "".obs;
  final pemodalData = PemodalData().obs;
  final teamPopular = TeamPopularData().obs;
  final teamAvailabe = TeamAvailableData().obs;
  final teamAvailabeHome = DataTeamAvailableHome().obs;
  final newsInvestor = NewsInvestorData().obs;
  final newsDetailInvestor = NewsDetailInvestorData().obs;
  final namaPemodalController = TextEditingController();
  final alamatPemodalController = TextEditingController();
  final emailPemodalController = TextEditingController();
  final noHpPemodalController = TextEditingController();

  RxList<String> pekerjaanPemodal = RxList<String>([
    "TK",
    "SD",
    "SMP",
    "SMA",
    "D1/D2/D3",
    "S1",
    "S2",
    "S3",
  ]);

  Future<void> getImageFromGalleryToPemodalFoto() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imagePemodal.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromGalleryToPemodalFotoId() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile != null) {
      imagePemodalId.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> fetchPemodal() async {
    loggedInUserId.value = box.read('loggedInUserId');
    var url = '${baseUrl}m/investor?user_id=$loggedInUserId';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        pemodalData.value = PemodalData.fromJson(jsonData);
        globalInvestorId.value = pemodalData.value.investor!.id;
        await fetchTeamPopular();
        await fetchTeamAvailabe();
        await fetchTeamAvailabeHome();
        await teamListController.fetchTeamList(globalInvestorId.value!);
        await favoriteController.fetchTeamWatchList(globalInvestorId.value!);
        await dealController.fetchMyTeam(globalInvestorId.value!);
      } else {
        // Error handling

        print(
            'Request failed pemodalData with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      await fetchTeamPopular();
      await fetchTeamAvailabe();
      await fetchTeamAvailabeHome();
      await teamListController.fetchTeamList(globalInvestorId.value!);
      await favoriteController.fetchTeamWatchList(globalInvestorId.value!);
      await dealController.fetchMyTeam(globalInvestorId.value!);
      print('Error pemodalData: $e');
    }
  }

  Future<void> registerPemodal({
    required String nama,
    required String alamat,
    required String email,
    required String noHp,
  }) async {
    showLoading();
    loggedInUserId.value = box.read('loggedInUserId');
    var url = '${baseUrl}m/investor/register';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    request.fields['user_id'] = loggedInUserId.value.toString();
    request.fields['nama'] = nama;
    if (imagePemodal.value != null && imagePemodal.value!.lengthSync() > 0) {
      request.files.add(
        http.MultipartFile('foto', imagePemodal.value!.readAsBytes().asStream(),
            imagePemodal.value!.lengthSync(),
            filename: imagePemodal.value!.path.split('/').last),
      );
    }
    if (imagePemodalId.value != null &&
        imagePemodalId.value!.lengthSync() > 0) {
      request.files.add(
        http.MultipartFile(
            'foto_id',
            imagePemodalId.value!.readAsBytes().asStream(),
            imagePemodalId.value!.lengthSync(),
            filename: imagePemodalId.value!.path.split('/').last),
      );
    }
    request.fields['pekerjaan'] = selectedPekerjaan.value;
    request.fields['alamat'] = alamat;
    request.fields['email'] = email;
    request.fields['nohp'] = noHp;
    request.headers.addAll(headers);
    try {
      var res = await request.send();
      if (res.statusCode == 200) {
        print('POST request success');
        var responseBody = await res.stream.bytesToString();
        var resJson = jsonDecode(responseBody);
        print(resJson);
        Get.snackbar(
          'Success',
          'Silahkan Tunggu di Approve',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        Get.offAll(
          const MainPageViewInvestors(
            initialPage: 0,
          ),
        );
      } else {
        hideLoading();
        Get.snackbar(
          'Failed',
          'gagal daftar sebagai pemodal',
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print('Response body: ${await res.stream.bytesToString()}');
      }
    } catch (e) {
      hideLoading();
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan registrasi.",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> fetchTeamPopular() async {
    var url =
        '${baseUrl}m/investor/team/popular?investor_id=${globalInvestorId.value}';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamPopular.value = TeamPopularData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed TeamPopular with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error PopularTeam: $e');
    }
  }

  Future<void> fetchTeamAvailabeHome() async {
    var url =
        '${baseUrl}m/investor/team/available-home?investor_id=${globalInvestorId.value}';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamAvailabeHome.value = DataTeamAvailableHome.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed teamAvailabeHome with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error teamAvailabeHome: $e');
    }
  }

  Future<void> fetchTeamAvailabe() async {
    var url =
        '${baseUrl}m/investor/team/available?investor_id=${globalInvestorId.value}';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamAvailabe.value = TeamAvailableData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed teamAvailabe with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error teamAvailabe: $e');
    }
  }

  Future<void> watchlistPost(int teamId) async {
    showLoading();
    var url =
        '${baseUrl}m/investor/watchlist/store?team_id=$teamId&investor_id=${globalInvestorId.value}';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        await teamListController.fetchTeamList(globalInvestorId.value!);
        await fetchTeamPopular();
        await fetchTeamAvailabeHome();
        await fetchTeamAvailabe();
        await favoriteController.fetchTeamWatchList(globalInvestorId.value!);
        update();
        hideLoading();
      } else {
        hideLoading();
        print('Failed to Add');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  Future<void> watchlistDelete(int teamId) async {
    showLoading();
    var url =
        '${baseUrl}m/investor/watchlist/delete?team_id=$teamId&investor_id=${globalInvestorId.value}';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        await teamListController.fetchTeamList(globalInvestorId.value!);
        await fetchTeamPopular();
        await fetchTeamAvailabeHome();
        await fetchTeamAvailabe();
        await favoriteController.fetchTeamWatchList(globalInvestorId.value!);
        update();
        hideLoading();
      } else {
        hideLoading();
        print('Failed to Delete');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  Future<void> fetchNewsInvestor() async {
    var url = '${baseUrl}m/news/investor';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        newsInvestor.value = NewsInvestorData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed newsInvestor with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error newsInvestor: $e');
    }
  }

  Future<void> fetchNewsDetailInvestor(int id) async {
    var url = '${baseUrl}m/news/investor?news_id=$id';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        newsDetailInvestor.value = NewsDetailInvestorData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed newsDetailInvestor with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error newsDetailInvestor: $e');
    }
  }

  Future<void> permintaanAksesData(
    int teamId,
  ) async {
    showLoading();
    var url =
        '${baseUrl}m/team-peminat/ajukan?team_id=$teamId&investor_id=${globalInvestorId.value}';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Berhasil Kirim Permintaan Akses Data',
          colorText: Colors.white,
          backgroundColor: Colors.teal[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        await teamListController.fetchTeamList(globalInvestorId.value!);
        await fetchTeamPopular();
        await fetchTeamAvailabeHome();
        await fetchTeamAvailabe();
        await favoriteController.fetchTeamWatchList(globalInvestorId.value!);
        update();
        Get.back();
        hideLoading();
      } else {
        hideLoading();
        print('Failed to Kirim Permintaan Akses Data');
      }
    } catch (e) {
      hideLoading();
      // Exception handling
      print('Exception: $e');
    }
  }

  RxInt daysStart = 0.obs;
  RxInt daysEnd = 0.obs;
  RxInt hoursStart = 0.obs;
  RxInt hoursEnd = 0.obs;
  RxInt minutesStart = 0.obs;
  RxInt minutesEnd = 0.obs;
  RxInt secondsStart = 0.obs;
  RxInt secondsEnd = 0.obs;

  Timer? _timerStart;
  Timer? _timerEnd;

  void _startCountdown(String target) {
    final targetDate = DateTime.parse(target);
    final now = DateTime.now();
    var difference = targetDate.difference(now).inSeconds;

    _timerStart = Timer.periodic(Duration(seconds: 1), (timer) {
      if (difference <= 0) {
        _timerStart?.cancel();
        update();
        return;
      }

      daysStart.value = (difference ~/ 60 ~/ 60 ~/ 24).abs();
      hoursStart.value = ((difference ~/ 60 ~/ 60) % 24).abs();
      minutesStart.value = ((difference ~/ 60) % 60).abs();
      secondsStart.value = (difference % 60).abs();

      difference -= 1;
    });
  }

  void _endCountdown(String target) {
    final targetDate = DateTime.parse(target);
    final now = DateTime.now();
    var difference = targetDate.difference(now).inSeconds;

    _timerEnd = Timer.periodic(Duration(seconds: 1), (timer) {
      if (difference <= 0) {
        _timerEnd?.cancel();
        update();
        return;
      }

      daysEnd.value = (difference ~/ 60 ~/ 60 ~/ 24).abs();
      hoursEnd.value = ((difference ~/ 60 ~/ 60) % 24).abs();
      minutesEnd.value = ((difference ~/ 60) % 60).abs();
      secondsEnd.value = (difference % 60).abs();

      difference -= 1;
    });
  }

  @override
  void onClose() {
    super.onClose();
    _timerStart!.cancel();
    // _timerEnd!.cancel();
  }

  final stageData = StageData().obs;

  Future<void> fetchDataStage(int team) async {
    var url = '${baseUrl}m/stage-schedule?team_id=$team';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        stageData.value = StageData.fromJson(jsonData);
        String startDate = stageData.value.stageSchedule!.startDate;
        String endDate = stageData.value.stageSchedule!.endDate;
        print(jsonData);
        _startCountdown(startDate);
        _endCountdown(endDate);
      } else {
        // Error handling
        print('Request failed stageData with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error stageData: $e');
    }
  }
}
