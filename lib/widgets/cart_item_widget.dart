import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/screens/product_screen.dart';

import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'package:amazon_clone/widgets/rounded_square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(productModel: product),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Image.network(
                          product.url,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    ProductInformationWidget(
                        productName: product.productName,
                        cost: product.cost,
                        sellerName: product.sellerName)
                  ],
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Row(
                children: [
                  RoundedSquareButton(
                      child: Icon(Icons.remove),
                      onPressed: () {},
                      color: backgroundColor,
                      dimension: 50.h),
                  RoundedSquareButton(
                      child: Text(
                        '0',
                        style:
                            TextStyle(color: activeCyanColor, fontSize: 18.sp),
                      ),
                      onPressed: () {},
                      color: Colors.grey[200]!,
                      dimension: 50.h),
                  RoundedSquareButton(
                      child: const Icon(Icons.add),
                      onPressed: () {},
                      color: backgroundColor,
                      dimension: 50.h),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CustomSimpleRoundedButton(
                          onPressed: () {}, text: 'Delete'),
                      SizedBox(
                        width: 15.w,
                      ),
                      CustomSimpleRoundedButton(
                          onPressed: () {}, text: 'Save for later'),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'See more like this',
                      style: TextStyle(color: activeCyanColor, fontSize: 15.sp),
                    ),
                  )
                ],
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
