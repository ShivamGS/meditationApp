// import 'dart:html';

import 'package:dhyann/colors.dart';
import 'package:dhyann/login_page.dart';
import 'package:dhyann/user_model.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final x = MediaQuery.of(context).size.height;
    double y = MediaQuery.of(context).size.width;
    return Material(
      child: Stack(
        children: [
          Container(
            color: b7,
          ),
          Positioned(
              top: x * 0.15,
              left: y * 0.37,
              right: y * 0.37,
              bottom: x * 0.66,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(700)),
                  color: b4,
                ),
              )),
          Positioned(
              top: x * 0.143,
              left: y * 0.3,
              right: y * 0.3,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                    iconSize: 120,
                    color: b7,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                            "${loggedInUser.firstName} ${loggedInUser.secondName}",
                            style: TextStyle(
                                color: b4,
                                fontWeight: FontWeight.bold,
                                // fontWeight: FontWeight.w500,
                                fontSize: 25)),
                        Text("${loggedInUser.email}",
                            style: TextStyle(
                                color: b4,
                                fontWeight: FontWeight.w500,
                                fontSize: 20)),
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
            top: x * 0.03,
            left: y * 0.8,
            child: ActionChip(
                label: Text("Logout"),
                onPressed: () {
                  logout(context);
                }),
          ),
        ],
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
