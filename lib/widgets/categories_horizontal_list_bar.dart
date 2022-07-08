import 'package:amazon_clone/screens/result_screen.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: ((context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultsScreen(query: categoriesList[index]),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(categoryLogos[index]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(categoriesList[index]),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
