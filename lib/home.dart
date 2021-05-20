import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_solutions_test/services.dart';
import 'loadingBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessages();
    setState(() {
      this.isLoading = true;
    });
  }

  Future getMessages() async {
    Data data = new Data();
    await data.getData();
    setState(() {
      this.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Messages",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(color: Colors.black),
                fontSize: 30,
                color: Colors.orange[900])),
      ),
      body: isLoading ? LoadingBar(opac: 1) : Text("data loaded"),
    );
  }
}
