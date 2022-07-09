import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/categories_horizontal_list_bar.dart';
import 'package:amazon_clone/widgets/product_show_case_list.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/simple_product_list.dart';
import 'package:amazon_clone/widgets/user_detail_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double offset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getData();
    scrollController.addListener(() {
      setState(() {
        offset = scrollController.position.pixels;
      });
      // print(scrollController.position.pixels);
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void getData() async {
    List<Widget> temp70 =
        await CloudFirestoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 =
        await CloudFirestoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 =
        await CloudFirestoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFirestoreClass().getProductsFromDiscount(0);
    print("everything is done");
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: false,
        ),
        body: discount70 != null &&
                discount60 != null &&
                discount50 != null &&
                discount0 != null
            ? Stack(
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        const CategoryListView(),
                        const BannerAdWidget(),
                        ProductShowList(
                            title: 'Upto 70% off', children: discount70!),
                        ProductShowList(
                            title: 'Upto 60% off', children: discount60!),
                        ProductShowList(
                            title: 'Upto 50% off', children: discount50!),
                        ProductShowList(title: 'Explore', children: discount0!),
                      ],
                    ),
                  ),
                  UserDetailsBar(
                    offset: offset,
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ),
      ),
    );
  }
}

  // [
                            //   SimpleProductWidget(
                            //       url:
                            //           "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                            //   SimpleProductWidget(
                            //       url:
                            //           "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png"),
                            //   SimpleProductWidget(
                            //       url:
                            //           "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png"),
                            //   SimpleProductWidget(
                            //       url:
                            //           "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png")
                            // ],