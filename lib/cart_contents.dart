import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:boat/cart_controller.dart';

class CartContents extends StatefulWidget {
  final Function toShopContents;
  const CartContents({Key? key, required this.toShopContents}) : super(key: key);

  @override
  State<CartContents> createState() => _CartContentsState(toShopContents);
}

class _CartContentsState extends State<CartContents> {

  Function toShopContents;
  CartController controller = Get.find();

  _CartContentsState(this.toShopContents);

  @override
  Widget build(BuildContext context) {
    if (controller.itemsInCart==0){
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 35, top: 40),
              child: Image.asset('assets/empty_cart.png')
          ),
          Container(
            height: 500,
            margin: EdgeInsets.only(top: 120),
            child: const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(
                  color: Color.fromRGBO(250, 250, 250, 0.80),
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 420, left: 95),
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 30, 0, 0.85),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: Color.fromRGBO(0, 0, 0, 0.1),
                splashColor:
                Color.fromRGBO(0, 0, 0, 0.25),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                onTap: () async{
                  await Future.delayed(Duration(milliseconds: 30));
                  toShopContents();
                },
                child: Center(
                  child: Text(
                    'Start Shopping',
                    style: TextStyle(
                      color: Color.fromRGBO(250, 250, 250, 0.85),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Obx(
      ()=> Column(
        children: [
          Container(
            height: 520, //580
            child: ListView.builder(
              itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int ix){
                  return Obx(()=> _buildProductCard(controller.products.values.toList()[ix]));
                },
            ),
          ),
          SizedBox(height:7),
          Container(
            height: 80,
            width: 365,
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 250, 250, 0.16),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                SizedBox(width: 20,),
                Container(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16,),
                      Text(
                        'Grand Total',
                        style: TextStyle(
                          color: Color.fromRGBO(250, 250, 250, 0.85),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Rs ${Get.find<CartController>().total}',
                        style: TextStyle(
                          color: Color.fromRGBO(250, 250, 250, 0.85),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 57,),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(250, 30, 0, 0.85),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: Color.fromRGBO(0, 0, 0, 0.1),
                      splashColor:
                      Color.fromRGBO(0, 0, 0, 0.25),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                            color: Color.fromRGBO(250, 250, 250, 0.85),
                            fontSize: 18,
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
    );
  }


  Widget _buildProductCard(Map<dynamic, dynamic> product) {

    final cartController = controller;

    String productImage = product['productImage'];
    String productName = product['productName'];
    int buyPrice = product['buyPrice']*cartController.products[productName]['itemCount'];
    int mrp = product['mrp']*cartController.products[productName]['itemCount'];
    int saved = (mrp - buyPrice);

    RegExp expression = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

    String fsaved = saved.toString().replaceAllMapped(expression, (Match m) => '${m[1]},');
    String fbuyPrice = buyPrice
        .toString()
        .replaceAllMapped(expression, (Match m) => '${m[1]},');
    String fmrp = mrp.toString().replaceAllMapped(expression, (Match m) => '${m[1]},');

    return Column(
      children: [
        SizedBox(height: 7,),
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
                    padding: EdgeInsets.only(left: 12, bottom: 5),
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
                          children: [
                            Text(
                              'Rs $fbuyPrice',
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
                          'Rs $fsaved   Saved',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 128,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        cartController.removeProduct(productName);
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.remove_circle, size: 25,)
                                  ),
                                  Text(
                                    '${cartController.products[productName]['itemCount']}',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (){
                                        cartController.addFromCart(productName);
                                      },
                                      icon: Icon(Icons.add_circle, size: 25,)
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                cartController.deleteProduct(productName);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete, size: 30,),
                            ),
                            SizedBox(width:2),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


