import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils_style/style.dart';
import '../../getx/onBoardingGetx/registrationGetx.dart';

class registrationScreen extends StatelessWidget {
   registrationScreen({super.key});

   final registrationGetx rg=Get.put(registrationGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.grey,
        body:Stack(
          children: [
            ScreenBackground(context),
            Center(
              child:rg.loading.value?CircularProgressIndicator(): Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Join With Us",style: Head1Text(colorDarkBlue),),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){rg.importValue("email",value);},
                      decoration: AppInputDecoration("Email Address"),),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){rg.importValue("firstName",value);},
                      decoration: AppInputDecoration("First Name"),),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){rg.importValue("lastName",value);},
                      decoration: AppInputDecoration("Last Name"),),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){rg.importValue("mobile",value);},
                      decoration: AppInputDecoration("Mobile"),),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){rg.importValue("photo",value);},
                      decoration: AppInputDecoration("Photo"),),

                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){rg.importValue("password",value);},
                      decoration: AppInputDecoration("Password"),),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (value){rg.importValue("conformPassword",value);},
                      decoration: AppInputDecoration("Conform Password"),),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed:(){
                      rg.callData();
                    },
                      style:AppButtonStyle(colorGreen),
                      child:Text("Registration",style: ButtonTextStyle(),),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
