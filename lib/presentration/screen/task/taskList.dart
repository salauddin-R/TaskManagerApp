import 'package:flutter/material.dart';
import '../../../core/network/apiTaskClient.dart';
import '../../../core/utils_style/style.dart';
import'package:get/get.dart';

import '../../getx/taskDetailsGetx/cancelTaskGetx.dart';
import '../../getx/taskDetailsGetx/completeTaskGetx.dart';
import '../../getx/taskDetailsGetx/newTaskGetx.dart';
import '../../getx/taskDetailsGetx/progressTaskGetx.dart';

Container statusContainer(String status,color){
  return Container(
    height: 36,
    width: 80,
    child: Center(child: Text("$status",style:Head7Text(colorWhite) ,)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color
    ),
  );
}

Future alertdialog(BuildContext context,id,Function onRefresh){
  return showDialog(
      context:context,
      builder: (context)=>AlertDialog(
        title: Text("Delete!"),
        content:Text("Once delete,never get it back"),
        actions: [
          ElevatedButton(onPressed:()async{
            bool data=await DeleteTaskRequest(id);
            Navigator.pop(context);
            if(data==true){
              onRefresh();
            }
            else{
              ErrorToast("Delete request Failed!");
            }
          }, child:Text("Conform")),
          ElevatedButton(onPressed:(){
            Navigator.pop(context);
          }, child:Text("Cancel")),
        ],
      )

  );
}

statusChange(id,BuildContext context,state,Function onResresh)async{
  showModalBottomSheet(context: context,
      builder:(context){
        return StatefulBuilder(builder:(BuildContext context,StateSetter setState){
          return Container(
            height: 300,
            width: double.infinity,
            child: Column(
              children: [
                RadioListTile(value:"New",title: Text("New"),groupValue: state,
                  onChanged: (value){
                    setState(() {
                      state = value.toString();
                    });
                  },
                ),
                RadioListTile(value:"Progress",title: Text("Progress"),groupValue: state,
                  onChanged: (value){
                    setState(() {
                      state = value.toString();
                    });
                  },
                ),
                RadioListTile(value:"Completed",title: Text("Completed"),groupValue: state,
                  onChanged: (value){
                    setState(() {
                      state = value.toString();
                    });
                  },
                ),
                RadioListTile(value:"Canceled",title: Text("Canceled"),groupValue: state,
                  onChanged: (value){
                    setState(() {
                      state = value.toString();
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      await ChangeStatusRequest(id, state);
                      if (Get.isRegistered<newTaskGetx>()) {
                        Get.find<newTaskGetx>().callData();
                      }
                      if (Get.isRegistered<ProgressTaskGetx>()) {
                        Get.find<ProgressTaskGetx>().callData();
                      }
                      if (Get.isRegistered<completerTaskGetx>()) {
                        Get.find<completerTaskGetx>().callData();
                      }
                      if (Get.isRegistered<CancelTaskGetx>()) {
                        Get.find<CancelTaskGetx>().callData();
                      }

                      Navigator.pop(context);
                    },
                    style: AppButtonStyle(colorGreen),
                    child: Text("Confirm"),
                  ),
                )
              ],

            ),
          );
        });
      }
  );
}

ListView appListView(taskList,BuildContext context,Function onRefresh){
  return ListView.builder(
    itemCount: taskList.length,
    itemBuilder:(context,index){
      Color statusColor=colorGreen;
      String state="Completed";
      if(taskList[index]["status"]=="New"){
        statusColor=colorBlue;
        state="New";
      }
      else if(taskList[index]["status"]=="Progress"){
        statusColor=colorOrange;
        state="Progress";
      }
      else if(taskList[index]["status"]=="Canceled"){
        statusColor=colorRed;
        state="Canceled";
      }
      return Card(
          margin: EdgeInsets.only(bottom: 5),
          child: Padding(
            padding: const EdgeInsets.only(right: 10,top: 3,bottom: 3,left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${taskList[index]["title"]}",style:Head6Text(colorBlack),),
                Text("${taskList[index]["description"]}",style:Head7Text(colorLightGray)),
                SizedBox(height: 5,),
                Text("Data: ${taskList[index]["createdDate"]}",style:Head7Text(colorLightGray)),
                SizedBox(height: 5,),
                Row(
                  children: [
                    statusContainer(taskList[index]["status"],statusColor),
                    SizedBox(width:145,),
                    ElevatedButton(onPressed:(){
                      statusChange(taskList[index]["_id"],context,state,onRefresh);
                    },
                        style:ElevatedButton.styleFrom(backgroundColor:colorBlue), child:Icon(Icons.edit_location_alt_outlined,color: colorWhite,)),
                    SizedBox(width:15,),
                    ElevatedButton(onPressed:(){
                      alertdialog(context,taskList[index]["_id"],onRefresh);
                    },
                        style:ElevatedButton.styleFrom(backgroundColor:colorRed), child:Icon(Icons.delete,color: colorWhite,)),
                  ],
                )
              ],
            ),
          )
      );
    },
  );
}



