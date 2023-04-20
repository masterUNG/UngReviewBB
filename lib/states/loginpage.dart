import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/states/main_home.dart';
import 'package:ungreview/widget/apple_button.dart';
import 'package:ungreview/widget/instagram_button.dart';
import 'package:ungreview/widget/uniqlo_button.dart';
import 'package:ungreview/widget/widget_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeadImage(),
            _buildHeadDetails(),
            // _buildHeadActions()
            // _igButton(),
            AppleButton(onTap: () {}),
            const SizedBox(
              height: 15,
            ),
            InstagramButton(onTap: () {}),
            const SizedBox(
              height: 15,
            ),
            UniqloButton(onTap: () {}),
            TextButton(
                onPressed: () {
                  Get.offAll(const MainHome());
                },
                child: const Text(
                  'Not Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                )),
                WidgetText(data: 'Current Region Thailand'),
                SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadImage() {
    return Container(
      width: 440,
      height: 440,
      child: Image.asset(
        'images/loginstylehint.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildHeadDetails() {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Row(
        children: [
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _igButton() {
  // return Container(
  //   decoration: BoxDecoration(
  //       border: Border.all(
  //           color: Colors.black, width: BorderSide.strokeAlignCenter),
  //       color: Colors.white),
  //   padding: EdgeInsets.all(8),
  //   child: Text('Sign in with Apple'),
  // );
  // return Container(
  //   child: OutlinedButton(
  //     child: Text("Sign in with Apple"),
  //     onPressed: () {},
  //     style: OutlinedButton.styleFrom(
  //       foregroundColor: Colors.black, backgroundColor: Colors.white, padding: EdgeInsets.all(10.0),
  //       fixedSize: Size(350, 50),
  //       textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //       side: BorderSide(color: Colors.black, width: 1),
  //     ),
  //   ),
  // );
}
