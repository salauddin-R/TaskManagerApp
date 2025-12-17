import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/taskDetailsGetx/cancelTaskGetx.dart';
import '../screen/task/taskList.dart';

class Canceltasklist extends StatelessWidget {
   Canceltasklist({super.key});
   final CancelTaskGetx ctg=Get.put(CancelTaskGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Obx(()=>ctg.loading.value?Center(child: CircularProgressIndicator(),) :
        RefreshIndicator(child:ctg.taskList.isEmpty?Center(child: Text("There is no data"),)
            :appListView(ctg.taskList,context,ctg.callData),
            onRefresh:()async=>await ctg.callData()))
    );
  }
}
