import 'package:get/get.dart';
import '../../../core/network/apiOnBoardingClient.dart';
import '../../../core/utils_style/style.dart';

class registrationGetx extends GetxController{
  RxMap<String,String> fromValue={"email":"","firstName":"","lastName":"","mobile":"","password":"","photo":"","conformPassword":"",}.obs;
  RxBool loading=false.obs;
  void importValue(Key,textValue){
      fromValue.update(Key,(value)=>textValue);
  }

  void callData()async{
    if(fromValue["email"]!.length==0){
      ErrorToast("Enter Your Mail");
    }
    else if(fromValue["firstName"]!.length==0){
      ErrorToast("Enter Your First Name");
    }
    else if(fromValue["lastName"]!.length==0){
      ErrorToast("Enter Your Last Name");
    }
    else if(fromValue["mobile"]!.length!=11){
      ErrorToast("Enter Your Mobile Number");
    }
    else if(fromValue["password"]!.length==0){
      ErrorToast("Enter Your Password");
    }
    else if(fromValue["photo"]!.length==0){
      ErrorToast("Enter Your Photo");
    }
    else if(fromValue["password"]!=fromValue["conformPassword"]){
      ErrorToast("Password and conform Password should be same");
    }
    else{
        loading.value=true;
      bool response=await registrationRequest(fromValue);
      if(response==true){
        Get.offAllNamed("/LoginScreen");
      }
          loading.value=false;
    }
  }
}