import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/filepicker_controller.dart';
import '../controllers/post_movies.dart';
import 'package:http/http.dart' as http;

Future<void> showJoinPartyDialog(BuildContext context) async {
  TextEditingController linkController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Join Party'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enter the party link:'),
            const SizedBox(height: 20),
            TextField(
              controller: linkController,
              decoration: const InputDecoration(
                labelText: 'Party Link',
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // TODO: Implement join party logic
              String partyLink = linkController.text;
              print('Joining party with link: $partyLink');
              Navigator.of(context).pop();
            },
            child: const Text('Join Party'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

Future<void> showUploadVideoDialog(BuildContext context, FilePickerController controller) async {
  FilePickerController movieController = FilePickerController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: const Center(
          child: Text(
            'Upload Video',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select a video to upload:',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.getFile();

              },
              style: ElevatedButton.styleFrom(
              ),
              child: const Text(
                'Select Video',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              File? videoFile = controller.file.value;

              if (videoFile != null) {
                SharedPreferences prefs =  await SharedPreferences.getInstance();
                String token = prefs.getString('token') ?? '';
                String apiUrl = 'http://192.168.200.19:3000/api/v1/movies';

                try {
                  var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
                    ..files.add(http.MultipartFile.fromBytes(
                      'video',
                      await videoFile.readAsBytes(),
                      filename: 'video.mp4',
                    ))
                    ..headers['Authorization'] = 'Bearer $token';

                  var response = await http.Client().send(request);

                  if (response.statusCode == 200) {
                    // File uploaded successfully
                    print('File uploaded successfully');
                    // Add any additional logic you need after successful upload
                  } else {
                    // Handle the error
                    print('Error uploading file: ${response.reasonPhrase}');
                    // Add error handling logic
                  }
                } catch (e) {
                  // Handle network or other errors
                  print('Error: $e');
                  // Add error handling logic
                }
              }

              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
            ),
            child: const Text(
              'Upload',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      );
    },
  );
}
