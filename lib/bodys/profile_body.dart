import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/utility/app_dialog.dart';
import 'package:ungreview/utility/app_service.dart';
import 'package:ungreview/widget/widget_button.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      label: 'SignOut',
      pressFunc: () {
        AppDialog(context: context).normalDialog(
            title: 'SignOut ?',
            subTitle: 'Please Confirm SignOut',
            firstAction: WidgetButton(
              label: 'SignOut',
              pressFunc: () {
                Get.back();
                AppService().processSignOut();
              },
            ));
      },
    );
  }
}
