import 'package:book_space/utilities/bs_colors.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecoration(String hintText) => InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontFamily: 'Roboto_Regular',
        fontSize: 16.0,
        color: BSColors.textGrayColor,
      ),
    );

const TextStyle inputTextStyle = TextStyle(
  fontFamily: 'Roboto_Regular',
  fontSize: 16.0,
  color: Colors.black,
);

const TextStyle buttonTextStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: "Roboto_Bold",
  color: Colors.white,
);

const TextStyle titleTextStyle = TextStyle(
  fontFamily: "Roboto_Regular",
  fontSize: 16.0,
  color: BSColors.textBlackColor,
);

const TextStyle lightGrayTextStyle = TextStyle(
  fontFamily: "Roboto_Regular",
  fontSize: 14.0,
  color: BSColors.textGrayColor,
);

const TextStyle formHintTextStyle = TextStyle(
  fontFamily: "Roboto_Italic",
  fontSize: 14.0,
  color: BSColors.textGrayColor,
);

AppBar mainAppBar(String text) => AppBar(
      title: Text(text),
      backgroundColor: BSColors.mainOrange,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
