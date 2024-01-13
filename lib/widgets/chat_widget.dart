import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/video_controller.dart';

class ChatWidget extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final ChatController _chatController = Get.put(ChatController());
  final VideoController videoController = Get.put(VideoController());

  ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(onPressed: (){
            videoController.isButtonPressed.value = !videoController.isButtonPressed.value;
          }, icon: Icon(Icons.transit_enterexit)),
          Flexible(
            child: Obx(
                  () => ListView.builder(
                reverse: true,
                itemCount: _chatController.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatMessage(
                    text: _chatController.messages[index],
                  );
                },
              ),
            ),
          ),
          const Divider(height: 1.0),
          _buildTextComposer(),
        ],
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _chatController.handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: 'Enter your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _chatController.handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  const ChatMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              child: Text('User'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatController extends GetxController {
  RxList<String> messages = <String>[].obs;

  void handleSubmitted(String text) {
    messages.insert(0, text);
  }
}