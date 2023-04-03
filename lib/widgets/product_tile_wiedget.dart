import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../helper/app_colors.dart';
import '../provider/product_provider.dart';

class ProductTileWidget extends StatelessWidget {
  ProductTileWidget({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    final mediaW = MediaQuery.of(context).size.width;
    final mediaH = MediaQuery.of(context).size.height;
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 7,
            left: 7,
            right: 7,
            bottom: 7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              (index == 1)
                  ? 'assets/images/glaxyWatch.png'
                  : (index == 0)
                      ? 'assets/images/appleWatch.png'
                      : (index == 2)
                          ? 'assets/images/mixWatxh.png'
                          : 'assets/images/amazFitWatch.png',
              //height: 110,
              width: mediaW * 0.32,
            ),
            SizedBox(
              height: mediaH * 0.01,
            ),
            Text(
              '${productProvider.products[index].name}',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                color: blackColor(),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: mediaH * 0.01,
            ),
            Text(
              '${productProvider.products[index].series}',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                color: grayColor(),
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: mediaH * 0.01,
            ),
            Text(
              '\$${productProvider.products[index].price}',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                color: blackColor(),
                fontSize: 18,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
