import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shop/constants/api_path.dart';
import 'package:shop/module/dashboard/model/new_arrivals_model.dart';
import 'package:shop/module/dashboard/model/new_shops_model.dart';
import 'package:shop/module/dashboard/model/products_model.dart';
import 'package:shop/module/dashboard/model/trending_product_model.dart';
import 'package:shop/module/dashboard/model/trending_seller_model.dart';

import '../app_exceptions.dart';

class ApiService {
  ApiService._();
  static final ApiService _instance = ApiService._();
  static ApiService get instance => _instance;
  static const int TIME_OUT_DURATION = 2000;

//GET TRENDING SELLER
  Future getTrendingSeller() async {
    Uri uri = Uri.parse(baseUrl + trendingSellerUrl);
    String fileName = "trend_seller_data.json";
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    File file = new File(tempPath + "/" + fileName);
    if (file.existsSync()) {
      //Load from cache
      final jsonData = file.readAsStringSync();

      final responseData = json.decode(jsonData);
      final listData = <TrendingSellerModel>[];
      responseData.first.forEach((item) {
        listData.add(TrendingSellerModel.fromJson(item!));
      });

      return listData;
    } else {
      //Load from Api
      try {
        http.Response response = await http.get(uri);
        // .timeout(Duration(seconds: TIME_OUT_DURATION));
        if (response.statusCode == 200) {
          final jsonResponse = response.body;

          final responseData = json.decode(jsonResponse);
          final listData = <TrendingSellerModel>[];
          responseData.first.forEach((item) {
            listData.add(TrendingSellerModel.fromJson(item!));
          });

          file.writeAsStringSync(jsonResponse,
              flush: true, mode: FileMode.write);
          return listData;
        } else {
          print(response.body);
          return;
        }
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException(
            'API not responded in time', uri.toString());
      } catch (e) {
        print(e.toString());
        throw e;
      }
    }
  }

//GET TRENDING PRODUCTS
  Future getTrendingProduct() async {
    Uri uri = Uri.parse(baseUrl + trendingProductUrl);
    String fileName = "trend_product_data.json";
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    File file = new File(tempPath + "/" + fileName);
    if (file.existsSync()) {
      //Load from cache
      final jsonData = file.readAsStringSync();

      final responseData = json.decode(jsonData);
      final listData = <TrendingProductModel>[];
      responseData.first.forEach((item) {
        listData.add(TrendingProductModel.fromJson(item!));
      });
      return listData;
    } else {
      //Load from Api
      try {
        http.Response response = await http.get(uri);
        // .timeout(Duration(seconds: TIME_OUT_DURATION));
        if (response.statusCode == 200) {
          final jsonResponse = response.body;
          final responseData = json.decode(jsonResponse);
          final listData = <TrendingProductModel>[];
          responseData.first.forEach((item) {
            listData.add(TrendingProductModel.fromJson(item!));
          });

          file.writeAsStringSync(jsonResponse,
              flush: true, mode: FileMode.write);
          return listData;
        } else {
          print(response.body);
          return;
        }
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException(
            'API not responded in time', uri.toString());
      } catch (e) {
        print(e.toString());
        throw e;
      }
    }
  }

//GET NEW ARRIVALS
  Future getNewArrivals() async {
    Uri uri = Uri.parse(baseUrl + newArrivalUrl);

    String fileName = "arrival_data.json";
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    File file = new File(tempPath + "/" + fileName);
    if (file.existsSync()) {
      //Load from cache
      final jsonData = file.readAsStringSync();

      final responseData = json.decode(jsonData);
      final listData = <NewArrivalsModel>[];
      responseData.first.forEach((item) {
        listData.add(NewArrivalsModel.fromJson(item!));
      });
      return listData;
    } else {
      //Load from Api
      try {
        http.Response response = await http.get(uri);
        // .timeout(Duration(seconds: TIME_OUT_DURATION));
        if (response.statusCode == 200) {
          final jsonResponse = response.body;
          final responseData = json.decode(jsonResponse);
          final listData = <NewArrivalsModel>[];
          responseData.first.forEach((item) {
            listData.add(NewArrivalsModel.fromJson(item!));
          });
          file.writeAsStringSync(jsonResponse,
              flush: true, mode: FileMode.write);
          return listData;
        } else {
          print(response.body);
          return;
        }
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException(
            'API not responded in time', uri.toString());
      } catch (e) {
        print(e.toString());
        throw e;
      }
    }
  }

//GET NEW SHOPS
  Future getNewShops() async {
    Uri uri = Uri.parse(baseUrl + newShopUrl);
    String fileName = "shop_data.json";
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    File file = new File(tempPath + "/" + fileName);
    if (file.existsSync()) {
      //Load from cache
      final jsonData = file.readAsStringSync();

      final responseData = json.decode(jsonData);
      final listData = <NewShopsModel>[];
      responseData.first.forEach((item) {
        listData.add(NewShopsModel.fromJson(item!));
      });
      return listData;
    } else {
      //Load from Api
      try {
        http.Response response = await http.get(uri);
        // .timeout(Duration(seconds: TIME_OUT_DURATION));
        if (response.statusCode == 200) {
          final jsonResponse = response.body;
          final responseData = json.decode(jsonResponse);
          final listData = <NewShopsModel>[];
          responseData.first.forEach((item) {
            listData.add(NewShopsModel.fromJson(item!));
          });
          file.writeAsStringSync(jsonResponse,
              flush: true, mode: FileMode.write);
          return listData;
        } else {
          print(response.body);
          return;
        }
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException(
            'API not responded in time', uri.toString());
      } catch (e) {
        print(e.toString());
        throw e;
      }
    }
  }

//GET PRODUCTS
  Future getProducts() async {
    Uri uri = Uri.parse(baseUrl + productUrl);
    String fileName = "product_data.json";
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    File file = new File(tempPath + "/" + fileName);
    if (file.existsSync()) {
      //Load from cache
      final jsonData = file.readAsStringSync();

      final responseData = json.decode(jsonData);
      final listData = <ProductsModel>[];
      responseData.first.forEach((item) {
        listData.add(ProductsModel.fromJson(item!));
      });
      return listData;
    } else {
      //Load from Api
      try {
        
        http.Response response = await http.get(uri);
        // .timeout(Duration(seconds: TIME_OUT_DURATION));
        if (response.statusCode == 200) {
          final jsonResponse = response.body;
          final responseData = json.decode(jsonResponse);
          final listData = <ProductsModel>[];
          responseData.first.forEach((item) {
            listData.add(ProductsModel.fromJson(item!));
          });

          file.writeAsStringSync(jsonResponse,
              flush: true, mode: FileMode.write);
          return listData;
        } else {
          print(response.body);
          return;
        }
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException(
            'API not responded in time', uri.toString());
      } catch (e) {
        print(e.toString());
        throw e;
      }
    }
  }
}
