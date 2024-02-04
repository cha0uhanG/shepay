import 'dart:convert';

import 'package:flutter/material.dart';
import "package:shepays/main.dart";
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

const String urll ='https://dev.shepays.com/api/introscreen-images' ;
dynamic json ;
List<dynamic> imageurl = [] ;


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