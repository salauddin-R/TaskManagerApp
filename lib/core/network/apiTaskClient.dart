import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils_style/style.dart';
import '../utils_style/utils.dart';

var BaseURL="https://task.teamrabbil.com/api/v1";
var requestHeader={"content-type":"application/json"};

Future<List> TaskListRequest(status)async{
  var Url=Uri.parse("${BaseURL}/listTaskByStatus/${status}");
  String? token=await ReadUserData("token");
  var TokenrequestHeader={"content-type":"application/json","token":"${token}"};
  var response=await http.get(Url,headers: TokenrequestHeader);
  var responseBody=json.decode(response.body);
  if(response.statusCode==200 && responseBody["status"]=="success"){
    SuccessToast("Task Request Successful");
    return responseBody["data"];
  }
  else{
    ErrorToast("Task Request Failed");
    return [];
  }
}

Future<bool> CreateTaskRequest(data)async{
  var Url=Uri.parse("${BaseURL}/createTask");
  var requestBody=json.encode(data);
  String? token=await ReadUserData("token");
  var TokenrequestHeader={"content-type":"application/json","token":"${token}"};
  var response=await http.post(Url,headers:TokenrequestHeader,body: requestBody);
  var responseBody=json.decode(response.body);
  if(response.statusCode==200 && responseBody["status"]=="success"){
    SuccessToast("Task Request Successful");
    return true;
  }
  else{
    ErrorToast("Task Request Failed");
    return false;
  }
}

Future<bool> DeleteTaskRequest(id)async{
  var Url=Uri.parse("${BaseURL}/deleteTask/${id}");
  String? token=await ReadUserData("token");
  var TokenrequestHeader={"content-type":"application/json","token":"${token}"};
  var response=await http.get(Url,headers: TokenrequestHeader);
  var responseBody=json.decode(response.body);
  if(response.statusCode==200 && responseBody["status"]=="success"){
    SuccessToast("Task Request Successful");
    return true;
  }
  else{
    ErrorToast("Task Request Failed");
    return false;
  }
}

Future<bool> ChangeStatusRequest(id,state)async{
  var Url=Uri.parse("${BaseURL}/updateTaskStatus/${id}/${state}");
  String? token=await ReadUserData("token");
  var TokenrequestHeader={"content-type":"application/json","token":"${token}"};
  var response=await http.get(Url,headers: TokenrequestHeader);
  var responseBody=json.decode(response.body);
  if(response.statusCode==200 && responseBody["status"]=="success"){
    SuccessToast("Task Request Successful");
    return true;
  }
  else{
    ErrorToast("Task Request Failed");
    return false;
  }
}