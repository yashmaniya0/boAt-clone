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

  // for navbar
  int navIndex = 0;
  List allContents = [HomeContents(), ShopContents(), CartContents(), ProfileContents()];

  // for cart contents
  List cartProducts = [];


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
                    padding: const EdgeInsets.only(left: 20,),
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
            children: drawerItems
                .map((val) => Container(
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

      body: allContents[navIndex],


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(255, 0, 0, 1),
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
        onTap: (int index){
          setState(() {
            navIndex = index;
          });
        },
        currentIndex: navIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset),
            label:'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label:'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:'Profile',
          ),
        ],
      ),
    );
  }

  List<Widget> categoryBox(List categories, List images){
    List<Widget> allBoxes = [];
    double pad = 15;

    for(int i=0; i<categories.length; i++){
      if (i==categories.length-1){
        pad=0;
      }
      allBoxes.add(
          Container(
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
                      )
                  ),
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
          )
      );
    }

    return allBoxes;
  }
}



