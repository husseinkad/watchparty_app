import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class WatchPartyViewPage extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  WatchPartyViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch Party View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(videoController.videoController),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: videoController.chairs.length,
                      itemBuilder: (context, index) {
                        return Chair(user: videoController.chairs[index]);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoController extends GetxController {
  late VideoPlayerController videoController;

  List<String> chairs = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.network(
      'https://www.example.com/sample.mp4', // Replace with your video URL
    )..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized
      update();
      videoController.play();
    });

    // Simulating users joining the watch party
    Future.delayed(const Duration(seconds: 2), () {
      chairs.addAll(['User 1', 'User 2', 'User 3', 'User 4', 'User 5', 'User 6']);
      update();
    });
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}

class Chair extends StatelessWidget {
  final String user;

  Chair({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              'https://i.guim.co.uk/img/media/66767bbb27ae0e99d0dfb2975ff2a2b3db9e1c93/37_6_1612_967/master/1612.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=2a212447d637483b953a4e91b042f0ce',
            ),
          ),
          const SizedBox(height: 8.0),
          Text(user),
        ],
      ),
    );
  }
}