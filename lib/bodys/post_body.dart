import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/states/add_new_post.dart';
import 'package:ungreview/utility/app_controller.dart';
import 'package:ungreview/utility/app_service.dart';
import 'package:ungreview/widget/widget_button.dart';
import 'package:ungreview/widget/widget_grid_box.dart';
import 'package:ungreview/widget/widget_text.dart';

class PostBody extends StatefulWidget {
  const PostBody({super.key});

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  @override
  void initState() {
    super.initState();
    AppService().readPostForPost();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return GetX(
          init: AppController(),
          builder: (AppController appController) {
            print('postPostModels --> ${appController.postPostModels.length}');
            return SizedBox(
              width: boxConstraints.maxWidth,
              height: boxConstraints.maxHeight,
              child: Stack(
                children: [
                  appController.postPostModels.isEmpty
                      ? const SizedBox()
                      : GridView.builder(
                          itemCount: appController.postPostModels.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 4 / 7
                                ),
                          itemBuilder: (context, index) => WidgetGridBox(
                            postModel: appController.postPostModels[index],
                          ),
                        ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: WidgetButton(
                      label: 'Add New Post',
                      pressFunc: () {
                        if (appController.files.isNotEmpty) {
                          appController.files.clear();
                        }
                        Get.to(const AddNewPost())!.then((value) {
                          AppService().readPostForPost();
                        });
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
