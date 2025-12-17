import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


const colorRed=Color.fromRGBO(231,28,36,1);
const colorDark=Color.fromRGBO(136,28,32,1);
const colorGreen=Color.fromRGBO(33,191,115,1);
const colorBlue=Color.fromRGBO(52,152,219,1.0);
const colorOrange=Color.fromRGBO(230,126,34,1.0);
const colorWhite=Color.fromRGBO(255,255,255,1.0);
const colorDarkBlue=Color.fromRGBO(44,62,80,1.0);
const colorLightGray=Color.fromRGBO(135,142,150,1.0);
const colorLight=Color.fromRGBO(211,211,211,1.0);
const colorBlack=Colors.black;

PinTheme AppOTPStyle(){
  return PinTheme(
      inactiveColor: colorLight,
      inactiveFillColor: colorWhite,
      selectedColor: colorGreen,
      activeColor: colorWhite,
      selectedFillColor: colorGreen,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(5),
      fieldHeight: 50,
      borderWidth: 0.5,
      fieldWidth: 50,
      activeFillColor: colorWhite
  );
}

TextStyle Head1Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 28,
      fontFamily:"poppins",
      fontWeight: FontWeight.w700
  );
}

TextStyle Head6Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily:"poppins",
      fontWeight: FontWeight.w400
  );
}

TextStyle Head7Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 13,
      fontFamily:"poppins",
      fontWeight: FontWeight.w400
  );
}

InputDecoration AppInputDecoration(label){
  return InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorGreen,width: 1),
      ),
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorWhite,width: 0.0),
      ),
      border:OutlineInputBorder(),
      labelText: label
  );
}

DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(decoration:BoxDecoration(
      color: Colors.white,border: Border.all(color: Colors.white,width: 1),
      borderRadius: BorderRadius.circular(4)
  ),
    child: Padding(padding:EdgeInsets.only(left: 30,right: 30),
      child: child,),
  );
}

SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    "assets/images/background.svg",
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit:BoxFit.cover,
  );
}

ButtonStyle AppButtonStyle(color){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      minimumSize: Size(double.infinity,50),
      backgroundColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}

TextStyle ButtonTextStyle(){
  return TextStyle(
      color: colorWhite,
      fontSize: 18,
      fontFamily: "poppins",
      fontWeight: FontWeight.bold
  );
}

// Ink SuccessButtonChild(String ButtonText){
//   return Ink(
//     decoration: BoxDecoration(
//       color: colorGreen,borderRadius: BorderRadius.circular(6)
//     ),
//     child: Text(ButtonText,style:ButtonTextStyle(),),
//   );
// }

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg:msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:colorGreen,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg:msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: Colors.white,
      fontSize: 16.0
  );
}