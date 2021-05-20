import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_solutions_test/services.dart';
import 'message.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  int index;

  Details({
    Key key,
    @required this.index,
  }) : super(key: key);
  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  List<Message> messageList = Data.messagesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Details",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(color: Colors.black),
                fontSize: 30,
                color: Colors.orange[900])),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("ID: ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    Text(" ${messageList[widget.index].id}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [
                    Text("NAME: ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    Text(" ${messageList[widget.index].name}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("EMAIL: ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    Text(" ${messageList[widget.index].emailAddress}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("PHONE: ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    Text(" ${messageList[widget.index].phoneNumber}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("TIME: ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    Text(" ${messageList[widget.index].timeStamp}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [
                    Text("REQUEST CONTENT: ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    Text(" ${messageList[widget.index].requestContent}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () async {
                        await launch(
                            "mailto://${messageList[widget.index].emailAddress}");
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.email,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () async {
                        await launch(
                            "tel://${messageList[widget.index].phoneNumber}");
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.call,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.red[900],
                    onPressed: () {
                      Data.messagesList.removeAt(widget.index);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "DELETE",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 14),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//   String _showDialog() {
//     // flutter defined function
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return AlertDialog(
//           title: Text("Are you sure?"),
//           actions: <Widget>[
//             // usually buttons at the bottom of the dialog
//             new FlatButton(
//               child: Text("Close", style: TextStyle(color: Colors.orange[900])),
//               onPressed: () {
//                 Navigator.of(context).pop("false");
//               },
//             ),
//             new FlatButton(
//               child: Text("Yes", style: TextStyle(color: Colors.orange[900])),
//               onPressed: () {
//                 Navigator.of(context).pop("true");
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

}
