import 'package:get/get.dart';
import '../../../core/utils_style/utils.dart';
import '../../widgets/NewTaskList.dart';
import '../../widgets/ProgressTaskList.dart';
import '../../widgets/cancelTaskList.dart';
import '../../widgets/completeTaskList.dart';

class HomeScreenGetx extends GetxController{
  RxMap<String,String> profileData={"email":"","firstName":"","lastName":"","photo":"https://thepicturesdp.in/wp-content/uploads/2025/07/profile-picture-for-girls-casual-dress.jpg"}.obs;
  RxInt NavigationIndex=0.obs;
  void selectNavigation(int index){
      NavigationIndex.value=index;
  }
  List BottomItemList=[
    Newtasklist(),
    Progresstasklist(),
    Completetasklist(),
    Canceltasklist()
  ];
  RestoreUserData()async{
    String? email=await ReadUserData("email")??"";
    String? firstName=await ReadUserData("firstName")??"";
    String? lastName=await ReadUserData("lastName")??"";
    String? photo=await ReadUserData("photo")??"";
      profileData.value={"email":"$email","firstName":"$firstName","lastName":"$lastName","photo":"$photo"};
  }

  @override
  void onInit(){
    RestoreUserData();
    super.onInit();
  }
}