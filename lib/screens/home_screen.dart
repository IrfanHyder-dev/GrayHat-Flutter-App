import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../helper/app_colors.dart';
import '../provider/product_provider.dart';
import '../widgets/product_tile_wiedget.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  ProductProvider productProvider =
      Provider.of<ProductProvider>(Get.context!, listen: true);
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    productProvider.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaW = MediaQuery.of(context).size.width;
    final mediaH = MediaQuery.of(context).size.height;
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: lightBlueColor(),
      body: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaH * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 33),
                Container(
                  height: mediaH * 0.06,
                  width: mediaW * 0.6,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        color: const Color(0xFFd9d9d9).withOpacity(.3),
                        blurRadius: 15,
                      )
                    ],

                    borderRadius: BorderRadius.circular(15),
                    //color: Colors.white,
                  ),
                  child: TextFormField(
                    //controller: _UN,

                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        color: blackColor(),
                        size: 26,
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 15, right: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: grayColor(),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: grayColor(),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: grayColor(),
                        ),
                      ),
                      hintText: 'search product',
                      hintStyle: TextStyle(
                        fontFamily: 'Outfit',
                        color: grayColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mediaH * 0.025,
            ),
            const Text(
              'find your suitable\nwatch now.',
              style: TextStyle(
                fontFamily: 'OUtfit',
                fontSize: 33,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: mediaH * 0.04,
            ),
            Container(
              height: mediaH * 0.64,
              width: mediaW,
              child: Column(
                children: [
                  TabBar(
                      controller: _tabController,
                      indicatorColor: bluecolor(),
                      labelColor: bluecolor(),
                      unselectedLabelColor: grayColor(),
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      tabs: const [
                        Tab(
                          child: Text(
                            'Smart watch',
                            style: TextStyle(
                              fontFamily: 'OutFit',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Casio',
                            style: TextStyle(
                              fontFamily: 'OutFit',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Tisto',
                            style: TextStyle(
                              fontFamily: 'OutFit',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Siko',
                            style: TextStyle(
                              fontFamily: 'OutFit',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ]),
                  // SizedBox(
                  //   height: mediaH * 0.05,
                  // ),
                  Expanded(child: Consumer<ProductProvider>(
                    builder: (context, value, child) {
                      return (value.isLoading)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              padding:
                                  const EdgeInsets.only(left: 17, right: 17),
                              child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    GridView.builder(
                                      itemCount: value.products.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.0,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 185,
                                        crossAxisSpacing:
                                            (MediaQuery.of(context)
                                                        .size
                                                        .width ~/
                                                    250)
                                                .toDouble(),
                                      ),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            productProvider.index = index;
                                            Navigator.pushNamed(
                                                context, DetailScreen.route);
                                          },
                                          child: ProductTileWidget(
                                            index: index,
                                          ),
                                        );
                                      },
                                    ),
                                    Center(
                                        child: Text(
                                      'Currently No Data',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontSize: 20,
                                        color: blackColor(),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                    Center(
                                        child: Text(
                                      'Currently No Data',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontSize: 20,
                                        color: blackColor(),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                    Center(
                                        child: Text(
                                      'Currently No Data',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontSize: 20,
                                        color: blackColor(),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                  ]),
                            );
                    },
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
