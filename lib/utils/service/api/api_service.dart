import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shop/constants/api_path.dart';
import 'package:shop/module/dashboard/model/trending_seller_model.dart';

class ApiService {
  ApiService._();
  static final ApiService _instance = ApiService._();
  static ApiService get instance => _instance;
  static const int TIME_OUT_DURATION = 20;
  /*-------------------Trending Seller Service-------------------*/
  Future getTrendingSeller() async {
    Uri uri = Uri.parse(baseUrl + trendingSellerUrl);
    try {
      // DialogHelper.instance.showLoading(message: "Loading");
      http.Response response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      if (response.statusCode != 200) {
        print(response.body);
        return;
      } else {
        final responseData = json.decode(response.body);
        final listData = <TrendingSellerModel>[];
        responseData.first.forEach((item) {
          print(item['slNo']);
          print(item['sellerName']);
          listData.add(TrendingSellerModel.fromJson(item!));
        });
        return listData;
      }
    } on SocketException {
      throw "";
    } on TimeoutException {
      print("time out");
      throw "";
    } catch (e) {
      print(e.toString());
      throw e;
    } finally {
      // DialogHelper.instance.hideLoading();
    }
  }
}
