import 'package:flutter/material.dart';
import '../../../core/utils_style/style.dart';

BottomNavigationBar AppBottomNav(currentIndex,selectNavigation){
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon:Icon(Icons.list_alt),label:"New"),
      BottomNavigationBarItem(icon:Icon(Icons.access_time_rounded),label:"Progress"),
      BottomNavigationBarItem(icon:Icon(Icons.check_circle_outline),label:"Completed"),
      BottomNavigationBarItem(icon:Icon(Icons.cancel_outlined),label:"Canceled"),
    ],
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    currentIndex:currentIndex,
    onTap: selectNavigation,
  );
}