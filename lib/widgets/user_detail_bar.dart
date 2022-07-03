import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:amazon_clone/models/user_model_details.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;
  final UserDetailsModel userDetails;
  const UserDetailsBar({
    Key? key,
    required this.offset,
    required this.userDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -offset / 4,
      child: Container(
        height: 40.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: lightBackgroundaGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 3.h,
            horizontal: 20.w,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                width: 250.w,
                child: Text(
                  "Deliver to ${userDetails.name} - ${userDetails.address}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
