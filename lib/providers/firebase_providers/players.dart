import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/player.dart';
import 'package:http/http.dart' as http;

class Players with ChangeNotifier {
  List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  Future<void> addPlayer(String name, String position, String image) async {
    DateTime datetimeNow = DateTime.now();
    Uri uri = Uri.parse(
        "https://http-req-3c85f-default-rtdb.firebaseio.com/players.json");
    try {
      final response = await http.post(
        uri,
        body: jsonEncode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
            "createdAt": datetimeNow.toString(),
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        _allPlayer.add(
          Player(
            id: jsonDecode(response.body)["name"].toString(),
            name: name,
            position: position,
            imageUrl: image,
            createdAt: datetimeNow,
          ),
        );
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> editPlayer(
      String id, String name, String position, String image) {
    Uri uri = Uri.parse(
        "https://http-req-3c85f-default-rtdb.firebaseio.com/players/$id.json");
    return http
        .patch(
      uri,
      body: jsonEncode(
        {
          "name": name,
          "position": position,
          "imageUrl": image,
        },
      ),
    )
        .then(
      (response) {
        Player selectPlayer =
            _allPlayer.firstWhere((element) => element.id == id);
        selectPlayer.name = name;
        selectPlayer.position = position;
        selectPlayer.imageUrl = image;
        notifyListeners();
      },
    );
  }

  Future<void> deletePlayer(String id) {
    Uri uri = Uri.parse(
        "https://http-req-3c85f-default-rtdb.firebaseio.com/players/$id.json");
    return http.delete(uri).then(
          (response) => {
            _allPlayer.removeWhere((element) => element.id == id),
            notifyListeners()
          },
        );
  }

  Future<void> initialData() async {
    Uri uri = Uri.parse(
        "https://http-req-3c85f-default-rtdb.firebaseio.com/players.json");
    var hasilGetData = await http.get(uri);

    if (hasilGetData.body.isNotEmpty) {
      var dataResponse = jsonDecode(hasilGetData.body) as Map<String, dynamic>?;

      if (dataResponse != null) {
        dataResponse.forEach((key, value) {
          _allPlayer.add(
            Player(
              createdAt:
                  DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]),
              id: value["id"],
              imageUrl: value["imageUrl"],
              name: value["name"],
              position: value["position"],
            ),
          );
        });

        notifyListeners();
      }
    }
  }
}
