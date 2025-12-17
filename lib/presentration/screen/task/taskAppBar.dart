import 'package:flutter/material.dart';
import '../../../core/utils_style/style.dart';
import '../../../core/utils_style/utils.dart';
import'package:get/get.dart';

void logOutScreen(){
  Get.defaultDialog(
    title:"Log Out",
    content:Text("Do You Want to Log Out?"),
    textCancel: "Cancel",
    textConfirm: "Conform",
    onCancel: (){
      Get.back(closeOverlays: false);
    },
    onConfirm: ()async{
      bool data=await logOutData();
      if(data==true){
        Get.offAllNamed("/LoginScreen");
      }
      else{
        ErrorToast("Log Out Failed!");
      }
    }
  );
}

AppBar taskAppBar(BuildContext context,profileData){
  return AppBar(
    backgroundColor: colorGreen,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      margin: EdgeInsets.only(top: 20,left: 10,right: 40),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            child: ClipOval(
              child: Image.network((profileData["photo"] != null && profileData["photo"].toString().isNotEmpty)
                  ? profileData["photo"]
                  : "https://thepicturesdp.in/wp-content/uploads/2025/07/profile-picture-for-girls-casual-dress.jpg",
                fit: BoxFit.cover,width: 56,height: 56,),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${profileData["firstName"]} ${profileData["lastName"]}",style: Head6Text(colorDark),),
              Text("${profileData["email"]}",style: Head7Text(colorWhite),)
            ],
          )
        ],
      ),
    ),
    actions: [
      IconButton(onPressed:(){
        Get.toNamed("/CreateTaskScreen");
      }, icon:Icon(Icons.add_circle_outline,color: colorWhite,)),
      IconButton(onPressed:()async{
        logOutScreen();
      }, icon:Icon(Icons.output,color: colorRed,)),
    ],
  );
}