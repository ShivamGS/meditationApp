import 'package:dhyann/colors.dart';
import 'package:dhyann/data/data.dart';
import 'package:dhyann/global.dart';
import 'package:dhyann/lists.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(X[0][selected_option]),
      ),
      backgroundColor: b7,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Center(
          child: ListView.builder(
              itemCount: selected_option.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: b1, elevation: 0),
                      onPressed: () async {
                        await launch(selected_option[index]["link"]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: b3,
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
                                style: TextStyle(fontSize: 20, color: b1),
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              }),
        ),
      ),
    );
  }
}
