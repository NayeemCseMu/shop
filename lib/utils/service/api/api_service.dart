import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shop/constants/api_path.dart';
import 'package:shop/module/dashboard/model/new_arrivals_model.dart';
import 'package:shop/module/dashboard/model/new_shops_model.dart';
import 'package:shop/module/dashboard/model/products_model.dart';
import 'package:shop/module/dashboard/model/trending_product_model.dart';
import 'package:shop/module/dashboard/model/trending_seller_model.dart';

class ApiService {
  ApiService._();
  static final ApiService _instance = ApiService._();
  static ApiService get instance => _instance;
  static const int TIME_OUT_DURATION = 2000;

//GET TRENDING SELLER
  Future getTrendingSeller() async {
    Uri uri = Uri.parse(baseUrl + trendingSellerUrl);
    try {
      // DialogHelper.instance.showLoading(message: "Loading");
      http.Response response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final listData = <TrendingSellerModel>[];
        responseData.first.forEach((item) {
          print(item['slNo']);
          print(item['sellerName']);
          listData.add(TrendingSellerModel.fromJson(item!));
        });
        return listData;
      } else {
        print(response.body);
        return;
      }
    } on SocketException {
      throw "";
    } on TimeoutException {
      print("time out");
      throw "";
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

//GET TRENDING PRODUCTS
  Future getTrendingProduct() async {
    Uri uri = Uri.parse(baseUrl + trendingProductUrl);
    try {
      // DialogHelper.instance.showLoading(message: "Loading");
      http.Response response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final listData = <TrendingProductModel>[];
        responseData.first.forEach((item) {
          print(item['slNo']);
          print(item['sellerName']);
          listData.add(TrendingProductModel.fromJson(item!));
        });
        return listData;
      } else {
        print(response.body);
        return;
      }
    } on SocketException {
      throw "";
    } on TimeoutException {
      print("time out");
      throw "";
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

//GET NEW ARRIVALS
  Future getNewArrivals() async {
    Uri uri = Uri.parse(baseUrl + newArrivalUrl);
    try {
      // DialogHelper.instance.showLoading(message: "Loading");
      http.Response response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final listData = <NewArrivalsModel>[];
        responseData.first.forEach((item) {
          print(item['slNo']);
          print(item['sellerName']);
          listData.add(NewArrivalsModel.fromJson(item!));
        });
        return listData;
      } else {
        print(response.body);
        return;
      }
    } on SocketException {
      throw "";
    } on TimeoutException {
      print("time out");
      throw "";
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

//GET NEW SHOPS
  Future getNewShops() async {
    Uri uri = Uri.parse(baseUrl + newShopUrl);
    try {
      // DialogHelper.instance.showLoading(message: "Loading");
      http.Response response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final listData = <NewShopsModel>[];
        responseData.first.forEach((item) {
          print(item['slNo']);
          print(item['sellerName']);
          listData.add(NewShopsModel.fromJson(item!));
        });
        return listData;
      } else {
        print(response.body);
        return;
      }
    } on SocketException {
      throw "";
    } on TimeoutException {
      print("time out");
      throw "";
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

//GET PRODUCTS
  Future getProducts() async {
    Uri uri = Uri.parse(baseUrl + productUrl);
    try {
      // DialogHelper.instance.showLoading(message: "Loading");
      http.Response response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final listData = <ProductsModel>[];
        responseData.first.forEach((item) {
          print(item['slNo']);

          listData.add(ProductsModel.fromJson(item!));
        });
        return listData;
      } else {
        print(response.body);
        return;
      }
    } on SocketException {
      throw "";
    } on TimeoutException {
      print("time out");
      throw "";
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
