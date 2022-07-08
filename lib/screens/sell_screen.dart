import 'dart:typed_data';

import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: !isLoading
            ? SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          image == null
                              ? Stack(
                                  children: [
                                    image == null
                                        ? Image.network(
                                            "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                                            // height: screenSize.height / 10,
                                          )
                                        : Image.memory(
                                            image!,
                                            // height: screenSize.height / 10,
                                          ),
                                    IconButton(
                                        onPressed: () async {
                                          Uint8List? temp =
                                              await Utils().pickImage();
                                          if (temp != null) {
                                            setState(() {
                                              image = temp;
                                            });
                                          }
                                        },
                                        icon: Icon(Icons.file_upload))
                                  ],
                                )
                              : IconButton(
                                  onPressed: () async {
                                    Uint8List? temp = await Utils().pickImage();
                                    if (temp != null) {
                                      setState(() {
                                        image = temp;
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.file_upload),
                                ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const CircularProgressIndicator(
                color: Colors.orange,
              ),
      ),
    );
  }
}
