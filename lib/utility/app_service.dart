import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungreview/model/user_model.dart';
import 'package:ungreview/utility/app_controller.dart';

class AppService {
  AppController appController = Get.put(AppController());

  void timeStampToString({required Timestamp timestamp}){}

  Future<void> processTakePhoto({required ImageSource imageSource}) async {
    if (appController.files.isNotEmpty) {
      appController.files.clear();
    }
    var result = await ImagePicker()
        .pickImage(source: imageSource, maxWidth: 800, maxHeight: 800);
    if (result != null) {
      appController.files.add(File(result.path));
    }
  }

  Future<void> processSignOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      appController.currentUserModels.clear();
      appController.uidLogin.value = '';
      appController.indexBody.value = 0;
    });
  }

  Future<void> findCurrentUserModel() async {
    var user = FirebaseAuth.instance.currentUser;
    appController.uidLogin.value = user!.uid;

    await FirebaseFirestore.instance
        .collection('user')
        .doc(appController.uidLogin.value)
        .get()
        .then((value) {
      UserModel userModel = UserModel.fromMap(value.data()!);
      appController.currentUserModels.add(userModel);
    });
  }
}
