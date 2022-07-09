import 'dart:typed_data';

import 'package:amazon_clone/provider/user_detail_provider.dart';
import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  List<int> keysForDiscount = [0, 70, 60, 50];

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                          )
                                        : Image.memory(
                                            image!,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
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
                                        icon: const Icon(Icons.file_upload))
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
                                  icon: const Icon(Icons.file_upload),
                                ),
                          SizedBox(
                            height: 10.h,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFieldWidget(
                                    title: "Name",
                                    controller: nameController,
                                    obscureText: false,
                                    hintText: "Name of the item"),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFieldWidget(
                                    title: "Cost",
                                    controller: costController,
                                    obscureText: false,
                                    hintText: "Cost of the item"),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text(
                                  "Discount",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                ListTile(
                                  title: const Text("None"),
                                  leading: Radio(
                                    value: 1,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(() {
                                        selected = i!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text("70%"),
                                  leading: Radio(
                                    value: 2,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(() {
                                        selected = i!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text("60%"),
                                  leading: Radio(
                                    value: 3,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(() {
                                        selected = i!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text("50%"),
                                  leading: Radio(
                                    value: 4,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(() {
                                        selected = i!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomMainButton(
                              child: const Text(
                                'Sell',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              color: yellowColor,
                              isLoading: false,
                              onPressed: () async {
                                String? output = await CloudFirestoreClass()
                                    .uploadProductToDatabase(
                                        image: image,
                                        productName: nameController.text,
                                        rawCost: costController.text,
                                        discount: keysForDiscount[selected - 1],
                                        sellerName:
                                            Provider.of<UserDetailProvider>(
                                                    context,
                                                    listen: false)
                                                .userDetails
                                                .name,
                                        sellerUid: FirebaseAuth
                                            .instance.currentUser!.uid);
                                if (output == 'success') {
                                  Utils().showSnackBar(
                                      context: context,
                                      content: 'Details Captured');
                                } else {
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              }),
                          CustomMainButton(
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              color: Colors.grey[300]!,
                              isLoading: false,
                              onPressed: () {
                                Navigator.pop(context);
                              })
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
