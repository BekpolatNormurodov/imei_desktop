import 'dart:io';

import 'package:imei/library.dart';
import 'package:http/http.dart' as http;

class ArizaPost {
  Future<Map<String, dynamic>> arizaPost({
    required String imei,
    required String last_simcard,
    required String model,
    required String color,
    required String jshir,
    required String phone_number,
    required String fish,
  }) async {
    try {
      String token = Hive.box('token').get('token');
      print('\n=== POST ARIZA ===');
      print('Token: ${token.substring(0, 20)}...');
      
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://bekpolatnormurodov.uz/imeiApi/api/v1/ariza/'),
      );

      request.fields.addAll({
        'imeiApi': imei,          // ⭐ Server bu maydonni talab qilmoqda!
        'last_simcard': last_simcard,
        'model': model,
        'color': color,
        'jshir': jshir,
        'phone_number': phone_number,
        'fish': fish,
      });

      request.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token'
      });

      print('Fields:');
      request.fields.forEach((key, value) {
        print('  $key: $value');
      });

      http.StreamedResponse response = await request.send();
      var responseBody = await response.stream.bytesToString();
      
      print('\nPOST Response status: ${response.statusCode}');
      print('Response body length: ${responseBody.length}');
      if(responseBody.length < 500) {
        print('Response body: $responseBody');
      } else {
        print('Response body (first 500 chars): ${responseBody.substring(0, 500)}...');
      }
      
      if (response.statusCode == 201 || response.statusCode == 200) {
        print('\u2705 Ariza muvaffaqiyatli yaratildi!\n');
        try {
          return {
            'success': true,
            'message': "Ariza muvaffaqiyatli yaratildi",
            'data': jsonDecode(responseBody)
          };
        } catch (e) {
          print('JSON decode error: $e');
          return {
            'success': true,
            'message': "Ariza yaratildi (JSON parse qilib bo'lmadi)",
          };
        }
      } else {
        print('\u274c Xatolik: ${response.statusCode}\n');
        return {
          'success': false,
          'message': 'Server xatolik qaytardi: ${response.statusCode}',
          'error': responseBody.length > 200 ? responseBody.substring(0, 200) : responseBody
        };
      }
    } catch (e) {
      print('Exception in arizaPost: $e');
      return {
        'success': false,
        'message': 'Xatolik: $e',
      };
    }
  }
}
