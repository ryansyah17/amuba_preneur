import 'dart:convert';

import 'package:entrepreneur_app/app/api/base_url.dart';
import 'package:entrepreneur_app/app/data/investor/data_team_detail.dart';
import 'package:entrepreneur_app/app/data/investor/data_tim_list.dart';
import 'package:entrepreneur_app/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TeamListController extends GetxController {
  final teamList = TeamListData().obs;
  final teamDetail = DataTeamDetail().obs;
  @override
  void onInit() {
    super.onInit();
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

  Future<void> fetchTeamList(int id) async {
    var url = '${baseUrl}m/team/list?investor_id=$id';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamList.value = TeamListData.fromJson(jsonData);
      } else {
        // Error handling
        print('Request failed teamList with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error teamList: $e');
    }
  }

  Future<void> fetchTeamListDetail(int teamId) async {
    var url = '${baseUrl}m/investor/team/detail?team_id=$teamId';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamDetail.value = DataTeamDetail.fromJson(jsonData);
      } else {
        // Error handling
        print('Request failed teamDetail with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error teamDetail: $e');
    }
  }
}
