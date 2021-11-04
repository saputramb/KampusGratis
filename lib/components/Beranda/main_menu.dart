import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          // left: 16,
          // right: 16,
          top: 18,
        ),
        // decoration: BoxDecoration(color: Colors.white),
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Wrap(
            spacing: 35,
            runSpacing: 20,
            children: <Widget>[
              ServiceBtn(
                imgpath: "assets/images/Group.png",
                text: "Modul Bank",
                press: () {
                  Navigator.pushNamed(context, '/kursus');
                },
              ),
              ServiceBtn(
                imgpath: "assets/images/Group.png",
                text: "Modul Bank",
                press: () {},
              ),
              ServiceBtn(
                imgpath: "assets/images/Group.png",
                text: "Modul Bank",
                press: () {},
              ),
              ServiceBtn(
                imgpath: "assets/images/Group.png",
                text: "Modul Bank",
                press: () {},
              ),
              ServiceBtn(
                imgpath: "assets/images/Group.png",
                text: "Modul Bank",
                press: () {},
              ),
              ServiceBtn(
                imgpath: "assets/images/lainnya.png",
                text: "Lainnya",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceBtn extends StatelessWidget {
  final String imgpath;
  final String text;
  final VoidCallback press;
  const ServiceBtn({
    Key? key,
    required this.imgpath,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade50, width: 1.5),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 6,
                  color: Colors.black38,
                ),
              ],
            ),
            child: Image.asset(
              imgpath,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
