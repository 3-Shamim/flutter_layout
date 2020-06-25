import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController _pageController = PageController(initialPage: 0);
  int _pageIndex = 0;
  int _pageSize = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page view"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _pageIndex > 0 ? () {
              if (_pageController.hasClients) {
                _pageController.animateToPage(--_pageIndex,
                    duration: Duration(microseconds: 250),
                    curve: Curves.bounceIn);
              }
            } : null,
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: _pageIndex < _pageSize - 1 ? () {
              if (_pageController.hasClients) {
                _pageController.animateToPage(++_pageIndex,
                    duration: Duration(microseconds: 250),
                    curve: Curves.bounceIn);
              }
            } : null,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            child: PageView(
              pageSnapping: false,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              children: <Widget>[
                Container(
                  color: Colors.grey,
                ),
                Container(
                  color: Colors.lightBlue,
                ),
                Container(
                  color: Colors.redAccent,
                ),
                Container(
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
          Expanded(
            child: Text("Expended"),
          )
        ],
      )
    );
  }
}
