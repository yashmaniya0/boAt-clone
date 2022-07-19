import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        indicatorColor: const Color.fromRGBO(255, 0, 0, 1),
        indicatorWeight: 3.5,
        tabs: [
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
            _buildAirdopesTab(),
            _buildHeadphonesTab(),
            _buildNeckbandsTab(),
            _buildWiredTab(),
            _buildSpeakersTab(),
            _buildSmartwatchesTab(),
          ],
        ),
      ),
    ]);
  }

  Widget _buildNeckbandsTab() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: allProducts['neckbands'].map<Widget>((productData){
          return _buildProductCard(
              productData['productImage'],
              productData['productName'],
              productData['filledStars'],
              productData['reviews'],
              productData['sellingPrice'],
              productData['mrp']
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAirdopesTab() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: allProducts['airdopes'].map<Widget>((productData){
          return _buildProductCard(
              productData['productImage'],
              productData['productName'],
              productData['filledStars'],
              productData['reviews'],
              productData['sellingPrice'],
              productData['mrp']
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHeadphonesTab() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: allProducts['headphones'].map<Widget>((productData){
          return _buildProductCard(
              productData['productImage'],
              productData['productName'],
              productData['filledStars'],
              productData['reviews'],
              productData['sellingPrice'],
              productData['mrp']
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWiredTab() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: allProducts['wired'].map<Widget>((productData){
          return _buildProductCard(
              productData['productImage'],
              productData['productName'],
              productData['filledStars'],
              productData['reviews'],
              productData['sellingPrice'],
              productData['mrp']
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSpeakersTab() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: allProducts['speakers'].map<Widget>((productData){
          return _buildProductCard(
              productData['productImage'],
              productData['productName'],
              productData['filledStars'],
              productData['reviews'],
              productData['sellingPrice'],
              productData['mrp']
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSmartwatchesTab() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: allProducts['smartwatches'].map<Widget>((productData){
          return _buildProductCard(
              productData['productImage'],
              productData['productName'],
              productData['filledStars'],
              productData['reviews'],
              productData['sellingPrice'],
              productData['mrp']
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductCard(String productImage, String productName, int filledStars, int reviews, int sellingPrice, int mrp) {
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
                            color: Color.fromRGBO(220, 20, 30, 1),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              highlightColor: Color.fromRGBO(0, 0, 0, 0.1),
                              splashColor:
                                  Color.fromRGBO(0, 0, 0, 0.10196078431372549),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              onTap: () {
                                print('add to cart tapped');
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
