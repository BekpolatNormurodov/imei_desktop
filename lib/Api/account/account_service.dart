import 'package:imei/library.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class AccountService {
  Future<AccountModel?> accountService() async {
    try {
      String token = Hive.box('token').get('token');
      var _response = await http.get(
        Uri.parse('http://bekpolatnormurodov.uz/imeiApi/api/v1/profile/'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
        print(_response.statusCode);
      if (_response.statusCode == 200) {
        var json = jsonDecode(_response.body);
       var data = AccountModel.fromJson(json);
        return data;
      } else {
        return jsonDecode(_response.body);
      }
    } catch (e) {}
    return null;
  }
}