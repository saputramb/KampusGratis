import 'package:flutter/material.dart';
import 'package:kampus_gratis/constants.dart';

class UserMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
              radius: 25.0,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 15.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hello,\n",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(152, 156, 173, 1),
                    ),
                  ),
                  TextSpan(
                    text: "Alexa",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/icons/bell.png'),
                color: AppColor.primaryTextColor,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
