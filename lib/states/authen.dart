import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/utility/app_dialog.dart';
import 'package:ungreview/utility/app_service.dart';
import 'package:ungreview/widget/widget_button.dart';
import 'package:ungreview/widget/widget_form.dart';
import 'package:ungreview/widget/widget_text.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Login'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetForm(
                label: 'Email',
                changeFunc: (p0) {
                  email = p0.trim();
                },
                textInputType: TextInputType.emailAddress,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetForm(
                label: 'Password',
                changeFunc: (p0) {
                  password = p0.trim();
                },
                obsecu: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                margin: const EdgeInsets.only(top: 8),
                child: WidgetButton(
                  label: 'Login',
                  pressFunc: () async {
                    if ((email?.isEmpty ?? true) ||
                        (password?.isEmpty ?? true)) {
                      AppDialog(context: context).normalDialog(
                          title: 'Have Spcae ?',
                          subTitle: 'Please Fill Every Blank');
                    } else {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email!, password: password!)
                          .then((value) {
                        Get.back();
                        AppService().findCurrentUserModel();
                      }).catchError((onError) {
                        AppDialog(context: context).normalDialog(
                            title: onError.code, subTitle: onError.message);
                      });
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
