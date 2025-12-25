import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextButton(
                onPressed: (){
                  uploadPdf();
                },
                child: const Text("Upload PDF"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uploadPdf() async {
    var dio = Dio();

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.single.path != null) {
        File file = File(result.files.single.path!);
        String fileName = file.path.split('/').last;

        FormData data = FormData.fromMap({
          'x-api-key': 'rathoreaniket70@gmail.com_VDoaEQaaiVs3Fj5lNIQ9UB1oL1K0AOsxO2U4eHSRURA6dneeickbwuSfUzIelI8o',
          'file': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        });

        var response = await dio.post(
          "https://api.pdf.co/v1/file/upload",
          data: data,
          onSendProgress: (int sent, int total) {
            print('Progress: ${((sent / total) * 100).toStringAsFixed(2)}% ($sent/$total)');
          },
        );

        // Print the response data
        print('Response Status: ${response.statusCode}');
        print('Response Data: ${response.data}');
        print('Response Headers: ${response.headers}');

        // You can also access specific parts of the response
        if (response.statusCode == 200) {
          print('Upload successful!');
          print('File URL: ${response.data['url']}');
          print('Credits used: ${response.data['credits']}');
          print('Remaining credits: ${response.data['remainingCredits']}');
        } else {
          print('Upload failed with status: ${response.statusCode}');
          print('Error: ${response.data}');
        }

      } else {
        print("File selection cancelled or no file selected");
      }
    } catch (e) {
      print('Error occurred: $e');

      // For more detailed error information
      if (e is DioException) {
        print('Dio Error Type: ${e.type}');
        print('Dio Error Message: ${e.message}');
        print('Dio Response: ${e.response?.data}');
        print('Dio Status Code: ${e.response?.statusCode}');
      }
    }
  }
}
