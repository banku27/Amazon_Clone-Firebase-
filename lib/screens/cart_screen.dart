import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/models/user_model_details.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/cart_item_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_detail_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(isReadOnly: true, hasBackButton: false),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: kAppBarHeight / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomMainButton(
                        child: const Text('Proceed to buy (n) items',
                            style: TextStyle(color: Colors.black)),
                        color: yellowColor,
                        isLoading: false,
                        onPressed: () {}),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: ((context, index) => CartItemWidget(
                            product: ProductModel(
                                url:
                                    'https://m.media-amazon.com/images/I/81zgxmLFpyL._SL1500_.jpg',
                                productName: 'Laptop Table',
                                cost: 197.29,
                                discount: 0,
                                uid: 'Banku',
                                sellerName: 'Sreeeeeeeejaa',
                                sellerUid: 'sreeeja8',
                                rating: 1,
                                noOfRating: 1),
                          )),
                    ),
                  ),
                ],
              ),
              UserDetailsBar(
                offset: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
