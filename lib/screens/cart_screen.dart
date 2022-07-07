import 'package:amazon_clone/models/user_model_details.dart';
import 'package:amazon_clone/utils/color_theme.dart';
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
          child: Column(
            children: [
              UserDetailsBar(
                offset: 0,
                userDetails: UserDetailsModel(name: 'Pankaj', address: 'Bhuj'),
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
                    itemBuilder: ((context, index) => CartItemWidget())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
