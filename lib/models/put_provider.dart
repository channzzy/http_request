import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PutProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get jumlahData => data.length;

  void connectApiProvider(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilRespone = await http.put(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    _data = jsonDecode(hasilRespone.body);
    notifyListeners();
  }
}
