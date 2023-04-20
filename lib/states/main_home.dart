import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/bodys/discovery_body.dart';
import 'package:ungreview/bodys/home_body.dart';
import 'package:ungreview/bodys/nogification_body.dart';
import 'package:ungreview/bodys/post_body.dart';
import 'package:ungreview/bodys/profile_body.dart';
import 'package:ungreview/states/authen.dart';
import 'package:ungreview/states/create_new_account.dart';
import 'package:ungreview/utility/app_controller.dart';
import 'package:ungreview/utility/app_dialog.dart';
import 'package:ungreview/widget/widget_text_button.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'Home',
    'Discover',
    'Post',
    'Notification',
    'Profile',
  ];
  var iconDatas = <IconData>[
    Icons.roofing_outlined,
    Icons.search,
    Icons.add_circle_outline,
    Icons.notifications_active_outlined,
    Icons.person,
  ];

  var items = <BottomNavigationBarItem>[];

  var bodys = <Widget>[
    const HomeBody(),
    const DiscoveryBody(),
    const PostBody(),
    const NotificationBody(),
    const ProfileBody(),
  ];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < titles.length; i++) {
      items.add(
        BottomNavigationBarItem(icon: Icon(iconDatas[i]), label: titles[i]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('currentUserModel = ${appController.currentUserModels.length}');
          return Scaffold(
            body: SafeArea(child: bodys[appController.indexBody.value]),
            bottomNavigationBar: BottomNavigationBar(
              items: items,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                if (value == 2 || value == 3 || value == 4) {
                  if (appController.currentUserModels.isEmpty) {
                    // Guest
                    print('Guest');
                    AppDialog(context: context).normalDialog(
                        title: 'Login ?',
                        firstAction: WidgetTextButton(
                          label: 'Create\nAccount',
                          pressFunc: () {
                            Get.back();
                            Get.to(const CreateNewAccount());
                          },
                        ),
                        secondAction: WidgetTextButton(
                          label: 'Login',
                          pressFunc: () {
                            Get.back();
                            Get.to(const Authen());
                          },
                        ));
                  } else {
                    appController.indexBody.value = value;
                  }
                } else {
                  appController.indexBody.value = value;
                }
              },
              currentIndex: appController.indexBody.value,
            ),
          );
        });
  }
}
