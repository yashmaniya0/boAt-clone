import 'dart:io';

import 'package:flutter/material.dart';
import 'package:boat/home_contents.dart';
import 'package:boat/shop_contents.dart';
import 'package:boat/cart_contents.dart';
import 'package:boat/profile_contents.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // for the Search bar
  bool isLogo = true;
  Widget searchIcon = const Icon(Icons.search, size: 30);
  Widget midAppbar = Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset(
        'assets/logo.png',
        fit: BoxFit.contain,
        height: 40,
      ),
    ],
  );

  // for drawer
  final drawerItems = List<int>.generate(10, (i) => i + 1);


  // for cart contents
  List cartProducts = [];
  Map allProducts = {
    "airdopes": [
      {
        "productImage": 'assets/products/airdopes/airdopes131.jpg',
        "productName": 'boAt Airdopes 131',
        "filledStars": 5,
        "reviews": 145482,
        "sellingPrice": 1199,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/airdopes/airdopes141.jpg',
        "productName": 'boAt Airdopes 141',
        "filledStars": 5,
        "reviews": 329742,
        "sellingPrice": 1499,
        "mrp": 4490
      },
      {
        "productImage": 'assets/products/airdopes/airdopes381.jpg',
        "productName": 'boAt Airdopes 381',
        "filledStars": 5,
        "reviews": 426574,
        "sellingPrice": 2099,
        "mrp": 4990
      },
      {
        "productImage": 'assets/products/airdopes/airdopes421.jpg',
        "productName": 'boAt Airdopes 421',
        "filledStars": 4,
        "reviews": 114264,
        "sellingPrice": 2499,
        "mrp": 5990
      },
      {
        "productImage": 'assets/products/airdopes/airdopes441.jpg',
        "productName": 'boAt Airdopes 441',
        "filledStars": 4,
        "reviews": 154526,
        "sellingPrice": 2499,
        "mrp": 5999
      },
      {
        "productImage": 'assets/products/airdopes/airdopes441pro.jpg',
        "productName": 'boAt Airdopes 441 Pro',
        "filledStars": 4,
        "reviews": 248156,
        "sellingPrice": 2599,
        "mrp": 5999
      },
      {
        "productImage": 'assets/products/airdopes/airdopes451.jpg',
        "productName": 'boAt Airdopes 451',
        "filledStars": 5,
        "reviews": 146529,
        "sellingPrice": 1999,
        "mrp": 5999
      },
      {
        "productImage": 'assets/products/airdopes/airdopes641.jpg',
        "productName": 'boAt Airdopes 641',
        "filledStars": 4,
        "reviews": 86214,
        "sellingPrice": 2999,
        "mrp": 6990
      },
      {
        "productImage":
            'assets/products/airdopes/airdopes131captainamerica.jpg',
        "productName": 'boAt Airdopes 131 [Captain America Edition]',
        "filledStars": 5,
        "reviews": 56842,
        "sellingPrice": 1599,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/airdopes/airdopes131ironman.jpg',
        "productName": 'boAt Airdopes 131 [IronMan Edition]',
        "filledStars": 3,
        "reviews": 94452,
        "sellingPrice": 1599,
        "mrp": 2990
      }
    ],
    "headphones": [
      {
        "productImage": 'assets/products/headphones/rockerz550.jpg',
        "productName": 'boAt Rockerz 550',
        "filledStars": 5,
        "reviews": 329742,
        "sellingPrice": 1799,
        "mrp": 4999
      },
      {
        "productImage": 'assets/products/headphones/rockerz370.png',
        "productName": 'boAt Rockerz 370',
        "filledStars": 4,
        "reviews": 56842,
        "sellingPrice": 999,
        "mrp": 2490
      },
      {
        "productImage": 'assets/products/headphones/rockerz400.png',
        "productName": 'boAt Rockerz 400',
        "filledStars": 5,
        "reviews": 248156,
        "sellingPrice": 1299,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/headphones/rockerz425.jpg',
        "productName": 'boAt Rockerz 425',
        "filledStars": 4,
        "reviews": 114264,
        "sellingPrice": 1299,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/headphones/rockerz450.jpg',
        "productName": 'boAt Rockerz 450',
        "filledStars": 4,
        "reviews": 426574,
        "sellingPrice": 1399,
        "mrp": 3990
      },
      {
        "productImage": 'assets/products/headphones/rockerz510.jpg',
        "productName": 'boAt Rockerz 510',
        "filledStars": 5,
        "reviews": 345116,
        "sellingPrice": 1399,
        "mrp": 3490
      },
      {
        "productImage": 'assets/products/headphones/rockerz650.png',
        "productName": 'boAt Rockerz 650',
        "filledStars": 5,
        "reviews": 146529,
        "sellingPrice": 1699,
        "mrp": 3990
      },
      {
        "productImage": 'assets/products/headphones/nirvana1007anc.png',
        "productName": 'boAt Nirvana 1007ANC',
        "filledStars": 5,
        "reviews": 16214,
        "sellingPrice": 9999,
        "mrp": 19999
      },
      {
        "productImage": 'assets/products/headphones/immortal1300.png',
        "productName": 'boAt Immortal 1300',
        "filledStars": 4,
        "reviews": 26842,
        "sellingPrice": 2899,
        "mrp": 9990
      },
      {
        "productImage": 'assets/products/headphones/immortal200.png',
        "productName": 'boAt Immortal 200',
        "filledStars": 4,
        "reviews": 28456,
        "sellingPrice": 1499,
        "mrp": 4990
      },
      {
        "productImage": 'assets/products/headphones/immortal700.png',
        "productName": 'boAt Immortal 700',
        "filledStars": 5,
        "reviews": 12489,
        "sellingPrice": 2399,
        "mrp": 6990
      }
    ],
    "neckbands": [
      {
        "productImage": 'assets/products/neckbands/rockerz255.jpg',
        "productName": 'boAt Rockerz 255',
        "filledStars": 5,
        "reviews": 145482,
        "sellingPrice": 999,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/neckbands/rockerz255f.jpg',
        "productName": 'boAt Rockerz 255 F',
        "filledStars": 5,
        "reviews": 329742,
        "sellingPrice": 949,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/neckbands/rockerz333red.jpg',
        "productName": 'boAt Rockerz 255 Pro',
        "filledStars": 5,
        "reviews": 426574,
        "sellingPrice": 1399,
        "mrp": 3490
      },
      {
        "productImage": 'assets/products/neckbands/rockerz255neo.jpg',
        "productName": 'boAt Rockerz 255 Neo',
        "filledStars": 4,
        "reviews": 114264,
        "sellingPrice": 1299,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/neckbands/rockerz260.jpg',
        "productName": 'boAt Rockerz 260',
        "filledStars": 4,
        "reviews": 154526,
        "sellingPrice": 799,
        "mrp": 2499
      },
      {
        "productImage": 'assets/products/neckbands/rockerz261.jpg',
        "productName": 'boAt Rockerz 261',
        "filledStars": 4,
        "reviews": 248156,
        "sellingPrice": 1199,
        "mrp": 4990
      },
      {
        "productImage": 'assets/products/neckbands/rockerz333.jpg',
        "productName": 'boAt Rockerz 333',
        "filledStars": 5,
        "reviews": 146529,
        "sellingPrice": 1499,
        "mrp": 3990
      },
      {
        "productImage": 'assets/products/neckbands/rockerz333pro.jpg',
        "productName": 'boAt Rockerz 333 Pro',
        "filledStars": 4,
        "reviews": 86214,
        "sellingPrice": 1699,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/neckbands/rockerz375.jpg',
        "productName": 'boAt Rockerz 375',
        "filledStars": 4,
        "reviews": 56842,
        "sellingPrice": 1499,
        "mrp": 3999
      },
      {
        "productImage": 'assets/products/neckbands/trebel235.jpg',
        "productName": 'boAt TRebel 235',
        "filledStars": 4,
        "reviews": 94452,
        "sellingPrice": 1199,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/neckbands/trebel255pro.jpg',
        "productName": 'boAt TRebel 255 Pro',
        "filledStars": 5,
        "reviews": 78456,
        "sellingPrice": 1399,
        "mrp": 3499
      },
      {
        "productImage": 'assets/products/neckbands/boat100.jpg',
        "productName": 'boAt 100 Wireless',
        "filledStars": 3,
        "reviews": 12489,
        "sellingPrice": 1499,
        "mrp": 2999
      }
    ],
    "wired": [
      {
        "productImage": 'assets/products/wired/bassheads100.png',
        "productName": 'boAt BassHeads 100',
        "filledStars": 3,
        "reviews": 145482,
        "sellingPrice": 399,
        "mrp": 999
      },
      {
        "productImage": 'assets/products/wired/bassheads103.png',
        "productName": 'boAt BassHeads 103',
        "filledStars": 4,
        "reviews": 329742,
        "sellingPrice": 499,
        "mrp": 1290
      },
      {
        "productImage": 'assets/products/wired/bassheads162.png',
        "productName": 'boAt BassHeads 162',
        "filledStars": 4,
        "reviews": 426574,
        "sellingPrice": 449,
        "mrp": 1290
      },
      {
        "productImage": 'assets/products/wired/bassheads225.png',
        "productName": 'boAt BassHeads 225',
        "filledStars": 5,
        "reviews": 114264,
        "sellingPrice": 699,
        "mrp": 999
      },
      {
        "productImage": 'assets/products/wired/bassheads242.png',
        "productName": 'boAt BassHeads 242',
        "filledStars": 4,
        "reviews": 154526,
        "sellingPrice": 599,
        "mrp": 1490
      },
      {
        "productImage": 'assets/products/wired/bassheads242blue.png',
        "productName": 'TRebel BassHeads 242',
        "filledStars": 5,
        "reviews": 248156,
        "sellingPrice": 599,
        "mrp": 1490
      },
      {
        "productImage": 'assets/products/wired/bassheads242lime.png',
        "productName": 'TRebel BassHeads 242',
        "filledStars": 5,
        "reviews": 248156,
        "sellingPrice": 599,
        "mrp": 1490
      },
      {
        "productImage": 'assets/products/wired/trebel103.png',
        "productName": 'boAt TRebel 641',
        "filledStars": 4,
        "reviews": 86214,
        "sellingPrice": 499,
        "mrp": 1290
      }
    ],
    "speakers": [
      {
        "productImage": 'assets/products/speakers/stone500.png',
        "productName": 'boAt Stone 131',
        "filledStars": 4,
        "reviews": 45482,
        "sellingPrice": 1999,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/speakers/rugby.png',
        "productName": 'boAt Rugby',
        "filledStars": 4,
        "reviews": 29742,
        "sellingPrice": 1499,
        "mrp": 3990
      },
      {
        "productImage": 'assets/products/speakers/stone1450.png',
        "productName": 'boAt Stone 1450',
        "filledStars": 5,
        "reviews": 26574,
        "sellingPrice": 3999,
        "mrp": 8990
      },
      {
        "productImage": 'assets/products/speakers/stone1200f.png',
        "productName": 'boAt Stone 1200 F',
        "filledStars": 4,
        "reviews": 14264,
        "sellingPrice": 3899,
        "mrp": 6990
      },
      {
        "productImage": 'assets/products/speakers/stone180.png',
        "productName": 'boAt Stone 180',
        "filledStars": 4,
        "reviews": 54526,
        "sellingPrice": 1299,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/speakers/stone200.png',
        "productName": 'boAt Stone 200',
        "filledStars": 5,
        "reviews": 48156,
        "sellingPrice": 1299,
        "mrp": 2990
      },
      {
        "productImage": 'assets/products/speakers/partypal60.png',
        "productName": 'boAt Party Pal 60',
        "filledStars": 5,
        "reviews": 6214,
        "sellingPrice": 4499,
        "mrp": 9990
      },
      {
        "productImage": 'assets/products/speakers/partypal50.png',
        "productName": 'boAt Party Pal 50',
        "filledStars": 5,
        "reviews": 8456,
        "sellingPrice": 3799,
        "mrp": 7990
      },
      {
        "productImage": 'assets/products/speakers/blitz2000.png',
        "productName": 'boAt Blitz 2000',
        "filledStars": 5,
        "reviews": 4452,
        "sellingPrice": 4999,
        "mrp": 8990
      }
    ],
    "smartwatches": [
      {
        "productImage": 'assets/products/smartwatches/storm.png',
        "productName": 'boAt Storm',
        "filledStars": 4,
        "reviews": 45482,
        "sellingPrice": 2699,
        "mrp": 5990
      },
      {
        "productImage": 'assets/products/smartwatches/watchblaze.png',
        "productName": 'boAt Watch Blaze',
        "filledStars": 4,
        "reviews": 29742,
        "sellingPrice": 3499,
        "mrp": 6990
      },
      {
        "productImage": 'assets/products/smartwatches/watchflash.png',
        "productName": 'boAt Watch Flash',
        "filledStars": 5,
        "reviews": 26574,
        "sellingPrice": 2499,
        "mrp": 6990
      },
      {
        "productImage": 'assets/products/smartwatches/watchiris.png',
        "productName": 'boAt Watch Iris',
        "filledStars": 4,
        "reviews": 14264,
        "sellingPrice": 4399,
        "mrp": 11990
      },
      {
        "productImage": 'assets/products/smartwatches/watchmystiq.png',
        "productName": 'boAt Watch Mystiq',
        "filledStars": 4,
        "reviews": 24526,
        "sellingPrice": 3199,
        "mrp": 6990
      },
      {
        "productImage": 'assets/products/smartwatches/watchvertex.png',
        "productName": 'boAt Watch Vertex',
        "filledStars": 3,
        "reviews": 18156,
        "sellingPrice": 2299,
        "mrp": 6990
      },
      {
        "productImage": 'assets/products/smartwatches/watchwavepro.png',
        "productName": 'boAt Watch Wave Pro',
        "filledStars": 5,
        "reviews": 6214,
        "sellingPrice": 3299,
        "mrp": 6990
      },
      {
        "productImage": 'assets/products/smartwatches/watchxtend.png',
        "productName": 'boAt Watch Xtend',
        "filledStars": 5,
        "reviews": 8456,
        "sellingPrice": 2999,
        "mrp": 7990
      },
      {
        "productImage": 'assets/products/smartwatches/watchzenit.png',
        "productName": 'boAt Watch Zenit',
        "filledStars": 4,
        "reviews": 15456,
        "sellingPrice": 1999,
        "mrp": 6990
      }
    ],
  };

  // for navbar
  int navIndex = 0;
  List allContents = [
    HomeContents(),
    ShopContents(products: {}),
    CartContents(),
    ProfileContents()
  ];
  Widget currentBody(ix){
    if (ix==1){
      return ShopContents(products: allProducts);
    }
    return allContents[ix];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: midAppbar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (isLogo) {
                  isLogo = false;
                  searchIcon = const Icon(Icons.close, size: 30);
                  midAppbar = Container(
                    width: 400,
                    height: 40,
                    // color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),

                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 10, left: 10),
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  isLogo = true;
                  searchIcon = const Icon(
                    Icons.search,
                    size: 30,
                  );
                  midAppbar = Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.contain,
                        height: 40,
                      ),
                    ],
                  );
                }
              });
            },
            icon: searchIcon,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      drawer: Drawer(
          backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
          child: ListView(
            children: drawerItems.map((val) => Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(100, 100, 100, 0.2),
                      ),
                      child: ListTile(
                        title: Text(
                          'Content $val',
                          style: const TextStyle(
                            color: Color.fromRGBO(200, 200, 200, 1),
                            fontSize: 20,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(left: 40),
                      ),
                    ))
                .toList(),
          )),

      backgroundColor: const Color.fromRGBO(50, 50, 50, 0.3),
      body: currentBody(navIndex),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(255, 0, 0, 1),
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
        onTap: (int index) {
          setState(() {
            navIndex = index;
          });
        },
        currentIndex: navIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  List<Widget> categoryBox(List categories, List images) {
    List<Widget> allBoxes = [];
    double pad = 15;

    for (int i = 0; i < categories.length; i++) {
      if (i == categories.length - 1) {
        pad = 0;
      }
      allBoxes.add(Container(
        height: 120,
        width: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        margin: EdgeInsets.only(right: pad),
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: AssetImage(images[i]),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                categories[i],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ));
    }

    return allBoxes;
  }
}
