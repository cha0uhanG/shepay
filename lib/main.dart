import 'package:flutter/material.dart';
import "package:shepays/API.dart";

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
  final PageController _pageController = PageController();
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
                itemCount: imagesurl.length,
                itemBuilder: (context, index) {
                  return Container(child: Image.network(imagesurl[index],),);
                },
              ),
            ),
          ),
        SizedBox(height: 100.0),
          Text("Shop Unlimited",style: TextStyle(fontSize:20 ),),
          Text("Empowering Financial growth of Indian",style: TextStyle(fontSize:20 ),),
          Text(" women",style: TextStyle(fontSize:20 ),),
          ElevatedButton(style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(300, 50), // Adjust the width as needed
            ),
          ),
            onPressed: () {
              // Add your login logic here
            },
            child: Text('Login'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(300, 50), // Adjust the width as needed
            ),
          ),
            onPressed: () {
              // Add your signup logic here
            },
            child: Text('Sign Up'),
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