import 'dart:convert';
import 'package:http/http.dart' as http;

class GetStateful {
  final String? id, email, fullname, avatar;

  GetStateful({this.id, this.avatar, this.email, this.fullname});

  static Future<GetStateful> getStateful(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    var data = (jsonDecode(hasilResponse.body))["data"];

    return GetStateful(
      id: data["id"].toString(),
      fullname: data["first_name"] + " " + data["last_name"],
      avatar: data["avatar"],
      email: data["email"],
    );
  }
}
