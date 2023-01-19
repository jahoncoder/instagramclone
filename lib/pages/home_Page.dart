import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_1/pages/like_Page.dart';
import 'package:flutter_application_1/pages/post_Page.dart';
import 'package:flutter_application_1/pages/profil_Page.dart';
import 'package:flutter_application_1/pages/search_Page.dart';
import 'package:flutter_application_1/pages/upload_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _hozirgiIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.red,
        onTap: (index) {
          setState(() {
            _hozirgiIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.linear);
        },
        currentIndex: _hozirgiIndex,
        activeColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: ""),
        ],
      ),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _hozirgiIndex = index;
            });
          },
          controller: _pageController,
          children: [
            PostPage(
              pageController: _pageController,
            ),
            SearchPage(),
            UploadPage(
              pageController: _pageController,
            ),
            LikePage(),
            ProfilPage()
          ]),
    );
  }
}
