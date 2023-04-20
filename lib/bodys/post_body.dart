import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/states/add_new_post.dart';
import 'package:ungreview/utility/app_controller.dart';
import 'package:ungreview/widget/widget_button.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return GetX(
          init: AppController(),
          builder: (AppController appController) {
            print('files --> ${appController.files.length}');
            return SizedBox(
              width: boxConstraints.maxWidth,
              height: boxConstraints.maxHeight,
              child: Stack(
                children: [
                  Text('Post'),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: WidgetButton(
                      label: 'Add New Post',
                      pressFunc: () {
                        if (appController.files.isNotEmpty) {
                          appController.files.clear();
                        }
                        Get.to(const AddNewPost());
                      },
                    ),
                  )
                ],
              ),
            );
          });
    });
  }
}
