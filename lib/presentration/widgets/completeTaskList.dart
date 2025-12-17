import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/taskDetailsGetx/completeTaskGetx.dart';
import '../screen/task/taskList.dart';

class Completetasklist extends StatelessWidget {
   Completetasklist({super.key});
   final completerTaskGetx ctg=Get.put(completerTaskGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Obx(()=>ctg.loading.value?Center(child: CircularProgressIndicator(),):
        RefreshIndicator(child:ctg.taskList.isEmpty?Center(child: Text("There is no data"),)
            :appListView(ctg.taskList,context,ctg.callData),
            onRefresh:()=>ctg.callData()))
    );
  }
}

