import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeContents extends StatefulWidget {
  const HomeContents({Key? key}) : super(key: key);

  @override
  State<HomeContents> createState() => _HomeContentsState();
}

class _HomeContentsState extends State<HomeContents> {

  // for advertisement carousel
  final controller = CarouselController();
  int adIndex = 0;
  final allAds = [
    'assets/ad1.jpg',
    'assets/ad2.jpg',
    'assets/ad3.jpg',
    'assets/ad4.jpg',
    'assets/ad5.jpg'
  ];

  // for categories
  final allCategories = [
    'Airdopes',
    'Rockerz',
    'Speakers',
    'Smartwatches',
    'Headphones'
  ];
  final allCategoryImages = [
    'assets/categoryAirdopes.jpg',
    'assets/categoryRockerz.jpg',
    'assets/categorySpeakers.jpg',
    'assets/categorySmartwatches.jpg',
    'assets/categoryHeadphones.jpg'
  ];

  // for boatheads section
  final boatHeadController = CarouselController();
  int boatHeadIndex = 0;
  final allBoatHeads = [
    'assets/boatHead1.jpg',
    'assets/boatHead2.jpg',
    'assets/boatHead3.jpg',
    'assets/boatHead4.jpg'
  ];


  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        CarouselSlider(
            items: allAds.map((img) => Image.asset(img)).toList(),
            carouselController: controller,
            options: CarouselOptions(
              height: 350,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  adIndex = index;
                });
              },
            )
        ),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: adIndex,
            count: allAds.length,
            onDotClicked: (int index) {
              controller.animateToPage(index);
              adIndex = index;
            },
            effect: const WormEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Color.fromRGBO(255, 0, 0, 1),
              dotColor: Color.fromRGBO(230, 230, 230, 1),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categoryBox(
              allCategories,
              allCategoryImages,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: const Text(
                    'This is your playground. Welcome to boAt !',
                    style:TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight:FontWeight.w700,
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, left: 30, bottom: 20),
                height: 5,
                width: 150,
                color: Colors.red,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        CarouselSlider(
            items: allBoatHeads.map((img) => Image.asset(img)).toList(),
            carouselController: boatHeadController,
            options: CarouselOptions(
              height: 440,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  boatHeadIndex = index;
                });
              },
            )
        ),
        SizedBox(height: 10,),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: boatHeadIndex,
            count: allBoatHeads.length,
            onDotClicked: (int index) {
              boatHeadController.animateToPage(index);
            },
            effect: const WormEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Color.fromRGBO(255, 0, 0, 1),
              dotColor: Color.fromRGBO(230, 230, 230, 1),
            ),
          ),
        ),

        SizedBox(height: 10,),
        Container(
          child: Image.asset('assets/brandvertise.jpg'),
        ),

        Container(

        ),

      ],
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
                      image: DecorationImage(
                        image: AssetImage(images[i]),
                        fit: BoxFit.contain,
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
