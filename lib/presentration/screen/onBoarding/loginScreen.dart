import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils_style/style.dart';
import '../../getx/onBoardingGetx/loginGetx.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final onBoardingGetx bgetx= Get.put(onBoardingGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.grey,
        body:Stack(
          children: [
            ScreenBackground(context),
            Obx(()=>Center(
              child:bgetx.loading.value?CircularProgressIndicator():Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Get Started With",style: Head1Text(colorDarkBlue),),
                    SizedBox(height: 1,),
                    Text("Salauddin's App",style: Head6Text(colorLightGray),),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged:(value){
                        bgetx.importValue("email",value);
                      },
                      decoration: AppInputDecoration("Email Address"),),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged:(value){
                        bgetx.importValue("password",value);
                      },
                      decoration: AppInputDecoration("Password"),),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed:(){
                      bgetx.callData();
                    },
                      style:AppButtonStyle(colorGreen),
                      child:Text("Login",style: ButtonTextStyle(),),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                       onTap: ()=>Navigator.pushNamed(context,"/EmailVerificationScreen"),
                      child: Text("Forget Password?",style: Head7Text(colorLightGray),),
                    ),
                    SizedBox(height:10,),
                    InkWell(
                      onTap: ()=>Get.toNamed("/registrationScreen"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have a account. ",style: Head7Text(Colors.black),),
                          Text("Sign Up",style: Head7Text(colorGreen),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),)
          ],
        )
    );
  }
}
