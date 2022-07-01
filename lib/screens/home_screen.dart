import 'package:amazon_clone/widgets/categories_horizontal_list_bar.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SearchBarWidget(
            isReadOnly: true,
            hasBackButton: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CategoryListView(),
              ],
            ),
          )),
    );
  }
}
