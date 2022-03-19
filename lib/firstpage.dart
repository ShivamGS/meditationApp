import 'package:dhyann/colors.dart';
import 'package:dhyann/signup.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'colors.dart';

class firstpage extends StatelessWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.tealAccent,
      body: Container(
        child: Column(
          children: [
            //Image of Meditation
            Container(
              height: 400,
              //width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://media.istockphoto.com/vectors/man-meditating-in-nature-and-leaves-concept-illustration-for-yoga-vector-id1140322066?k=20&m=1140322066&s=612x612&w=0&h=T0dAkJbk4ViiNFV-0jmDHaKZOC1NWW3O-IdxQUkK-Us="))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Text(
                "Welcome to DHYAN ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "You are one click away \n   from Peaceful life",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
