import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/states/display_detail_post.dart';
import 'package:ungreview/utility/app_controller.dart';
import 'package:ungreview/utility/app_service.dart';
import 'package:ungreview/widget/widget_grid_box.dart';

class DiscoveryBody extends StatefulWidget {
  const DiscoveryBody({super.key});

  @override
  State<DiscoveryBody> createState() => _DiscoveryBodyState();
}

class _DiscoveryBodyState extends State<DiscoveryBody> {
  @override
  void initState() {
    super.initState();
    AppService().readPostForDiscover();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print(
              'discoveryModel ---> ${appController.discoverPostModels.length}');
          return appController.discoverPostModels.isEmpty
              ? const SizedBox()
              : GridView.builder(
                  itemCount: appController.discoverPostModels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 4 / 7),
                  itemBuilder: (context, index) => WidgetGridBox(
                    postModel: appController.discoverPostModels[index],
                    tabFunc: () {
                      print('you tap index ---> $index');
                      Get.to(DisplayDetailPost(
                        postModel: appController.discoverPostModels[index],
                        userModel: appController.discoverUserModels[index],
                      ));
                    },
                  ),
                );
        });
  }
}
