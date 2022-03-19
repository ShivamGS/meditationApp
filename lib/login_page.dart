// import 'package:flutter/material.dart';
// import 'HomePage.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String UserName="";
//   String password="";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       //backgroundColor: Colors.lime,
//       appBar: AppBar(
//         title: Text("Login"),
//       ),

//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 350,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: NetworkImage("https://media.istockphoto.com/vectors/woman-meditating-in-nature-and-leaves-concept-illustration-for-yoga-vector-id1139912908?k=20&m=1139912908&s=612x612&w=0&h=ljrtdv9NxmtUBrQ_lDzQGDmSQSnTlOMg6J75WWpDS3s=")
//                   )
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                     hintText: "Enter Username",
//                     labelText: "Username",
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius:BorderRadius.circular(25)
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25)
//                     )
//                 ),
//                 onChanged: (String value){
//                   UserName=value;
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 obscureText: true ,
//                 decoration: InputDecoration(
//                     hintText: "Enter Password",
//                     labelText: "Password",
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius:BorderRadius.circular(25)
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25)
//                     )
//                 ),
//                 onChanged: (String value){
//                   password=value;
//                 },
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 height: 40,
//                 width: 100,
//                 child: ElevatedButton(onPressed: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
//                 },
//                     child: Text("Login",style: TextStyle(fontSize: 16),)
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:dhyann/HomePage.dart';
import 'package:dhyann/main.dart';
import 'package:dhyann/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/pages/Homepage.dart';
// import 'package:flutter_application_2/pages/Profile_page.dart';
// import 'package:flutter_application_2/pages/colors.dart';
// import 'package:flutter_application_2/pages/music.dart';
// import 'package:flutter_application_2/pages/register_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        cursorColor: Colors.black,
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final x = MediaQuery.of(context).size.height;
    final y = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: x * 0.43),
                    Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: x * 0.1),
                            emailField,
                            SizedBox(height: x * 0.03),
                            passwordField,
                            SizedBox(height: x * 0.1),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: loginButton,
                            ),
                          ]),
                    )
                  ],
                ),
              )),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: x * 0.4,
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/pexels-nataliya-vaitkevich-5201522.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment(-0.7, -0.6),
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(250, 180),
                      bottomRight: Radius.elliptical(250, 180)),
                )),
          )
        ],
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
