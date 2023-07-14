import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  final String? id, name, job, createdAt;

  HttpStateful({
    this.id,
    this.createdAt,
    this.job,
    this.name,
  });

  static Future<HttpStateful> connectApi(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilRespone = await http.post(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    var response = jsonDecode(hasilRespone.body);

    return HttpStateful(
      id: response["id"],
      createdAt: response["createdAt"],
      job: response["job"],
      name: response["name"],
    );
  }
}
