import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget(
      {Key? key, required this.isReadOnly, required this.hasBackButton})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hasBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
              : Container(),
          SizedBox(
            width: 250.w,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for something in Amazon',
                fillColor: Colors.white,
                filled: true,
                border: border,
                focusedBorder: border,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mic_none_outlined),
          ),
        ],
      ),
    );
  }
}
