import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import 'home_model.dart';

final box = GetStorage();
String baseUrl = "https://temp-app-ecom.herokuapp.com/";
late HomeModels dataHomeModels;

Future getApi({required String model, required String link, context}) async {
  var jsonBody = await http.get(Uri.parse(baseUrl + link), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${box.read("token")}',
  });

  final jsonResponse = json.decode(jsonBody.body);
  dataHomeModels = HomeModels.fromJson(jsonResponse);
  // print(jsonBody.statusCode);
}
