import 'package:book_space/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Profile'),
      body: Center(
        child: Text(
          "ProfileScreen",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
