import 'dart:convert';

import 'package:entrepreneur_app/app/api/base_url.dart';
import 'package:entrepreneur_app/app/data/investor/data_tim_watchlist.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FavoriteController extends GetxController {
  final teamWatchList = TeamWatchListData().obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchTeamWatchList(int id) async {
    var url = '${baseUrl}m/investor/watchlist?investor_id=$id';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        teamWatchList.value = TeamWatchListData.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed TeamWatchListData with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error TeamWatchListData: $e');
    }
  }
}
