// import 'package:dhyann/HomePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_application_2/pages/Homepage.dart';
// // import 'package:flutter_application_2/pages/Profile_page.dart';
// // import 'package:flutter_application_2/pages/colors.dart';
// // import 'package:flutter_application_2/pages/music.dart';
// // import 'package:flutter_application_2/pages/register_page.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   // form key
//   final _formKey = GlobalKey<FormState>();

//   // editing controller
//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController passwordController = new TextEditingController();

//   // firebase
//   final _auth = FirebaseAuth.instance;

//   // string for displaying the error Message
//   String? errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     //email field
//     final emailField = TextFormField(
//         cursorColor: Colors.white,
//         autofocus: false,
//         controller: emailController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Please Enter Your Email");
//           }
//           // reg expression for email validation
//           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//               .hasMatch(value)) {
//             return ("Please Enter a valid email");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           emailController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.mail,
//             color: Colors.white,
//           ),
//           contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Email",
//           hintStyle: const TextStyle(color: Colors.white),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));

//     //password field
//     final passwordField = TextFormField(
//         autofocus: false,
//         controller: passwordController,
//         obscureText: true,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{6,}$');
//           if (value!.isEmpty) {
//             return ("Password is required for login");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid Password(Min. 6 Character)");
//           }
//         },
//         onSaved: (value) {
//           passwordController.text = value!;
//         },
//         textInputAction: TextInputAction.done,
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             Icons.vpn_key,
//             color: Colors.white,
//           ),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Password",
//           hintStyle: TextStyle(color: Colors.white),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));

//     final loginButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: Colors.white,
//       child: MaterialButton(
//           padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: MediaQuery.of(context).size.width,
//           onPressed: () {
//             signIn(emailController.text, passwordController.text);
//           },
//           child: Text(
//             "Login",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//           )),
//     );
//     final x = MediaQuery.of(context).size.height;
//     final y = MediaQuery.of(context).size.width;

//     return Stack(
//       children: [
//         Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Card(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   SizedBox(height: x * 0.43),
//                   Text(
//                     'LOGIN',
//                     style: TextStyle(color: Colors.white, fontSize: 40),
//                   ),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           SizedBox(height: x * 0.1),
//                           emailField,
//                           SizedBox(height: x * 0.03),
//                           passwordField,
//                           SizedBox(height: x * 0.1),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                             child: loginButton,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Text(
//                                 "Don't have an account? ",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Text(
//                                   "SignUp",
//                                   style: TextStyle(
//                                       color: Colors.redAccent,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                               ),
//                               SizedBox(height: x * 0.1),
//                             ],
//                           ),
//                         ]),
//                   )
//                 ],
//               ),
//             )),
//         Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//               height: x * 0.4,
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       "https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?size=338&ext=jpg"),
//                   fit: BoxFit.cover,
//                   alignment: Alignment(-0.7, -0.6),
//                 ),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.elliptical(250, 180),
//                     bottomRight: Radius.elliptical(250, 180)),
//               )),
//         )
//       ],
//     );
//   }

//   // login function
//   void signIn(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth
//             .signInWithEmailAndPassword(email: email, password: password)
//             .then((uid) => {
//                   Fluttertoast.showToast(msg: "Login Successful"),
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => HomePage())),
//                 });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be malformed.";

//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyann/colors.dart';
import 'package:dhyann/login_page.dart';
import 'package:dhyann/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final secondNameField = TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: emailEditingController,
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
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: passwordEditingController,
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
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Confirm Password",
            hintStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: b1));

    //signup button
    final signUpButton = Container(
      // decoration: BoxDecoration(border: Border.all(color: b3)),
      color: b6,
      child: Container(
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              signUp(
                  emailEditingController.text, passwordEditingController.text);
            },
            child: Text(
              "SignUp",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: b2, fontWeight: FontWeight.bold),
            )),
      ),
    );
    final x = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: b9,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              height: x * 0.8,
              decoration: BoxDecoration(
                  color: b7,
                  borderRadius: BorderRadius.all(Radius.elliptical(90, 90))),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // SizedBox(height: 15),
                      firstNameField,
                      SizedBox(height: 25),
                      secondNameField,
                      SizedBox(height: 25),
                      emailField,
                      SizedBox(height: 25),
                      passwordField,
                      SizedBox(height: 25),
                      confirmPasswordField,
                      SizedBox(height: 45),
                      signUpButton,
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
