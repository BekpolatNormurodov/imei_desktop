// import 'package:imei/library.dart';
// import 'package:http/http.dart' as http;

// class AccountPost {
//   Future accountPost({
//     required String fio,
//     required String region,
//     required String boshqarma,
//     required String lavozim,
//     required String unvon,
//   }) async {
//     var request = await http.MultipartRequest(
//       'post',
//       Uri.parse('https://imei-102.uz/imei102/registration/create/'),
//     );

//     request.fields.addAll({
//       'fio': fio,
//       'region': region,
//       'boshqarma': boshqarma,
//       'lavozim': lavozim,
//       'unvon': unvon,
//     });

//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 201) {
//       var data = await response.stream.bytesToString();
//       return jsonDecode(data);
//     }
//   }
// }