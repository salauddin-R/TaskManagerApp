import 'package:get/get.dart';

import '../../../core/network/apiTaskClient.dart';

class completerTaskGetx extends GetxController{
  RxList taskList=[].obs;
  RxBool loading=true.obs;

  @override
  @override
  void onReady() {
    super.onReady();
    callData();
  }

  callData()async{
    List data= await TaskListRequest("Completed");

      taskList.value=data;
      loading.value=false;
  }

}