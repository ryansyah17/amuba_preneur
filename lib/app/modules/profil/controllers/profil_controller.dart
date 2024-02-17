import 'dart:convert';

import 'package:entrepreneur_app/app/api/base_url.dart';
import 'package:entrepreneur_app/app/data/data_peraturan.dart';
import 'package:entrepreneur_app/app/data/faq_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfilController extends GetxController {
  final faqData = FaqData().obs;
  final peraturanData = DataPeraturan().obs;
  @override
  void onInit() {
    fetchFaqData();
    fetchPeraturan();
    super.onInit();
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

  Future<void> fetchPeraturan() async {
    var url = '${baseUrl}m/peraturan';
    try {
      print(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        peraturanData.value = DataPeraturan.fromJson(jsonData);
      } else {
        // Error handling
        print(
            'Request failed peraturanData with status: ${response.statusCode}.');
      }
    } catch (e) {
      // Exception handling
      print('Error peraturanData: $e');
    }
  }
}
