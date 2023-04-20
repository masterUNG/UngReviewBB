import 'package:get/get.dart';
import 'package:ungreview/model/user_model.dart';

class AppController extends GetxController {
  RxInt indexBody = 0.obs;
  RxString uidLogin = ''.obs;
  RxList<UserModel> currentUserModels = <UserModel>[].obs;
}
