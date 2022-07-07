import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.network(
                      "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
                    ),
                  ),
                ),
                ProductInformationWidget(
                    productName: 'Laptop Table',
                    cost: 197.3,
                    sellerName: 'Sreeeeeeja')
              ],
            ),
            flex: 5,
          ),
          Expanded(
            child: Container(color: Colors.blue),
            flex: 1,
          ),
          Expanded(
            child: Container(color: Colors.green),
            flex: 1,
          )
        ],
      ),
    );
  }
}
