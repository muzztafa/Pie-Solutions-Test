import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_solutions_test/details.dart';
import 'package:pie_solutions_test/services.dart';
import 'loadingBar.dart';
import 'message.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  List<Message> messageList = [];

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
    try {
      Data data = new Data();
      await data.getData();
      setState(() {
        this.isLoading = false;
        this.messageList = Data.messagesList;
      });
    } catch (e) {
      setState(() {
        this.isLoading = false;
      });
    }
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
      body: isLoading
          ? LoadingBar(opac: 1)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                ),
                Expanded(
                  child: messageList.length > 0
                      ? ListView.builder(
                          itemCount: messageList.length,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          itemBuilder: (context, index) {
                            final item = messageList[index];
                            return Card(
                              child: ListTile(
                                trailing: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.green,
                                ),
                                onTap: () async {
                                  await Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Details(
                                                index: index,
                                              )));
                                  setState(() {
                                    this.messageList = Data.messagesList;
                                  });
                                },
                                title: Text(item.name.toString(),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      textStyle: TextStyle(color: Colors.black),
                                      fontSize: 20,
                                      color: Colors.black,
                                    )),
                                subtitle: Text(item.emailAddress.toString(),
                                    style: GoogleFonts.poppins(
                                      // fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      textStyle: TextStyle(color: Colors.black),
                                      fontSize: 15,
                                      color: Colors.black,
                                    )),
                              ),
                            );
                          })
                      : Center(
                          child: Text(
                          "No Data To Show!",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            textStyle: TextStyle(color: Colors.black),
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )),
                ),
              ],
            ),
    );
  }
}
