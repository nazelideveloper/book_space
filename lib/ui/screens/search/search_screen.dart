import 'package:book_space/constants/widget_styles.dart';
import 'package:book_space/utilities/bs_colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Center(
            child: Scaffold(
              appBar: mainAppBar('Search'),
              bottomSheet: TabBar(
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(vertical: 8),
                isScrollable: true,
                labelColor: BSColors.textBlackColor,
                unselectedLabelColor: BSColors.textGrayColor,
                labelStyle: titleTextStyle,
                unselectedLabelStyle: lightGrayTextStyle,
                tabs: [

                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(right: 23),
                      child: Text('Literature'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(right: 23),
                      child: Text('Economy'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(right: 23),
                      child: Text('Philosophy'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(right: 23),
                      child: Text('Entirtainment'),
                    ),
                  ),
                ],
              ),
              body: TabBarView(
                children: [
                  Icon(Icons.icecream_outlined),
                  Icon(Icons.icecream_outlined),
                  Icon(Icons.icecream_outlined),
                  Icon(Icons.icecream_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
