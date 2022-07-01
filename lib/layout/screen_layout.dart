import 'package:amazon_clone/utils/color_theme.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: const [
            Center(
              child: Text('Home screen'),
            ),
            Center(
              child: Text('account screen'),
            ),
            Center(
              child: Text('Cart screen'),
            ),
            Center(
              child: Text('More screen'),
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          onTap: (int page) {
            pageController.jumpToPage(page);
            setState(() {
              currentPage = page;
            });
          },
          tabs: [
            Tab(
              child: Icon(
                Icons.home_outlined,
                color: currentPage == 0 ? activeCyanColor : Colors.black,
              ),
            ),
            Tab(
              child: Icon(
                Icons.account_circle_outlined,
                color: currentPage == 1 ? activeCyanColor : Colors.black,
              ),
            ),
            Tab(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: currentPage == 2 ? activeCyanColor : Colors.black,
              ),
            ),
            Tab(
              child: Icon(
                Icons.menu,
                color: currentPage == 3 ? activeCyanColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
