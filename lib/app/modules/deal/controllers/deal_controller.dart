import 'dart:convert';

import 'package:entrepreneur_app/app/api/base_url.dart';
import 'package:entrepreneur_app/app/data/investor/data_my_team.dart';
import 'package:entrepreneur_app/app/data/investor/data_my_team_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DealController extends GetxController {
  final myTeam = MyTeamData().obs;
  final myTeamDetail = MyTeamDetailData().obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchMyTeam(int id) async {
    var url = '${baseUrl}m/investor/my-team?investor_id=$id';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        myTeam.value = MyTeamData.fromJson(jsonData);
      } else {
        // Error handling
        print('Request failed myTeam with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error myTeam: $e');
    }
  }

  Future<void> fetchMyTeamDetail(int teamId) async {
    var url = '${baseUrl}m/investor/my-team/detail?team_id=$teamId';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        myTeamDetail.value = MyTeamDetailData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed myTeamDetail with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error myTeamDetail: $e');
    }
  }
}
