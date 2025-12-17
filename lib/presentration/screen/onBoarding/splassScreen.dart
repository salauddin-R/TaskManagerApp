import 'package:flutter/material.dart';
import '../../../core/utils_style/style.dart';
import '../../getx/onBoardingGetx/splassScreenGetx.dart';
import 'package:get/get.dart';

class splashScreen extends StatelessWidget {
  splashScreen({super.key});
  final splassScreenGetx sg=Get.put(splassScreenGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset("assets/images/logoS.png",width: 300,height: 270,fit: BoxFit.fill,),
            SizedBox(height:Get.height*0.28,),
            CircularProgressIndicator(color: colorLightGray,),
            SizedBox(height:Get.height*0.09,),
          ],
        ),
      ),
    );
  }
}

