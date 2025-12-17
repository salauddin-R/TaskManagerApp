import 'package:get/get.dart';
import '../../../core/network/apiOnBoardingClient.dart';
import '../../../core/utils_style/style.dart';

class onBoardingGetx extends GetxController{
  RxMap<String,String> fromValue={"email":"","password":""}.obs;
  RxBool loading=false.obs;
  void importValue(Key,textValue){
      fromValue.update(Key,(value)=>textValue);
  }

  void callData()async{
    if(fromValue["email"]!.length==0){
      ErrorToast("Enter Your Mail");
    }
    else if(fromValue["password"]!.length==0){
      ErrorToast("Enter Your Password");
    }
    else{
      loading.value = true;
      bool response=await loginRequest(fromValue);
      if(response==true){
        Get.offAllNamed("/Homescreen");
      }
      loading.value = false;
    }
  }

}