import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Custombar extends StatelessWidget {
  int index = 0;
  Custombar({index}){
    this.index = index;
  }
  @override
  Widget build(BuildContext context) {
    return GNav(
      tabs: [
        GButton(
          icon: Icons.home,
          text: "Home",
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
          },
        ),
        GButton(
          icon: Icons.chat,
          text: "Chats",
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, '/chat', (route) => false);
          },
        ),
        GButton(
          icon: Icons.person,
          text: "Profile",
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
          },
        ),
      ],
      color: Colors.black,
      backgroundColor: Colors.white,
      tabBackgroundColor: Color(0xff5aa7ff),
      gap: 15,
      activeColor: Colors.white,
      curve: Curves.slowMiddle,
      selectedIndex: this.index,
    );
}}
