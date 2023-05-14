import 'dart:io';

import 'package:get/get.dart';
import 'package:ungreview/model/post_model.dart';
import 'package:ungreview/model/user_model.dart';

class AppController extends GetxController {
  RxInt indexBody = 0.obs;
  RxString uidLogin = ''.obs;
  RxList<UserModel> currentUserModels = <UserModel>[].obs;
  RxList<File> files = <File>[].obs;
  RxString urlImage = ''.obs;
  RxList<PostModel> postPostModels = <PostModel>[].obs;

  RxList<PostModel> discoverPostModels = <PostModel>[].obs;
  RxList<UserModel> discoverUserModels = <UserModel>[].obs;
}
