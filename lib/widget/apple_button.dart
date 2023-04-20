import 'package:flutter/material.dart';

class AppleButton extends StatelessWidget {
  final Function()? onTap;

  const AppleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/applelogo.png",
              width: 25,
              height: 25,
            ),
            Text(
              "Sign in With Apple",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
