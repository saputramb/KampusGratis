import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Editflutter extends StatelessWidget {
  const Editflutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Edit Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EditProfileUI());
  }
}

class EditProfileUI extends StatefulWidget {
  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  bool isObsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'), 
        leading: IconButton(
          icon: ImageIcon(
           AssetImage('assets/icons/back.png'),
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.settings, color: Colors.white))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2016/01/19/17/19/young-woman-1149643_960_720.jpg'))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.orange),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30),
              buildTextField("Full Name", "Kampus Gratis", false),
              buildTextField("Email", "kampusgratis@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Location", "Surakarta", false),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // OutlinedButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     "Cancel",
                  //     style: TextStyle(
                  //         fontSize: 15, letterSpacing: 2, color: Colors.black),
                  //   ),
                  //   style: OutlinedButton.styleFrom(
                  //       padding: EdgeInsets.symmetric(horizontal: 50),
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20))),
                  // ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Simpan",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ],
              ),
              Container(
                  child: Stack(
                children: [
                  Positioned(
                      child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/design.png'),
                  )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String LabelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObsecurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObsecurePassword = !isObsecurePassword;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: LabelText,
            labelStyle: (TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              fontStyle: FontStyle.normal,
            )),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 14,
                fontFamily: "Montserrat",
                fontStyle: FontStyle.normal,
                color: Colors.grey)),
      ),
    );
  }
}
