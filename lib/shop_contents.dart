import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ShopContents extends StatefulWidget {
  const ShopContents({Key? key}) : super(key: key);

  @override
  State<ShopContents> createState() => _ShopContentsState();
}

class _ShopContentsState extends State<ShopContents>  with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    // for tab-bar
    TabController _tabController = TabController(length: 6, vsync: this);

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: const Color.fromRGBO(255, 255, 255, 1),
          unselectedLabelColor: Colors.white60,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          indicatorColor: const Color.fromRGBO(255, 0, 0, 1),
          indicatorWeight: 3.5,
          tabs: [
            Tab(
            child: Text('True Wireless'),
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
      ]
    );
  }


  Widget _buildNeckbandsTab(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: [
          _buildProductCard('assets/products/neckbands/rockerz255.jpg', 'boAt Rockerz 255',5,145482, 999, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/rockerz255f.jpg', 'boAt Rockerz 255 F',5,329742, 949, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/rockerz333red.jpg', 'boAt Rockerz 255 Pro',5,426574, 1399, 3490),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/rockerz255neo.jpg', 'boAt Rockerz 255 Neo',4,114264, 1299, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/rockerz260.jpg', 'boAt Rockerz 260',4,154526, 799, 2499),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/rockerz261.jpg', 'boAt Rockerz 261',4,248156, 1199, 4990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/rockerz333.jpg', 'boAt Rockerz 333',5,146529, 1499, 3990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/rockerz333pro.jpg', 'boAt Rockerz 333 Pro',4,86214, 1699, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/rockerz375.jpg', 'boAt Rockerz 375',4,56842, 1499, 3999),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/trebel235.jpg', 'boAt TRebel 235',4,94452, 1199, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/trebel255pro.jpg', 'boAt TRebel 255 Pro',5,78456, 1399, 3499),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/neckbands/boat100.jpg', 'boAt 100 Wireless',3,12489, 1499, 2999),
          SizedBox(height: 7,),
        ],
      ),
    );
  }


  Widget _buildAirdopesTab(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: [
          _buildProductCard('assets/products/airdopes/airdopes131.jpg', 'boAt Airdopes 131',5,145482, 1199, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes141.jpg', 'boAt Airdopes 141',5,329742, 1499, 4490),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes381.jpg', 'boAt Airdopes 381',5,426574, 2099, 4990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes421.jpg', 'boAt Airdopes 421',4,114264, 2499, 5990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes441.jpg', 'boAt Airdopes 441',4,154526, 2499, 5999),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes441pro.jpg', 'boAt Airdopes 441 Pro',4,248156, 2499, 5999),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes451.jpg', 'boAt Airdopes 451',5,146529, 1999, 5999),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes641.jpg', 'boAt Airdopes 641',4,86214, 2999, 6990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes131captainamerica.jpg', 'boAt Airdopes 131 [Captain America Edition]',5,78456, 1599, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/airdopes/airdopes131ironman.jpg', 'boAt Airdopes 131 [IronMan Edition]',3,94452, 1599, 2990),
          SizedBox(height: 7,),
        ],
      ),
    );
  }

  Widget _buildHeadphonesTab(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: [
          _buildProductCard('assets/products/headphones/rockeraz550.jpg', 'boAt Rockerz 550',5,329742, 1799, 4999),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/rockerz370.png', 'boAt Rockerz 370',4,56842, 999, 2490),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/rockerz400.png', 'boAt Rockerz 400',5,248156, 1299, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/rockerz425.jpg', 'boAt Rockerz 425',4,114264, 1299, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/rockerz450.jpg', 'boAt Rockerz 450',4,426574, 1399, 3990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/rockerz510.jpg', 'boAt Rockerz 510',5,345116, 1399, 3490),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/rockerz650.png', 'boAt Rockerz 650',5,146529, 1699, 3990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/nirvana1007anc.png', 'boAt Nirvana 1007ANC',5,16214, 9999, 19999),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/immortal1300.png', 'boAt Immortal 1300',4,26842, 2899, 9990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/immortal200.png', 'boAt Immortal 200',4,28456, 1499, 4990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/headphones/immortal700.png', 'boAt Immortal 700',4,12489, 2399, 6990),
          SizedBox(height: 7,),
        ],
      ),
    );
  }

  Widget _buildWiredTab(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: [
          _buildProductCard('assets/products/wired/bassheads100.png', 'boAt BassHeads 100',3,145482, 399, 999),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/wired/bassheads103.png', 'boAt BassHeads 103',4,329742, 499, 1290),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/wired/bassheads162.png', 'boAt BassHeads 162',4,426574, 449, 1290),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/wired/bassheads225.png', 'boAt BassHeads 225',5,114264, 699, 999),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/wired/bassheads242.png', 'boAt BassHeads 242',4,154526, 599, 1490),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/wired/bassheads242blue.png', 'TRebel BassHeads 242',5,248156, 599, 1490),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/wired/bassheads242lime.png', 'TRebel BassHeads 242',5,146529, 599, 1490),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/wired/trebel103.png', 'boAt TRebel 641',4,86214, 499, 1290),
        ],
      ),
    );
  }

  Widget _buildSpeakersTab(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: [
          _buildProductCard('assets/products/speakers/stone500.png', 'boAt Stone 131',4,45482, 1999, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/speakers/rugby.png', 'boAt Rugby',5,29742, 1499, 3990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/speakers/stone1450.png', 'boAt Stone 1450',4,26574, 3999, 8990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/speakers/stone1200f.png', 'boAt Stone 1200 F',5,14264, 3899, 6990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/speakers/stone180.png', 'boAt Stone 180',4,54526, 1299, 2490),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/speakers/stone200.png', 'boAt Stone 200',5,48156, 1299, 2990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/speakers/partypal60.png', 'boAt Party Pal 60',4,6214, 4499, 9990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/speakers/partypal50.png', 'boAt Party Pal 50',5,8456, 3799, 7990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/speakers/blitz2000.png', 'boAt Blitz 2000',5,4452, 4999, 8990),
          SizedBox(height: 7,),
        ],
      ),
    );
  }

  Widget _buildSmartwatchesTab(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: [
          _buildProductCard('assets/products/smartwatches/storm.png', 'boAt Storm',4,45482, 2699, 5990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/smartwatches/watchblaze.png', 'boAt Watch Blaze',5,29742, 3499, 6990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/smartwatches/watchflash.png', 'boAt Watch Flash',4,26574, 2499, 6990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/smartwatches/watchiris.png', 'boAt Watch Iris',5,14264, 4399, 11990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/smartwatches/watchmystiq.png', 'boAt Watch Mystiq',4,24526, 3199, 6990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/smartwatches/watchvertex.png', 'boAt Watch Vertex',3,18156, 2299, 6990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/smartwatches/watchwavepro.png', 'boAt Watch Wave Pro',4,6214, 3299, 6990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/smartwatches/watchxtend.png', 'boAt Watch Xtend',4,8456, 2999, 7990),
          SizedBox(height: 7,),
          _buildProductCard('assets/products/smartwatches/watchzenit.png', 'boAt Watch Zenit',5,15456, 1999, 6990),
        ],
      ),
    );
  }


  Widget _buildProductCard(String productImage, String productName,int filledStars, int reviews, int sellingPrice, int mrp){
    int discount = ((mrp-sellingPrice)/mrp*100).round();
    RegExp expression = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String fSellPrice = sellingPrice.toString().replaceAllMapped(expression, (Match m) => '${m[1]},');
    String fmrp = mrp.toString().replaceAllMapped(expression, (Match m) => '${m[1]},');

    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: (){print('Product Tapped');},
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
                child: Image.asset(productImage, height: 150,),
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
                    SizedBox(height: 15,),
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

                    SizedBox(height: 5,),

                    Row(
                      children: List<int>.generate(6, (i) => i + 1).map((i) {
                        if (i<=filledStars){
                          return Icon(Icons.star, color: Colors.red,);
                        }
                        else if(i<=5){
                          return Icon(Icons.star_border, color: Colors.red,);
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
                        SizedBox(width: 15,),
                        Text(
                          'Rs $fmrp',
                          style: TextStyle(
                            color: Color.fromRGBO(50 , 50, 50, 0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5,),

                    Text(
                      '$discount % off',
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    SizedBox(height: 7,),

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
                          splashColor: Color.fromRGBO(0, 0, 0,
                              0.10196078431372549),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          onTap: (){print('add to cart tapped');},
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
    );
  }
}
