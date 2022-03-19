// ignore_for_file: file_names

import 'package:dhyann/details.dart';
import 'package:dhyann/global.dart';
import 'package:dhyann/lists.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class meditationpage extends StatelessWidget {
  const meditationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListView(context),
      backgroundColor: Colors.white,
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 5),
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 200,
                          width: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(content[index]['url']),
                            fit: BoxFit.fill,
                          )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              content[index]["name"],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border),
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () {
              selected_option = select[index];
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPage(index)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.white),
          ),
        );
      },
    );
  }
}
