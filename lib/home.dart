import 'package:dhyann/colors.dart';
import 'package:dhyann/global.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final x = MediaQuery.of(context).size.height;
    final y = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: b6,
      body: Stack(
        children: [
          Positioned(
            top: x * 0.1,
            child: Container(
                width: y,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "   Start Your Morning with  ",
                      style: TextStyle(
                        color: b7,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Text(
                      "Breathe Meditation",
                      style: TextStyle(
                          color: b7,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: x * 0.2,
                      width: y * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/undraw_Meditation_re_gll0.png"),
                              fit: BoxFit.cover)),
                      child: IconButton(
                        onPressed: () {
                          launch("https://www.youtube.com/watch?v=VUjiXcfKBn8");
                        },
                        icon: Icon(Icons.play_circle_outline_sharp),
                        color: b7,
                        iconSize: 40,
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
              top: x * 0.48,
              left: y * 0.1,
              right: 0,
              child: const Text(
                "Recently Played",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              )),
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(top: x * 0.53),
            child: ListView.builder(
                itemCount: selected_option.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: b6, elevation: 0),
                        onPressed: () async {
                          await launch(selected_option[index]["link"]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: b9,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: 80,
                          width: 320,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  selected_option[index]["name"],
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )),
                  );
                }),
          )),
          Positioned(
              top: x * 0.25,
              left: y * 0.3,
              child: Text(
                "Click Me",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
