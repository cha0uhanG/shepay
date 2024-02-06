import 'package:flutter/material.dart';
import "package:otp_text_field/style.dart";
import "package:shepays/constant.dart";
import "package:shepays/Signup_page.dart";
import "package:shepays/API.dart";
import 'package:otp_text_field/otp_text_field.dart';
import 'package:shepays/home_page.dart';

class OtpVerifySignup extends StatelessWidget {
  String phonenumber ;
  OtpVerifySignup({required this.phonenumber});
  String otpp="" ;
  dynamic? pin ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 300,),
          Center(child: Text("Enter OTP")),
          SizedBox(height: 05),
          Otpcall(context),
          SizedBox(height: 40),
          ElevatedButton(style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorr),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(300, 50), //#450BEA
            ),
          ),
            onPressed: () async {
            print(otpp);
             var recieved_message = await OtpVerifyy(phonenumber,otpp);
             print("The recieved otp is ${recieved_message}");
             if(recieved_message==false){
               print("incorrect otp, enter valid otp");}
               else{
                print("your phone is succesffully registered") ;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeP()
                )
                );
             }

            },
            child: Text('Proceed ahead', style: TextStyle(
              color: Colors.white, // Set the color of the text
            ),),
          ),

        ],
      ),

    );
  }

  OTPTextField Otpcall(BuildContext context) {
    return OTPTextField(margin:EdgeInsets.fromLTRB(5, 1, 5, 1),
          length: 4,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 50,
          style: TextStyle(
              fontSize: 17
          ),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onChanged: (pin) {
               otpp = pin ;
            print("Completed: " + pin);
          },
        );
  }



  }




// F
// dynamic recived_message = await OtpVerify(widget.phonenumber,otp);