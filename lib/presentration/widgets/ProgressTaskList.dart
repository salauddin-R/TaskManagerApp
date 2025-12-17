import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/taskDetailsGetx/progressTaskGetx.dart';
import '../screen/task/taskList.dart';

class Progresstasklist extends StatelessWidget {
   Progresstasklist({super.key});
   final ProgressTaskGetx ptg = Get.put(ProgressTaskGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Obx(()=>ptg.loading.value?Center(child: CircularProgressIndicator(),):
        RefreshIndicator(child:ptg.taskList.isEmpty?Center(child: Text("There is no data"),)
            :appListView(ptg.taskList,context,ptg.callData),
            onRefresh:()async=> await ptg.callData()))
    );
  }
}
