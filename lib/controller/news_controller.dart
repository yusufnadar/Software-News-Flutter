import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:software_news/core/constants/end_points.dart';
import 'package:software_news/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController{
  RxList<News> newsList = <News>[].obs;

  RxBool isLoading = false.obs;


  Future<bool> getNews({int? page}) async {
    try{
      var res = await http.get(Uri.parse(EndPoints.baseUrl+page.toString() ??''));
      if (HttpStatus(res.statusCode).isOk) {
        newsList.addAll(List<News>.from((json.decode(res.body)).map((e) => News.fromJson(e)).toList()));
        return true;
      }else{
        Get.snackbar('Hata', res.body);
        return false;
      }
    }catch(e){
      Get.snackbar('Hata', e.toString());
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getNews(page: 1);
    update();
  }
}