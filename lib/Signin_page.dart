import 'package:flutter/material.dart';
import "package:shepays/constant.dart";
import "package:shepays/Signup_page.dart";
import "package:shepays/Otp_signin.dart" ;
import "package:shepays/API.dart";

class Signin extends StatelessWidget {

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
            child: Image.asset("images/shepays.jpeg"),),
          SizedBox(height: 40,),
          Container(color: Colors.white,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Pleas enter your phone number",style:TextStyle(fontWeight:FontWeight.w600 ,fontSize:20 ) ,),
                SizedBox(height: 05,),
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
                  Text("Sign up", style: TextStyle(
                      color: colorr, fontWeight: FontWeight.w500),),
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()),
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
                       var messagee = await SigninOtpVerify(textValue);
                      if(messagee==false){
                        print("mobile number is not register with us ");
                        SnackBarr(context, "your phone is not register with us");
                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpVerifySigin()
                          ),
                        );
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

  void SnackBarr(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
