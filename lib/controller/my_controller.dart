import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:in_prep/model/api_model.dart';
import 'package:http/http.dart' as http;

class MyController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  SampleApi sampleApiobj = SampleApi();
  Future fetchData() async {
    notifyListeners();
    final url = Uri.parse("https://dummyjson.com/users");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      sampleApiobj = SampleApi.fromJson(decodedData);
    } else {
      print("Api failed");
    }
    notifyListeners();
  }

  Future postData(
      {required String title,
      required String email,
      required String age}) async {
    final url = Uri.parse("https://dummyjson.com/users");
    final response = await http
        .post(url, body: {"firstName": title, "email": email, "age": age});
    if (response.statusCode == 200) {
      await fetchData();
    } else {
      print("Api failed");
    }
  }

  Future updateData(
      {required String id,
      required String title,
      required String email,
      required String age}) async {
    final url = Uri.parse("https://dummyjson.com/users");
    final response = await http
        .put(url, body: {"firstName": title, "email": email, "age": age});
    if (response.statusCode == 200) {
      await fetchData();
    } else {
      print("Api failed");
    }
  }

  Future deleteData({required String id}) async {
    final url = Uri.parse("https://dummyjson.com/users");
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      await fetchData();
    } else {
      print("Api failed");
    }
  }
}
