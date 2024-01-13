import 'package:get/get.dart';

class UserInfoController extends GetxController {
  RxString name = "John Doe".obs;
  final String email = "john.doe@example.com";
  final String profilePicture = "https://cdn.vox-cdn.com/thumbor/S7APkbn99b1oVsds_1JBhvdzsWU=/0x0:2000x1000/1400x1400/filters:focal(814x298:815x299)/cdn.vox-cdn.com/uploads/chorus_asset/file/10440907/Thanos_MCU.jpg"; // Change this to the path of your image
}