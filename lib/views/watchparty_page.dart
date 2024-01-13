import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchparty_app/utlies/custom_textstyles.dart';

import '../controllers/video_controller.dart';
import '../widgets/chat_widget.dart';

class WatchPartyViewPage extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  WatchPartyViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch Party View', style: CustomTextStyles.defaultTextStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: FlickVideoPlayer(
                      flickManager: videoController.flickManager)),
            ),
           // ,
      Obx(() => SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
                child: videoController.isButtonPressed.value == true? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChatWidget(),
                ): chairsView(videoController, context)))
          ],
        ),
      ),
    );
  }
}

Widget chairsView(videoController, context){
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('TV Series Marathon', style: CustomTextStyles.titleTextStyle,),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text('Breaking Bad by Jane Smith', style: CustomTextStyles.headlineTextStyle,),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.345,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: videoController.chairs.length,
          itemBuilder: (context, index) {
            return Chair(user: videoController.chairs[index]);
          },
        ),
      ),
      GestureDetector(
        onTap: (){
          videoController.isButtonPressed.value = !videoController.isButtonPressed.value;
        },
        child: Center(
          child: Container(
            height:  40,
            width:  MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
            ),
            child: const Center(
              child:  Text('Chat'),
            ),
          ),
        ),
      ),
    ],
  );

}

class Chair extends StatelessWidget {
  final UserModel user;

  Chair({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
           CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              user.imageUrl,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(user.name, style: const TextStyle(fontSize: 13, fontFamily: 'Poppins'),),
        ],
      ),
    );
  }
}
