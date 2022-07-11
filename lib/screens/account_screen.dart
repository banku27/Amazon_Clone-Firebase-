import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/models/user_model_details.dart';
import 'package:amazon_clone/provider/user_detail_provider.dart';
import 'package:amazon_clone/screens/sell_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/account_screen_app_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/product_show_case_list.dart';
import 'package:amazon_clone/widgets/simple_product_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    // UserDetailsModel userDetailsModel =
    //     Provider.of<UserDetailProvider>(context).userDetails;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const IntroductionWidgetAccountScreen(),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.orange,
                      isLoading: false,
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                      child: const Text("Sell",
                          style: TextStyle(color: Colors.black)),
                      color: yellowColor,
                      isLoading: false,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SellScreen()));
                      }),
                ),
                FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("orders")
                        .get(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      } else {
                        List<Widget> children = [];
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          ProductModel model = ProductModel.getModelFromJson(
                              json: snapshot.data!.docs[i].data());
                          children
                              .add(SimpleProductWidget(productModel: model));
                        }
                        return ProductShowList(
                            title: "Your orders", children: children);
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Order Requests',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => ListTile(
                      title: const Text(
                        "Order: Boat Earbuds 1600",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('Address: Somewhere on Earth'),
                      trailing: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.check)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailProvider>(context).userDetails;
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.000000000001)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: "${userDetailsModel.name}",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
