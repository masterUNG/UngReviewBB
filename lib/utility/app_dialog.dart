// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/widget/widget_image.dart';
import 'package:ungreview/widget/widget_progress.dart';
import 'package:ungreview/widget/widget_text.dart';
import 'package:ungreview/widget/widget_text_button.dart';

class AppDialog {
  final BuildContext context;
  AppDialog({
    required this.context,
  });

  void progressDialog() {
    Get.dialog(WillPopScope(
      child: const WidgetProgress(),
      onWillPop: () async {
        return false;
      },
    ));
  }

  void normalDialog(
      {required String title,
      String? subTitle,
      Widget? firstAction,
      Widget? secondAction}) {
    Get.dialog(
        AlertDialog(
          icon: const WidgetImage(
            size: 100,
          ),
          title: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetText(data: title),
              ],
            ),
            subtitle: subTitle == null
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: WidgetText(data: subTitle),
                      ),
                    ],
                  ),
          ),
          actions: [
            firstAction ?? const SizedBox(),
            secondAction ?? const SizedBox(),
            WidgetTextButton(
              label: firstAction == null ? 'OK' : 'Cancel',
              pressFunc: () {
                Get.back();
              },
            )
          ],
        ),
        barrierDismissible: false);
  }
}
