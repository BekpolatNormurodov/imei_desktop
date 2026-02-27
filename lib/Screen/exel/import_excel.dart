import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImportExcel extends StatefulWidget {
  const ImportExcel({super.key});

  @override
  State<ImportExcel> createState() => _ImportExcelState();
}

class _ImportExcelState extends State<ImportExcel> {
  List<List<String>> _excelData = [];
  File? exel_file;

  Future<void> _pickAndReadExcelFile() async {
    try {
      // Open file picker
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
      );

      if (result != null) {
        exel_file = File(result.files.single.path!);

        // Read the Excel file
        var bytes = exel_file!.readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);

        List<List<String>> data = [];

        // Iterate over the rows and columns in the first sheet
        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            // Filter out null cells and convert them to strings
            List<String> filteredRow = row
                .where((cell) => cell != null) // Skip null cells
                .map((cell) =>
                    cell!.value.toString()) // Convert non-null cells to strings
                .toList();

            if (filteredRow.isNotEmpty) {
              data.add(filteredRow); // Add non-empty rows
            }
          }
          break; // Read only the first sheet
        }

        setState(() {
          _excelData = data;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error reading file: $e')),
      );
    }
  }

  Future<void> uploadthisFile() async {
    var url = Uri.parse('http://localhost:3001/upload-exel');

    var stream = new http.ByteStream(exel_file!.openRead());
    var mylength = await exel_file!.length();

    var request = new http.MultipartRequest('POST', url);
    var multipartFile = new http.MultipartFile(
      'file',
      stream,
      mylength,
      filename: "test_file.xls"
    );

    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully uploaded')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed! Error is: ${response.statusCode}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: exel_file == null
            ? Text("Test upload file")
            : Text(exel_file!.path + " file selected"),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _pickAndReadExcelFile,
            child: Icon(Icons.file_present),
          ),
          SizedBox(
            width: 20,
          ),
          if (exel_file != null)
            FloatingActionButton(
              onPressed: uploadthisFile,
              child: Icon(Icons.file_upload),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(_excelData?.length ?? 0,
              (index) => Text(_excelData[index].toString())),
        ),
      ),
    );
  }
}