// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ungreview/model/post_model.dart';
import 'package:ungreview/model/user_model.dart';
import 'package:ungreview/widget/widget_form.dart';
import 'package:ungreview/widget/widget_icon_button.dart';
import 'package:ungreview/widget/widget_image.dart';
import 'package:ungreview/widget/widget_image_network.dart';
import 'package:ungreview/widget/widget_text.dart';

class DisplayDetailPost extends StatelessWidget {
  const DisplayDetailPost({
    Key? key,
    required this.postModel,
    required this.userModel,
  }) : super(key: key);

  final PostModel postModel;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              WidgetImageNetwork(urlImage: postModel.urlImage),
              panalIcon(),
              displayOwnerPost(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: WidgetText(
                  data: postModel.detail,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Stack(
                      children: [
                        WidgetImage(path: 'images/avatar0.png',
                          size: 24,
                        ),
                         Container(margin: const EdgeInsets.only(left: 15),
                           child: WidgetImage(path: 'images/avatar1.png',
                            size: 24,
                                                 ),
                         ),
                         Container(margin: const EdgeInsets.only(left: 30),
                           child: WidgetImage(path: 'images/avatar2.png',
                            size: 24,
                                                 ),
                         ),
                      ],
                    ),
                    SizedBox(width: 250,
                      child: WidgetText(
                          data:
                              'detail comment detail comment detail comment detail comment '),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: WidgetForm(
                  label: 'Add Comment',
                  changeFunc: (p0) {},
                  suffixWidget: WidgetIconButton(
                    iconData: Icons.add_box,
                    pressFunc: () {},
                  ),
                ),
              )
            ],
          ),
          backButton()
        ],
      ),
    );
  }

  Row displayOwnerPost(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        userModel.urlAvatar.isEmpty
            ? const WidgetImage(
                size: 36,
              )
            : WidgetImageNetwork(
                urlImage: userModel.urlAvatar,
                width: 36,
                height: 36,
              ),
        const SizedBox(
          width: 4,
        ),
        WidgetText(
          data: userModel.displayName,
          textStyle: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Row panalIcon() {
    return Row(
      children: [
        WidgetIconButton(
          iconData: Icons.star_outline,
          pressFunc: () {},
        ),
        WidgetIconButton(
          iconData: Icons.maps_ugc_outlined,
          pressFunc: () {},
        ),
        WidgetIconButton(
          iconData: Icons.ios_share,
          pressFunc: () {},
        ),
      ],
    );
  }

  Positioned backButton() {
    return Positioned(
      top: 16,
      left: 16,
      child: WidgetIconButton(
        iconData: Icons.cancel,
        pressFunc: () {
          Get.back();
        },
        color: Colors.white.withOpacity(0.5),
        size: 36,
      ),
    );
  }
}
