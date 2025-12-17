import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmenegerapp_getx/presentration/screen/onBoarding/loginScreen.dart';
import 'package:taskmenegerapp_getx/presentration/screen/onBoarding/registrationScreen.dart';
import 'package:taskmenegerapp_getx/presentration/screen/onBoarding/splassScreen.dart';
import 'package:taskmenegerapp_getx/presentration/screen/task/HomeScreen.dart';
import 'package:taskmenegerapp_getx/presentration/screen/task/taskCreateScreen.dart';

import 'core/utils_style/utils.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  String? data=await ReadUserData("token");
  String FirstPage="/";
  if(data!=null){
    FirstPage="/Homescreen";
  }
  runApp(MyApp(FirstPage:FirstPage));
}

class MyApp extends StatelessWidget {
  final String FirstPage;
  MyApp({required this.FirstPage});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      initialRoute:FirstPage,
      getPages: [
        GetPage(name: '/', page: () => splashScreen()),
        GetPage(name: '/registrationScreen', page: () => registrationScreen()),
        GetPage(name: '/LoginScreen', page: () => LoginScreen()),
        GetPage(name: '/Homescreen', page: () => Homescreen()),
        GetPage(name: '/CreateTaskScreen', page: () => CreateTaskScreen()),
      ],
    );
  }
}
