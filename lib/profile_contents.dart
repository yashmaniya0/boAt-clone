import 'dart:io';
import 'package:flutter/material.dart';

class ProfileContents extends StatefulWidget {
  const ProfileContents({Key? key}) : super(key: key);

  @override
  State<ProfileContents> createState() => _ProfileContentsState();
}

class _ProfileContentsState extends State<ProfileContents> {
  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: 20,),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white70,
            shape: BoxShape.circle,
            //borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 3,
              color: Colors.white54,
            ),
          ),
          child: Image.asset('assets/profile_avatar.png'),
        ),
        const SizedBox(height: 15,),
        const Center(
          child: Text(
            'Yash Maniya',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 5,
          margin: EdgeInsets.only(left: 20, right: 20),
          color: Color.fromRGBO(255, 30, 10, 0.85),
        ),
        SizedBox(height: 10),
        Container(
          height: 400,
          child: ListView(
            children: [
              SizedBox(height: 10,),
              makeProfileContent('Edit Profile', Icons.person),
              makeProfileContent('Shipping Address', Icons.location_on),
              makeProfileContent('Wishlist', Icons.favorite_outlined),
              makeProfileContent('Order History', Icons.history_edu),
              makeProfileContent('Notification', Icons.notifications),
              makeProfileContent('Saved Cards', Icons.credit_card),
              makeProfileContent('Coupons', Icons.percent),
            ],
          ),
        )
      ],
    );
  }

  Widget makeProfileContent(String text, icon){
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(100, 100, 100, 0.25),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        highlightColor: Color.fromRGBO(100, 100, 100, 0.3),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: (){
          print('Tapped');                         // On Tap
          },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Icon(icon, color: Color.fromRGBO(255, 255, 255, 0.9),),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              width: 265,
              child: Text(
                text,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
                child: const Icon(
                  Icons.navigate_next,
                  color: Color.fromRGBO(255, 255, 255, 0.9),
                  size: 25,
                )
            ),
          ],
        ),
      ),
    );
  }

}
