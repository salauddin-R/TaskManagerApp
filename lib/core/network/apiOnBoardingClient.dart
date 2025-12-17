import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils_style/style.dart';
import '../utils_style/utils.dart';

var BaseURL="https://task.teamrabbil.com/api/v1";
var requestHeader={"content-type":"application/json"};

Future<bool> loginRequest(formValue)async{
  var Url=Uri.parse("${BaseURL}/login");
  var requestbody=json.encode(formValue);
  var response=await http.post(Url,headers: requestHeader,body:requestbody);
  var responseBody=json.decode(response.body);
  if(response.statusCode==200 && responseBody["status"]=="success"){
    SuccessToast("Login Request Successful");
    await  WriteUserData(responseBody);
    return true;
  }
  else{
    ErrorToast("Login Request Failed");
    return false;
  }
}

Future<bool> registrationRequest(formValue)async{
  var Url=Uri.parse("${BaseURL}/registration");
  var requestbody=json.encode(formValue);
  var response=await http.post(Url,headers: requestHeader,body: requestbody);
  var responseBody=json.decode(response.body);
  if(response.statusCode==200 && responseBody["status"]=="success"){
    SuccessToast("Registration Request Successful");
    return true;
  }
  else{
    ErrorToast("Registration Request Failed");
    return false;
  }
}


