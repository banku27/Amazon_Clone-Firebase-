import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;
  @override
  Widget build(BuildContext context) {
    double smallAdDimension = MediaQuery.of(context).size.width / 5;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentAd == (largeAds.length - 1)) {
          currentAd = -1;
        }
        setState(() {
          currentAd++;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[currentAd],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: smallAdDimension,
            width: MediaQuery.of(context).size.width,
            color: backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallAdWidget(
                  index: 0,
                  side: smallAdDimension,
                ),
                getSmallAdWidget(
                  index: 1,
                  side: smallAdDimension,
                ),
                getSmallAdWidget(
                  index: 2,
                  side: smallAdDimension,
                ),
                getSmallAdWidget(
                  index: 3,
                  side: smallAdDimension,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget getSmallAdWidget({required int index, required double side}) {
  return Container(
    height: side,
    width: side,
    decoration: ShapeDecoration(
      color: Colors.white,
      shadows: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              smallAds[index],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                adItemNames[index],
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
