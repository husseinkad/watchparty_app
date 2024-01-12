import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:watchparty_app/utlies/custom_textstyles.dart';
import 'package:watchparty_app/views/profile_page.dart';
import 'package:watchparty_app/views/watchparty_page.dart';

import '../utlies/Logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () => Get.to(ProfilePage()),
            child: ClipOval(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Image.network(
                  'https://i.guim.co.uk/img/media/66767bbb27ae0e99d0dfb2975ff2a2b3db9e1c93/37_6_1612_967/master/1612.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=2a212447d637483b953a4e91b042f0ce',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            onPressed: () {
              showUploadVideoDialog(context);
            },
            icon: const Icon(Icons.video_call_outlined, size: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            onPressed: () {
              showJoinPartyDialog(context);
            },
            icon: const Icon(Icons.people, size: 30),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: PartyList(),
    );
  }
}

class JoinWatchPartyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implement the logic to join the watch party.
          print('Joining Watch Party');
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
          padding: const EdgeInsets.all(16.0), // Button padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Join Watch Party',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

class PartyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Fetch party data from a backend or provide a list of parties.
    List<Party> parties = [
      Party('Movie Night', 'Action Movie', 'John Doe'),
      Party('TV Series Marathon', 'Breaking Bad', 'Jane Smith'),
      // Add more parties as needed.
    ];

    return ListView.builder(
      itemCount: parties.length,
      itemBuilder: (context, index) {
        return PartyCard(party: parties[index]);
      },
    );
  }
}

class PartyCard extends StatelessWidget {
  final Party party;

  PartyCard({required this.party});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(party.title, style: CustomTextStyles.titleTextStyle,),
        subtitle: Text('${party.category} by ${party.host}', style: CustomTextStyles.defaultTextStyle,),
        trailing: ElevatedButton(
          onPressed: () {
            Get.to(WatchPartyViewPage());
            // You may want to navigate to a new screen or show a modal.
            print('Joining ${party.title}');
          },
          child: const Text('Join', style: CustomTextStyles.defaultTextStyle),
        ),
      ),
    );
  }
}

class Party {
  final String title;
  final String category;
  final String host;

  Party(this.title, this.category, this.host);
}
