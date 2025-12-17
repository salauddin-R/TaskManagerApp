import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmenegerapp_getx/presentration/screen/task/taskAppBar.dart';
import '../../getx/taskGetx/homeScreenGetx.dart';
import 'appBottomNav.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final HomeScreenGetx scg=Get.put(HomeScreenGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() => taskAppBar(context, scg.profileData.value)),
      ),
      body: Obx(()=>scg.BottomItemList.elementAt(scg.NavigationIndex.value)),
      bottomNavigationBar:Obx(()=> AppBottomNav(scg.NavigationIndex.value,scg.selectNavigation)),
    );
  }
}

