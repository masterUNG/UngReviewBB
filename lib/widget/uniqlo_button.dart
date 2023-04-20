import 'package:flutter/material.dart';

class UniqloButton extends StatelessWidget {
  final Function()? onTap;

  const UniqloButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(alignment: Alignment.center,
       height: 50,
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black), color: Colors.white),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "UNIQLO",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Container(margin: const EdgeInsets.only(left: 32),
              child: Image.asset(
                "images/UNIQLOlogo.png",
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
