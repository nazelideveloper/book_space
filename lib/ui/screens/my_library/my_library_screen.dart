import 'dart:convert';

import 'package:book_space/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  _MyLibraryScreenState createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  List popularBooks = [];

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/books.json")
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
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: mainAppBar('My Library'),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(12.0),
          itemCount: popularBooks == null ? 0 : popularBooks.length,
          itemBuilder: (_, i) {
            return Row(
              children: [
                Image(
                  image: AssetImage('assets/images/pic-6.png'),
                  width: screenSize.width * 0.3,
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    width: screenSize.width * 0.12,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              'Baby is Coming',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        Text(
                          'Phillip Anthony',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        RatingBar(
                          itemCount: 5,
                          initialRating: 4.5,
                          maxRating: 15,
                          itemSize: 14.0,
                          allowHalfRating: true,
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star),
                            half: Icon(Icons.star_half),
                            empty: Icon(Icons.star_border_outlined),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        Text(
                          '\$ 12.99',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
