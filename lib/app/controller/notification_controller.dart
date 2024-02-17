import 'dart:convert';

import 'package:entrepreneur_app/app/api/base_url.dart';
import 'package:entrepreneur_app/app/data/data_notifikasi.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  var notifications = DataNotifikasi().obs;
  RxnInt loggedInUserId = RxnInt(0);
  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    final box = GetStorage();
    loggedInUserId.value = box.read('loggedInUserId');
    try {
      final response = await http
          .get(Uri.parse('${baseUrl}m/notif?user_id=${loggedInUserId.value}'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        notifications.value = DataNotifikasi.fromJson(jsonData);
      } else {
        // Error handling
        print('Failed to fetch notifications');
      }
    } catch (e) {
      // Exception handling
      print('Exception: $e');
    }
  }

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

  Future<void> tandaiDiBacaSemua() async {
    showLoading();
    var url = '${baseUrl}m/notif/tandai-semua?user_id=${loggedInUserId.value}';
    try {
      final response = await http.post(Uri.parse(url));
      print(url);
      if (response.statusCode == 200) {
        await fetchNotifications();
        update();
        hideLoading();
        Get.back();
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
}
