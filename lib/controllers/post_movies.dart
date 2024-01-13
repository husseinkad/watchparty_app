import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

class MovieController extends GetxController {
  final String apiUrl = 'http://127.0.0.1:3000/api/v1/movies';

  Future<void> pickAndUploadMovie(String token) async {
    try {
      // Pick a video file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
      );

      if (result != null) {
        // Get the file
        PlatformFile file = result.files.first;

        // Upload the movie using the controller
        await uploadMovie(token, file);
      } else {
        // User canceled the file picking
        print('File picking canceled');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception during movie upload: $e');
    }
  }

  Future<void> uploadMovie(String token, PlatformFile file) async {
    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..headers['Authorization'] = 'Bearer $token'
        ..files.add(http.MultipartFile.fromBytes(
          'video',
          file.bytes!,
          filename: file.name,
        ));

      // Send the request
      http.Response response = await http.Response.fromStream(await request.send());

      // Handle the response
      if (response.statusCode == 200) {
        // Successful upload
        print('Movie uploaded successfully');
      } else {
        // Handle error
        print('Error uploading movie: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception during movie upload: $e');
    }
  }
}
