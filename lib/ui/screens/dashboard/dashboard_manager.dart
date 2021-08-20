import 'package:book_space/ui/screens/home/home_screen.dart';
import 'package:book_space/ui/screens/my_library/my_library_screen.dart';
import 'package:book_space/ui/screens/profile/profile_screen.dart';
import 'package:book_space/ui/screens/search/search_screen.dart';
import 'package:book_space/utilities/bs_colors.dart';
import 'package:flutter/material.dart';

class DashboardManager extends StatefulWidget {
  const DashboardManager({Key? key}) : super(key: key);

  @override
  _DashboardManagerState createState() => _DashboardManagerState();
}

class _DashboardManagerState extends State<DashboardManager> {
  int currentTab = 0;

  final List<Widget> screens = [
    HomeScreen(),
    MyLibraryScreen(),
    ProfileScreen(),
    SearchScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          body: TabBarView(
            children: [
              HomeScreen(),
              SearchScreen(),
              MyLibraryScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white24,
            child: TabBar(
              // unselectedLabelColor: Colors.redAccent,
              // indicatorSize: TabBarIndicatorSize.tab,
              // indicator: BoxDecoration(
              //     gradient: LinearGradient(
              //         colors: [Colors.redAccent, Colors.orangeAccent]),
              //     borderRadius: BorderRadius.circular(50),
              //     color: Colors.redAccent),
              tabs: [
                Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                Icon(
                  Icons.search,
                  size: 30,
                ),
                Icon(
                  Icons.local_library_outlined,
                  size: 30,
                ),
                Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ),
              ],
              labelColor: BSColors.mainOrange,
              unselectedLabelColor: BSColors.textGrayColor,
            ),
          ),
        ),
      ),
    );
  }
}
