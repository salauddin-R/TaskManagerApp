import 'package:shared_preferences/shared_preferences.dart';

Future<void> WriteUserData(userData)async{
  final SharedPreferences pref=await SharedPreferences.getInstance();
  await pref.setString("token",userData["token"]);
  await pref.setString("email",userData["data"]["email"]);
  await pref.setString("firstName",userData["data"]["firstName"]);
  await pref.setString("lastName",userData["data"]["lastName"]);
  await pref.setString("mobile",userData["data"]["mobile"]);
  await pref.setString("photo",userData["data"]["photo"]);
}

Future<bool> logOutData()async{
  final SharedPreferences pref=await SharedPreferences.getInstance();
  //await pref.remove("token");
  await pref.clear();
  return true;
}

Future<void> WriteEmailVerification(userData)async{
  final SharedPreferences pref=await SharedPreferences.getInstance();
  await pref.setString("emailVerification",userData);
}

Future<void> WritePinVerification(userData)async{
  final SharedPreferences pref=await SharedPreferences.getInstance();
  await pref.setString("pinVerification",userData);
}

Future<String?>ReadUserData(data)async{
  final SharedPreferences pref=await SharedPreferences.getInstance();
  String? mydata =await pref.getString(data);
  return mydata;
}