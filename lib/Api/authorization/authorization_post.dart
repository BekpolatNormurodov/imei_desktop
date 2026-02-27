import 'package:imei/library.dart';
import 'package:http/http.dart' as http;

class AuthorizationPost {
  Future authorizationPost({
    required String phone,
    required String jton,
  }) async {
    var response = await http.post(
      Uri.parse('https://bekpolatnormurodov.uz/imeiApi/api/v1/token/'),
      body: jsonEncode({'username': phone,
      'password': jton,})
    );

    // request.fields.addAll({
    //   'username': phone,
    //   'password': jton,
    // });

    // http.StreamedResponse response = await request.send();
      print(response.statusCode);
    if (response.statusCode >= 200 || response.statusCode < 300) {
      var data =  response.body;
      await Hive.box('token').put(
        'token',
        jsonDecode(data)["access"]
      );

      // print(Hive.box("token").get("token"));
      return jsonDecode(data);
    }
  }
}