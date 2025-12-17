import 'package:get/get.dart';
import '../../../core/network/apiTaskClient.dart';

class newTaskGetx extends GetxController{
  RxList taskList=[].obs;
  RxBool loading=true.obs;

  @override
  @override
  void onReady() {
    super.onReady();
    callData();
  }

  callData()async{
    List data= await TaskListRequest("New");
      taskList.value=data;
    loading.value=false;
  }
}