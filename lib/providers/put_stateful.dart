import 'dart:convert';

import 'package:http/http.dart' as http;

class PutStateful {
  final String? name;
  final String? job;
  final String? updatedAt;

  PutStateful({this.name, this.job, this.updatedAt});

  static Future<PutStateful> putStateful(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users/");

    var putResponse = await http.put(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    var response = jsonDecode(putResponse.body);

    return PutStateful(
      name: response["name"],
      job: response["job"],
      updatedAt: response["updatedAt"],
    );
  }
}
