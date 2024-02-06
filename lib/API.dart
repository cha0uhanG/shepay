import 'dart:convert';

import 'package:flutter/material.dart';
import "package:shepays/main.dart";
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import "package:shepays/constant.dart";

dynamic json ;
dynamic jjson ;
List<dynamic> imageurl = [] ;
const String urll ='$baseUrl$endpoint';


Future<dynamic> apii () async{
  http.Response response = await http.get(Uri.parse(urll));
  if(response.statusCode==200){
    dynamic jsonResponse = jsonDecode(response.body);
       //print(jsonResponse);
       for(int i=0 ;i<=3;i++) {
         imageurl.add(jsonResponse["data"][i]["image"]);
       }
    return(imageurl);
  }
  else
  {
   print(response.statusCode);
  }

}

Future<dynamic> sendRegistrationOTP(String no ) async {
  final String otpurl = 'https://dev.shepays.com/api/send-registration-otp';

  String mobileNumber = no;
  var dataa = {
    'mobile': mobileNumber };
  // Map<String, dynamic> requestBody = {
  //   "mobile": mobileNumber,
  // };
  // String encodedBody = jsonEncode(requestBody);
  try {
    // Make the HTTP POST request
    final http.Response responsee = await http.post(
      Uri.parse(otpurl), body: dataa);
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      // body: encodedBody,

    dynamic jjson = jsonDecode(responsee.body);
     print("this is new method of printing of $jjson");
    return(jjson["success"]);
  } catch (error) {
    // Exception handling
    print('Exception during POST request: $error');
  }

}

Future<dynamic> OtpVerifyy(String mobileNumber , String otpp ) async{
  try {
    var data = {
      "mobile": mobileNumber,
      'otp': otpp
    };
    String url = '$baseUrl$endpoint_otp';
    http.Response response = await http.post(Uri.parse(url), body: data);
    print(response.body);
    dynamic jjson = jsonDecode(response.body);
    print(jjson["success"]);
    return(jjson["success"]);
  } catch(error){
    print("The erore is $error");
  }
}

Future<dynamic> SigninOtpVerify(String mobileNumber ) async{
  try {
    var data = {
      "mobile": mobileNumber,
    };
    String url = '$baseUrl$endpoint_signinotp';
    http.Response response = await http.post(Uri.parse(url), body: data);
    print(response.body);
    dynamic jjson = jsonDecode(response.body);
    print(jjson["success"]);
    return(jjson["success"]);
  } catch(error){
    print("The error is $error");
  }
}