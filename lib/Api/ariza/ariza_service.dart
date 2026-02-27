import 'package:imei/library.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ArizaService {
  Future<ArizaModel?> arizaService() async {
    try {
      String token = Hive.box('token').get('token');
      print('\n=== GET ARIZA LIST ===');
      print('Token: ${token.substring(0, 20)}...');
      var _response = await http.get(
        Uri.parse('http://bekpolatnormurodov.uz/imeiApi/api/v1/ariza/'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
      print('GET Response status: ${_response.statusCode}');
      
      if (_response.statusCode == 200) {
        var json = jsonDecode(_response.body);
        var data = ArizaModel.fromJson(json);
        print('✅ Data loaded: ${data.totalRecords} records');
        print('=================================\n');
        return data;
      } else {
        print('Error: ${_response.statusCode} - ${_response.body}');
        return null;
      }
    } catch (e) {
      print('Exception in arizaService: $e');
    }
    return null;
  }
}