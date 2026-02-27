// import 'dart:io';

// import 'package:imei/library.dart';
// import 'package:http/http.dart' as http;

// class ITSPost {
//   Future itsPost({
//     required String imei,
//     required String model,
//   }) async {
//     var request = await http.MultipartRequest(
//       'post',
//       Uri.parse('http://bekpolatnormurodov.uz/imeiApi/api/v1/lostdeviceregister/'),
//     );

//     request.fields.addAll({
//       'imei': imei,
//       'model': model,
//     });

//     String token = Hive.box('token').get('token');
//     request.headers.addAll({
//        HttpHeaders.authorizationHeader: 'Bearer $token'
//     });

//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 201) {
//       var data = await response.stream.bytesToString();
//       print("object");
//       return jsonDecode(data);
//     }
//   }
// }