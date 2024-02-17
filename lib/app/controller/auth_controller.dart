import 'dart:convert';

import 'package:entrepreneur_app/app/api/base_url.dart';
import 'package:entrepreneur_app/app/data/auth_model.dart';
import 'package:entrepreneur_app/app/modules/loginpage/views/peserta/loginpage_view.dart';
import 'package:entrepreneur_app/app/modules/mainpage/views/investors/mainpage_view.dart';
import 'package:entrepreneur_app/app/modules/mainpage/views/peserta/mainpage_view.dart';
import 'package:entrepreneur_app/app/modules/register/controllers/register_controller.dart';
import 'package:entrepreneur_app/app/modules/register/views/investors/register_investors.dart';
import 'package:entrepreneur_app/app/modules/register/views/otp_screen_email.dart';
import 'package:entrepreneur_app/app/modules/register/views/peserta/register_view.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var token = "".obs;
  final box = GetStorage();
  RxnInt loggedInUserId = RxnInt(0);
  var email = ''.obs;
  var nohp = ''.obs;
  var user = User().obs;

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

  void login(String username, String password) async {
    showLoading();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    box.write('fcm_token', fcmToken);
    var header = {
      "Accept": "application/json",
    };
    var url = "${baseUrl}auth/login";

    try {
      var response = await http.post(Uri.parse(url), headers: header, body: {
        "username": username,
        "password": password,
        "fcm_token": box.read('fcm_token') ?? '',
      });

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var datauser = data['user'];
        loggedInUserId.value = datauser['id'];
        email.value = datauser['email'];
        nohp.value = datauser['nohp'];
        datauser['fcm_token'] = fcmToken;
        user.value = User.fromJson(datauser);
        box.write("login", true);
        box.write('loggedInUserId', loggedInUserId.value);
        box.write('fcm_token', data['fcm_token']);
        box.write("token", data['token']);
        box.write('password', data['password']);
        box.write('email', email.value);
        box.write('nohp', nohp.value);
        box.write("user", user.value);
        print(datauser);
        print(loggedInUserId.value);
        print('ini email${box.read('nohp')}');
        if (user.value.type == 'peserta') {
          Get.offAll(const MainPageView(initialPage: 0));
          Get.snackbar(
            "Success",
            "Login sebagai Peserta Berhasil",
            colorText: Colors.white,
            backgroundColor: pembeda,
            icon: const Icon(Icons.check, color: Colors.white),
            snackPosition: SnackPosition.TOP,
          );
        } else if (user.value.type == 'investor') {
          Get.offAll(const MainPageViewInvestors(initialPage: 0));
          Get.snackbar(
            "Success",
            "Login sebagai Investor Berhasil",
            colorText: Colors.white,
            backgroundColor: pembeda,
            icon: const Icon(Icons.check, color: Colors.white),
            snackPosition: SnackPosition.TOP,
          );
        }
      } else {
        hideLoading();
        Get.snackbar(
          "Failed",
          "Gagal Login: Username atau Password Salah}",
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      hideLoading();
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat melakukan login. $error",
        colorText: Colors.white,
        backgroundColor: Colors.red[300],
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void registerPeserta({
    required String name,
    required String username,
    required String email,
    required String noHp,
    required String pass,
    required String type,
  }) async {
    Map data = {
      'name': name,
      'nohp': noHp,
      'username': username,
      'password': pass,
      'email': email,
      'type': type,
    };

    String body = json.encode(data);
    var url = '${baseUrl}auth/register';
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Sukses",
          "Berhasil Registrasi",
          colorText: Colors.white,
          backgroundColor: pembeda,
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
        print(body);
        Get.offAll(LoginpageView());
      } else {
        Get.snackbar(
          "Failed",
          response.body,
          colorText: Colors.white,
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.back();
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

  void checkLogin() {
    if (box.read("login") == true) {
      token.value = box.read("token");
      loggedInUserId.value = box.read('loggedInUserId');
      user.value = User.fromJson(box.read("user"));
      if (user.value.type == 'peserta') {
        Get.offAll(
          const MainPageView(
            initialPage: 0,
          ),
        );
      } else if (user.value.type == 'investor') {
        Get.offAll(
          const MainPageViewInvestors(
            initialPage: 0,
          ),
        );
      }
    } else {
      Get.toNamed("/loginpage");
    }
  }

  void logout() {
    box.remove("login");
    box.remove("user");
    box.remove('fcm_Token');
    box.remove("loggedInUserId");
    box.remove("token");
    box.remove("password");
    box.write("login", false);
    Get.offAllNamed("/loginpage");
  }

  Future<void> deleteToken(String fcm) async {
    var url = 'https://amuba.sisatap.com/api/auth/hapus-token?fcm_token=$fcm';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('Token berhasil dihapus');
      } else {
        print('Gagal menghapus token');
      }
    } catch (e) {
      print('Terjadi error: $e');
    }
  }

  final RegisterController registerController = Get.put(RegisterController());
  var countryDial = "+62".obs;
  Future<void> cekAkunPeserta(String username, nohp, email) async {
    var url =
        '${baseUrl}auth/cek-akun?username=$username&nohp=$nohp&email=$email';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      var data = jsonDecode(response.body);
      if (data['success'] == false) {
        Get.snackbar('Failed', data['message'],
            backgroundColor: Colors.red[300],
            colorText: putih,
            icon: Icon(
              Icons.warning,
              color: putih,
            ));
      } else {
        String otp = generateOTPPeserta(5);
        print(otp);
        String email = registerController.emailController.text;
        sendAktivasiEmailPeserta(email, otp);
        Get.defaultDialog(title: 'Loading', middleText: 'Please wait...');
        Future.delayed(Duration(seconds: 5), () {
          Get.back();
          Get.snackbar(
            'Success',
            'Kode Otp Berhasil Dikirim',
            backgroundColor: pembeda,
            colorText: putih,
            snackPosition: SnackPosition.TOP,
          );
          Get.off(
            OTPScreenEmail(
              name:
                  '${registerController.firstNameController.text} ${registerController.lastNameController.text}',
              username: registerController.usernameController.text,
              pass: registerController.passwordController.text,
              countryDial: countryDial.value,
              number: registerController.phoneNumberController.text,
              otp: otp,
              email: registerController.emailController.text,
              type: 'peserta',
            ),
          );
        });
        print(
            '${registerController.firstNameController.text} ${registerController.lastNameController.text}');
        print(registerController.usernameController.text);
        print(registerController.passwordController.text);
        print(registerController.phoneNumberController.text);
        print(registerController.emailController.text);
      }
      print(data['success']);
    } catch (e) {
      // Exception handling
      print('Exception: $e');
    }
  }

  Future<void> cekAkunInvestor(String username, nohp, email) async {
    var url =
        '${baseUrl}auth/cek-akun?username=$username&nohp=$nohp&email=$email';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      var data = jsonDecode(response.body);
      if (data['success'] == false) {
        Get.snackbar('Failed', data['message'],
            backgroundColor: Colors.red[300],
            colorText: putih,
            icon: Icon(
              Icons.warning,
              color: putih,
            ));
      } else {
        String otp = generateOTPInvestor(5);
        print(otp);
        String email = registerController.emailController.text;
        sendAktivasiEmailInvestor(email, otp);
        Get.defaultDialog(title: 'Loading', middleText: 'Please wait...');
        Future.delayed(Duration(seconds: 5), () {
          Get.back();
          Get.snackbar(
            'Success',
            'Kode Otp Berhasil Dikirim',
            backgroundColor: pembeda,
            colorText: putih,
            snackPosition: SnackPosition.TOP,
          );
          Get.to(
            OTPScreenEmail(
              name:
                  '${registerController.firstNameController.text} ${registerController.lastNameController.text}',
              username: registerController.usernameController.text,
              pass: registerController.passwordController.text,
              countryDial: countryDial.value,
              number: registerController.phoneNumberController.text,
              otp: otp,
              email: registerController.emailController.text,
              type: 'investor',
            ),
          );
        });
        print(
            '${registerController.firstNameController.text} ${registerController.lastNameController.text}');
        print(registerController.usernameController.text);
        print(registerController.passwordController.text);
        print(registerController.phoneNumberController.text);
        print(registerController.emailController.text);
      }
      print(data['success']);
    } catch (e) {
      // Exception handling
      print('Exception: $e');
    }
  }
}
