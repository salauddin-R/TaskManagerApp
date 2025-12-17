import 'package:get/get.dart';
import '../../../core/network/apiTaskClient.dart';
import '../../../core/utils_style/style.dart';

class createTaskGetx extends GetxController{
  RxMap<String,String> fromValue={"title":"","description":"","status":"New"}.obs;
  RxBool loading=false.obs;
  void importValue(Key,textValue){
      fromValue.update(Key,(value)=>textValue);
  }

  void callData()async{
    if(fromValue["title"]!.length==0){
      ErrorToast("Required Task Name");
    }
    else if(fromValue["description"]!.length==0){
      ErrorToast("Required Task Description");
    }
    else{
        loading.value=true;
      bool response=await CreateTaskRequest(fromValue);
      if(response==true){
        Get.offAllNamed("/Homescreen");
      }
      else{
          loading.value=false;
      }
    }
  }
}