import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class UserModel {
  final String name;
  final String imageUrl;

  UserModel({required this.name, required this.imageUrl});
}

class VideoController extends GetxController {
  late FlickManager flickManager;
  RxBool isButtonPressed = false.obs;

  List<UserModel> chairs = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
      ),
    );

    chairs.addAll([
      UserModel(name: 'John Doe', imageUrl: 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
      UserModel(name: 'Jane Smith', imageUrl: 'https://www.georgetown.edu/wp-content/uploads/2022/02/Jkramerheadshot-scaled-e1645036825432-1050x1050-c-default.jpg'),
      UserModel(name: 'Alice Johnson', imageUrl: 'https://www.indiafilings.com/learn/wp-content/uploads/2023/03/Can-a-single-person-own-a-firm-in-India.jpg'),
      UserModel(name: 'Bob Anderson', imageUrl: 'https://hackspirit.com/wp-content/uploads/2021/06/Copy-of-Rustic-Female-Teen-Magazine-Cover.jpg'),
      UserModel(name: 'Eva Green', imageUrl: 'https://www.westernunion.com/staticassets/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png'),
      UserModel(name: 'David White', imageUrl: 'https://t3.ftcdn.net/jpg/03/02/88/46/360_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg'),
    ]);
    update();
  }

  @override
  void onClose() {
    flickManager.dispose();
    super.onClose();
  }
}
