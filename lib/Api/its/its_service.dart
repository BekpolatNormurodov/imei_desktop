// import 'dart:io';
// import 'package:imei/library.dart';
// import 'package:http/http.dart' as http;

// class ITSService {
//   Future<ITSModel?> itsService() async {
//     try {
//       String token = Hive.box('token').get('token');
//       var _response = await http.get(
//         Uri.parse('http://bekpolatnormurodov.uz/imeiApi/api/v1/lostdeviceregister/'),
//         headers: {
//           HttpHeaders.authorizationHeader: 'Bearer $token',
//         },
//       );
//       if (_response.statusCode == 200) {
//         var json = jsonDecode(_response.body);
//         var data = ITSModel.fromJson(json);
//         // print(json);
//         return data;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print("Exception: $e");
//       return null;
//     }
//   }
// }
