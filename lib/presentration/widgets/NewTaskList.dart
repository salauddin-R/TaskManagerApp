import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/taskDetailsGetx/newTaskGetx.dart';
import '../screen/task/taskList.dart';

class Newtasklist extends StatelessWidget {
   Newtasklist({super.key});
   final newTaskGetx ntg=Get.put(newTaskGetx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Obx(()=>ntg.loading.value?Center(child: CircularProgressIndicator(),):
        RefreshIndicator(child:ntg.taskList.isEmpty?Center(child: Text("There is no data"),):appListView(ntg.taskList,context,ntg.callData),
            onRefresh:()async=>await ntg.callData()))
    );
  }
}
