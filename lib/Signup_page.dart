import 'package:flutter/material.dart';
import "package:shepays/API.dart";
import "package:shepays/constant.dart";
import "package:shepays/constant.dart";
import "package:shepays/Signin_page.dart";
import "package:shepays/Otp_page.dart";




class Signup extends StatelessWidget {
  Signup({super.key});

  String textValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(color: Colors.white12,
            height: MediaQuery
                .of(context)
                .size
                .height / 3,
            child: Image.asset("images/shepays.jpeg")),
          SizedBox(height: 40,),
          Container(color: Colors.white,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome aboard",style:TextStyle(fontWeight:FontWeight.w600 ,fontSize:20 ) ,),
                SizedBox(height: 3,),
                Text("Lets creat your ShePays Account",style:TextStyle(fontWeight:FontWeight.w600,fontSize:20  ) ),
                SizedBox(height: 20,),
                Text("Pleas enter your phone number that is linked to adhaar"
                    ,style:TextStyle(fontSize:18 ),),
                SizedBox(height: 3,),
                TextField(onChanged: (value) {
                  textValue = value;
                },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    labelText: '9999999999',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(children: [
                  Text("Already have an account",),
                  SizedBox(width: 10),
                  InkWell(child:
                  Text("Sign in", style: TextStyle(
                      color: colorr, fontWeight: FontWeight.w500),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => Signin()),
                        );
                      }


                  )
                ],),

                Text("Welcome aboard",),
                SizedBox(height: 140,),
                Center(
                  child: ElevatedButton(style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(colorr),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(300, 50), //#450BEA
                    ),

                  ),
                    onPressed: () async {
                    if(textValue.isEmpty){
                      SnackBarr(context,"Enter phone number");
                    }else{
                      dynamic recived_message = await sendRegistrationOTP(textValue);
                      print(textValue);
                      print(recived_message);
                      if (recived_message == false){
                        SnackBarr(context,"your phone is already register");
                      }else{
                        print('Message received successfully. Navigating to Home screen.');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpVerifySignup(phonenumber: textValue)
                          ),
                        );
                      }
                    }
                    },
                    child: Text('Proceed ahead', style: TextStyle(
                      color: Colors.white, // Set the color of the text
                    ),),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }

  void SnackBarr(BuildContext context,String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
