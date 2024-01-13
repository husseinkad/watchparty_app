import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Video {
  String title;
  String description;

  Video({required this.title, required this.description});
}

class VideoController extends GetxController {
  final videos = <Video>[].obs;

  void addVideo(String title, String imageUrl) {
    videos.add(Video(title: title, description: imageUrl));
  }

  void editVideo(int index, String title, String description) {
    videos[index] = Video(title: title, description: description);
  }

  void removeVideo(int index) {
    videos.removeAt(index);
  }
}

class UploadsPage extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  UploadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Uploaded Videos '),
        ),
        body: Column(
          children: [
           // add video make it here
            //
            //
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: videoController.videos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(videoController.videos[index].title),
                      subtitle: Text(videoController.videos[index].description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Open a dialog to edit the video
                              _showEditVideoDialog(context, index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Remove the video when the delete button is pressed
                              videoController.removeVideo(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }


  Future<void> _showEditVideoDialog(BuildContext context, int index) async {
    TextEditingController titleController = TextEditingController(text: videoController.videos[index].title);
    TextEditingController imageUrlController = TextEditingController(text: videoController.videos[index].description);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Video'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog without saving changes
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Edit the video and close the dialog
                videoController.editVideo(index, titleController.text, imageUrlController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
