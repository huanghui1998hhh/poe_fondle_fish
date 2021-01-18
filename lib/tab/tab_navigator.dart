import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poe_fondle_fish/tab/poe_db_page.dart';
import 'package:poe_fondle_fish/tab/trade_page.dart';

// ignore: must_be_immutable
class MyTab extends StatefulWidget {
  MyTab({Key key, this.index = 0}) : super(key: key);
  int index;
  @override
  _MyTabState createState() => _MyTabState();
}

class _MyTabState extends State<MyTab>
    with RouteAware, SingleTickerProviderStateMixin {
  int _selectedIndex;
  PageController _pageController;

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // 从其他页面pop回当前页面走这里
    print('返回');
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            PoeDbPage(),
            TradePage(),
          ],
        ),
        bottomNavigationBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              label: '编年史',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.change_history),
              label: '网页市集',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          backgroundColor: Theme.of(context).cardColor.withOpacity(0.8),
        ),
      ),
    );
  }
}
