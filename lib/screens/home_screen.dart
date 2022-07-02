import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/categories_horizontal_list_bar.dart';
import 'package:amazon_clone/widgets/product_show_case_list.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/simple_product_list.dart';
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
              children: const [
                CategoryListView(),
                BannerAdWidget(),
                ProductShowList(
                  title: 'Upto 70% off',
                  children: [
                    SimpleProductWidget(
                        url:
                            "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                    SimpleProductWidget(
                        url:
                            "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png"),
                    SimpleProductWidget(
                        url:
                            "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png"),
                    SimpleProductWidget(
                        url:
                            "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png")
                  ],
                ),
                ProductShowList(
                  title: 'Upto 50% off',
                  children: [
                    SimpleProductWidget(
                        url:
                            "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                    SimpleProductWidget(
                        url:
                            "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png"),
                    SimpleProductWidget(
                        url:
                            "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png"),
                    SimpleProductWidget(
                        url:
                            "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png")
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
