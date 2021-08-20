import 'dart:convert';

import 'package:book_space/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Tech {
  String label;
  Color color;

  Tech(this.label, this.color);
}

class _HomeScreenState extends State<HomeScreen> {
  List popularBooks = [];
  var selectedIndex;
  List<Tech> _chipsList = [
    Tech("Android", Colors.green),
    Tech("Flutter", Colors.blueGrey),
    Tech("Ios", Colors.deepOrange),
    Tech("Java", Colors.cyan),
    Tech("Dart or Spring", Colors.yellow)
  ];

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/popularBooks.json")
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Home'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "FOR YOU",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 21),
            height: 210,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 25, right: 6),
              itemCount: popularBooks == null ? 0 : popularBooks.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return Container(
                  padding: EdgeInsets.only(right: 19),
                  height: 210,
                  width: 153,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(popularBooks[i]["images"]),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "CHOOSE WHAT YOU LIKE",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Wrap(
            spacing: 6,
            direction: Axis.horizontal,
            children: techChips(),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "FEATURED",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.all(12.0),
                itemCount: popularBooks == null ? 0 : popularBooks.length,
                itemBuilder: (_, i) {
                  return Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/pic-8.png'),
                        width: 160,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          width: 20,
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    'My Morning Sleep',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20.0)),
                              Text(
                                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don  you need to be sure there isn ll the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20.0)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: _chipsList[i].color,
          selected: selectedIndex == i,
          onSelected: (bool value) {
            setState(() {
              selectedIndex = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
