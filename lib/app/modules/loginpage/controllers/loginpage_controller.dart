import 'dart:convert';

import 'package:entrepreneur_app/app/modules/loginpage/views/peserta/loginpage_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginpageController extends GetxController {
  RxBool isHidden = true.obs;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController emailResetController;
  late TextEditingController passwordResetController;
  late TextEditingController rePasswordResetController;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailResetController = TextEditingController();
    passwordResetController = TextEditingController();
    rePasswordResetController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailResetController.dispose();
    passwordResetController.dispose();
    rePasswordResetController.dispose();
  }

  Future<void> changePassword(String newPassword, String email) async {
    try {
      var apiUrl = 'https://amuba.sisatap.com/api/auth/ganti-password';
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      Map<String, dynamic> body = {
        'email': email,
        'password': newPassword,
      };
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        print(response.body);
        Get.off(LoginpageView());
      } else {
        print('Gagal mengganti password');
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
    }
  }
}
