import 'dart:async';
import 'package:get/get.dart';

class splassScreenGetx extends GetxController{
  @override
  void onInit() {
    Timer(Duration(seconds: 2),(){
      Get.offAllNamed('/LoginScreen');
    });
    super.onInit();
  }
}