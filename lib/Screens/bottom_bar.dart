import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silend/Screens/home_page.dart';
import 'package:silend/Screens/request_payment.dart';
import 'package:silend/Screens/transactions_screens.dart';
import 'package:silend/Screens/uploadRequest.dart';
import 'package:silend/Screens/user_info.dart';
import 'package:silend/Services/user_state.dart';

import '../Providers/dark_theme_provider.dart';
import 'AdminScreens/allUsers.dart';
import 'AdminScreens/chatLists.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  // List<Map<String, Object>> _pages;
  ScrollController? _scrollController;
  var top = 0.0;

  @override
  void initState() {
    pages = [
      HomePage(),
      const TransactionsHistoryPage(),
      const RequestPaymentPage(),
      // UserInfoScreen(),
      UserNSearch(),
      UploadRequestScreen()
    ];
    //
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {});
    });
    // getData();
  }

  int _selectedPageIndex = 0;
  late List pages;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.lightBlue, Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: pages[_selectedPageIndex], //_pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomAppBar(
          // color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 0.01,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: kBottomNavigationBarHeight * 0.98,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                onTap: _selectPage,
                backgroundColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.black,
                selectedItemColor: const Color(0xff805130),
                currentIndex: _selectedPageIndex,
                // selectedLabelStyle: TextStyle(fontSize: 16),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.area_chart_outlined),
                      label: 'Transactions'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.room_service), label: 'Fund Requests'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                      ),
                      label: 'My Profile'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.people,
                      ),
                      label: 'All Users'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.chat_bubble,
                      ),
                      label: 'Admin Chats'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController!.hasClients) {
      double offset = _scrollController!.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down

        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down

        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget userListTile(
      String title, String subTitle, int index, BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(_userTileIcons[index]),
    );
  }

  Widget userTitle({required String title, Color color: Colors.yellow}) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color),
      ),
    );
  }
}
