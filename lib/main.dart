import 'package:flutter/material.dart';
import "package:shepays/API.dart";
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "package:shepays/constant.dart";
import "package:shepays/Signup_page.dart";
import "package:shepays/Signin_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'SHE_PAYS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHome()
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  final PageController pageController = PageController();
  List<dynamic> imagesurl = [];
 @override
  void initState() {
   imageapi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            child: Container(width:double.infinity,
              height: 200.0,
              child: PageView.builder(
                controller: pageController,
                itemCount: imagesurl.length,
                itemBuilder: (context, index) {
                  return Image.network(imagesurl[index],);
                },
              ),
            ),
          ),
          SmoothPageIndicator(
              controller: pageController,  // PageController
              count:  4,
              effect:WormEffect(
                  activeDotColor: colorr
              ),  // your preferred effect

          )  ,
        SizedBox(height: 60.0),
          Text("ShePays",style: TextStyle(fontSize:20,fontWeight:FontWeight.w800  ),),
          SizedBox(height: 20.0),
          Text("Empowering Financial growth of Indian",style: TextStyle(fontSize:20,fontWeight:FontWeight.w300  ),),
          Text(" women",style: TextStyle(fontSize:20 ),),
          SizedBox(height: 40.0),
          ElevatedButton(style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(300, 50), // Adjust the width as needed
            ),
          ),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signin()),
            );
            },
            child: Text('Login'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(colorr),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(300, 50), //#450BEA
            ),

          ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            },
            child: Text('Sign Up' , style: TextStyle(
              color: Colors.white, // Set the color of the text
            ),),
          ),
          SizedBox(height: 30.0),
        ],

      ),
    )


      ,);
  }
  Future<dynamic> imageapi() async{
    List<dynamic> fetchedImages   =await apii() ;
    imagesurl=fetchedImages ;
    print(imagesurl);
    print(imagesurl.length);
    setState(() {
    });
  }


}







//for(int i=0; i<4; i++){
//       print(imagesurl[i]);
//     }