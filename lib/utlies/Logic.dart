
import 'package:flutter/material.dart';

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
              Navigator.of(context).pop(); // Close the dialog
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

Future<void> showUploadVideoDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Upload Video'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select a video to upload:'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement video selection logic
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Select Video'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },);
}

