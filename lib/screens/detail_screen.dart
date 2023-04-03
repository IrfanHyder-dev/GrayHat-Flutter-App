import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/app_colors.dart';
import '../provider/product_provider.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});
  static const route = 'detialScreen';

  @override
  Widget build(BuildContext context) {
    final mediaW = MediaQuery.of(context).size.width;
    final mediaH = MediaQuery.of(context).size.height;
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mediaH * 0.42,
            width: mediaW,
            padding:
                const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 15),
            color: lightBlueColor(),
            child: Column(
              children: [
                SizedBox(
                  height: mediaH * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back)),
                    const Icon(Icons.favorite_border_outlined),
                  ],
                ),
                Center(
                  child: Image.asset(
                    'assets/images/appleWatch3.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaH * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${productProvider.products[productProvider.index!].name}',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: blackColor(),
                      ),
                    ),
                    Text(
                      '\$${productProvider.products[productProvider.index!].price}',
                      style: const TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5534A5),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: mediaH * 0.01,
                ),
                Text(
                  '(with solo app)',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: grayColor(),
                  ),
                ),
                SizedBox(
                  height: mediaH * 0.02,
                ),
                Text(
                  'Colors',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: blackColor(),
                  ),
                ),
                SizedBox(
                  height: mediaH * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      height: mediaH * 0.07,
                      width: mediaW * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xffCCBCBC),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Color(0xffDA7777),
                              maxRadius: 10,
                            ),
                            Text(
                              'Chalk pink',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Outfit',
                                  color: Color(0xffBAAAAA),
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: mediaH * 0.07,
                      width: mediaW * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: blackColor(),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Color(0xffEB55C1),
                              maxRadius: 10,
                            ),
                            Text(
                              'Light pink',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Outfit',
                                  color: Color(0xffBAAAAA),
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      height: mediaH * 0.07,
                      width: mediaW * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xffCCBCBC),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Color(0xff676060),
                              maxRadius: 10,
                            ),
                            Text(
                              'Dark order',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Outfit',
                                  color: Color(0xffBAAAAA),
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaH * 0.02,
                ),
                Row(
                  children: [
                    const Text(
                      'Detail',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          color: Color(0xffBAAAAA),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: mediaW * 0.1,
                    ),
                    const Text(
                      'Review',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          color: Color(0xffBAAAAA),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaH * 0.02,
                ),
                Text(
                    '${productProvider.products[productProvider.index!].description}',
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Outfit',
                        color: Color(0xffBAAAAA),
                        fontWeight: FontWeight.w400),
                    overflow: TextOverflow.clip),
                SizedBox(
                  height: mediaH * 0.03,
                ),
                Center(
                  child: SizedBox(
                    height: mediaH * 0.068,
                    width: mediaW * 0.8,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: bluecolor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
