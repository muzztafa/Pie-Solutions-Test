import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_solutions_test/home.dart';
import 'services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ahmed\nMustafa",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(color: Colors.black),
                    fontSize: MediaQuery.of(context).size.height * 0.08,
                    color: Colors.orange[900])),
            SizedBox(
              height: 10,
            ),
            Text("Flutter Test For",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(color: Colors.black),
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    color: Colors.orange[900])),
            Text("Pie Solutions",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(color: Colors.black),
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    color: Colors.orange[900])),
          ],
        ),
      ),
    );
  }
}
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [Text("mustafa")],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blueAccent,
//         child: Text("+"),
//         onPressed: () async {
//           Data data = new Data();
//           data.getData();
//         },
//       ),
//     );
//   }
// }
