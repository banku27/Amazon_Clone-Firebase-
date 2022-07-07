import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'package:amazon_clone/widgets/rounded_square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key}) : super(key: key);

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.network(
                        "https://m.media-amazon.com/images/I/81zgxmLFpyL._SL1500_.jpg",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  const ProductInformationWidget(
                      productName: 'Laptop Table',
                      cost: 197.3,
                      sellerName: 'Sreeeeeeja')
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Row(
                children: [
                  RoundedSquareButton(
                      child: Icon(Icons.remove),
                      onPressed: () {},
                      color: Colors.grey[200]!,
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
                      child: Icon(Icons.add),
                      onPressed: () {},
                      color: Colors.grey[200]!,
                      dimension: 50.h),
                ],
              ),
              flex: 0,
            ),
            Expanded(
              child: Container(color: Colors.green),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
