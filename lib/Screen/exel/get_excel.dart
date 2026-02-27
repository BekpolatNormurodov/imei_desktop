import 'package:imei/library.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GetExcel extends StatefulWidget {
  const GetExcel({super.key});

  @override
  State<GetExcel> createState() => _GetExcelState();
}

class _GetExcelState extends State<GetExcel> {
  getExcelData() async {
    String url = "https://bekpolatnormurodov.uz/imeiApi/api/v1/export/";
    // String token = Hive.box('token').get('token');
    var _response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQxODAxMzc5LCJpYXQiOjE3NDE3OTc4MzksImp0aSI6IjFiMzBmNWRlNjA0ZjQ2MDM5YzE5NWRkZjM3Y2QzNWJmIiwidXNlcl9pZCI6Nn0.4Zs4aeWzpQdRSN2GGe1PQ1n3DH7y_tAaemXSutIhdMU',
      },
    );
    print(_response.headers);
    print(_response.body.toString().length);
    if (_response.statusCode == 200) {
      return _response.body;
    } else {
      return jsonDecode(_response.body);
    }
  }

  Future<String> get _localPath async {
    final directory = await getDownloadsDirectory();
    return directory!.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.xlsx');
  }

  Future writeData(String data) async {
    final file = await _localFile;
    return file.writeAsStringSync(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        var data = await getExcelData();
        print(data);
        await writeData(data);
      }),
    );
  }
}
