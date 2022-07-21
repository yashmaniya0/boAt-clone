import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boat/cart_controller.dart';

class ShopContents extends StatefulWidget {
  final Map products;
  
  const ShopContents({Key? key, required this.products}) : super(key: key);

  @override
  State<ShopContents> createState() => _ShopContentsState(products);
}

class _ShopContentsState extends State<ShopContents>
    with TickerProviderStateMixin {

  Map allProducts;
  _ShopContentsState(this.allProducts);

  @override
  Widget build(BuildContext context) {
    // for tab-bar
    TabController _tabController = TabController(length: 6, vsync: this);

    return Column(children: [
      TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: const Color.fromRGBO(255, 255, 255, 1),
        unselectedLabelColor: Colors.white60,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        indicatorColor: const Color.fromRGBO(255, 0, 0, 1),
        indicatorWeight: 3.5,
        tabs: const [
          Tab(
            child: Text('Airdopes'),
          ),
          Tab(
            child: Text('Headphones'),
          ),
          Tab(
            child: Text('Neckbands'),
          ),
          Tab(
            child: Text('Wired Earphones'),
          ),
          Tab(
            child: Text('Speakers'),
          ),
          Tab(
            child: Text('Smartwatches'),
          ),
        ],
      ),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildProductsTab('airdopes'),
            _buildProductsTab('headphones'),
            _buildProductsTab('neckbands'),
            _buildProductsTab('wired'),
            _buildProductsTab('speakers'),
            _buildProductsTab('smartwatches'),
          ],
        ),
      ),
    ]);
  }

  Widget _buildProductsTab(String category) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView.builder(
        itemCount: allProducts[category].length,
        itemBuilder: (BuildContext context, int ix){
          return _buildProductCard(allProducts, category, ix);
        },
      ),
    );
  }

  Widget _buildProductCard(Map<dynamic, dynamic> allProducts, String category, int index) {

    final cartController = Get.put(CartController());

    String productImage = allProducts[category][index]['productImage'];
    String productName = allProducts[category][index]['productName'];
    int filledStars = allProducts[category][index]['filledStars'];
    int reviews = allProducts[category][index]['reviews'];
    int sellingPrice = allProducts[category][index]['sellingPrice'];
    int mrp = allProducts[category][index]['mrp'];

    int discount = ((mrp - sellingPrice) / mrp * 100).round();
    RegExp expression = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String fSellPrice = sellingPrice
        .toString()
        .replaceAllMapped(expression, (Match m) => '${m[1]},');
    String fmrp =
        mrp.toString().replaceAllMapped(expression, (Match m) => '${m[1]},');

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            onTap: () {
              print('Product Tapped');
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.9),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Image.asset(
                      productImage,
                      height: 150,
                    ),
                  ),
                  Container(
                    width: 227,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    padding: EdgeInsets.only(left: 12, bottom: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Text(
                            productName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: List<int>.generate(6, (i) => i + 1).map((i) {
                            if (i <= filledStars) {
                              return Icon(
                                Icons.star,
                                color: Colors.red,
                              );
                            } else if (i <= 5) {
                              return Icon(
                                Icons.star_border,
                                color: Colors.red,
                              );
                            }
                            return Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                '($reviews)',
                                style: TextStyle(
                                  color: Color.fromRGBO(50, 50, 50, 0.6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Container(
                          height: 3,
                          color: Color.fromRGBO(100, 100, 100, 0.25),
                          margin: EdgeInsets.only(top: 7, bottom: 7, right: 15),
                        ),
                        Row(
                          children: [
                            Text(
                              'Rs $fSellPrice',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Rs $fmrp',
                              style: TextStyle(
                                color: Color.fromRGBO(50, 50, 50, 0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '$discount % off',
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(220, 20, 0, 0.9),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              highlightColor: Color.fromRGBO(0, 0, 0, 0.1),
                              splashColor:
                                  Color.fromRGBO(0, 0, 0, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              onTap: () {                                                 // ADD TO CART Button fn
                                cartController.addProduct(allProducts[category][index]);

                                final snackbar = SnackBar(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2),
                                  content: Container(
                                    height: 55, // 75
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            'Product added to Cart',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const SizedBox(height: 4,),
                                        Text.rich(TextSpan(
                                          text: '${allProducts[category][index]['productName']}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w200,
                                              color: Color.fromRGBO(255, 80, 60, 1),
                                            ),
                                          children : const <InlineSpan>[
                                            TextSpan(
                                              text: ' added successfully !',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(255, 255, 255, 0.8),
                                              ),
                                            ),
                                          ]
                                        )),
                                      ],
                                    ),
                                  ),
                                  // action: SnackBarAction(
                                  //   label: 'Dismiss',
                                  //   onPressed: (){},
                                  // ),
                                );
                                
                                ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackbar);
                              },
                              child: Center(
                                child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 7,)
      ],
    );
  }
}
