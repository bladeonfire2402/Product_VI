import 'package:banhat/controller/bottom_nav_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  final BottomNavController c = Get.put(BottomNavController());

  BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.blue,
      backgroundColor: Colors.white,
      items: <Widget>[
        Icon(Icons.poll_rounded, color: Colors.white),
        Icon(Icons.upload, color: Colors.white,),
        Icon(Icons.cabin_rounded, color: Colors.white),
      ],
      onTap: (index) {
        c.swap(index);
      },
    );
  }
}
