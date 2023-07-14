import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  Uri? url;

  void getData(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilReponse = await http.get(url!);

    if (hasilReponse.statusCode == 200) {
      _data = (json.decode(hasilReponse.body))["data"];
      notifyListeners();
      handlingStatusCode(context, "BERHASIL GET DATA");
    } else {
      // gagal mengambil data dari server
      handlingStatusCode(context, "ERROR ${hasilReponse.statusCode}");
    }
  }

  void deleteData(BuildContext context) async {
    var hasilResponse = await http.delete(url!);

    if (hasilResponse.statusCode == 204) {
      _data = {};
      notifyListeners();
      handlingStatusCode(context, "Data Berhasil Di Hapus");
    } else {
      handlingStatusCode(context, "Data Tidak Ada");
    }
  }

  handlingStatusCode(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 700),
      ),
    );
  }
}
