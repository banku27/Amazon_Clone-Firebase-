import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const TextFieldWidget({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
        ),
        TextField(
          obscureText: widget.obscureText,
          maxLines: 1,
          decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.r),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.orange,
                width: 1,
              ))),
        ),
      ],
    );
  }
}
