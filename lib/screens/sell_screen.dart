import 'dart:typed_data';

import 'package:flutter/material.dart';

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
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            image == null
                                ? Image.network(
                                    "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                  )
                                : Image.memory(
                                    image!,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                  ),
                            IconButton(
                                onPressed: ()
                                    // async
                                    {
                                  // Uint8List? temp = await Utils().pickImage();
                                  // if (temp != null) {
                                  //   setState(() {
                                  //     image = temp;
                                  //   });
                                  // }
                                },
                                icon: Icon(Icons.file_upload))
                          ],
                        ),
                      ],
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
