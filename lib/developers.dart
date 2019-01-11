import 'package:flutter/material.dart';

class DevelopersPage extends StatefulWidget {
  @override
  _DevelopersPageState createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffF8ED85),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffaa9900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Developers", style: TextStyle(color: Color(0xffaa9900)),),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            developerContainer("assets/dhruvam_developer.jpg", "Dhruvam Panchal", "dhruvampanchal@gmail.com", "+91 9099040307"),
            developerContainer("assets/sampleimage.jpg", "Hastin Modi", "hastinmodi@yahoo.in", "+91 9427809085"),
            developerContainer("assets/jaimin_developer.jpg", "Jaimin Vaghela", "jaimin2320@gmail.com", "+91 756771958"),
            developerContainer("assets/ronak_developer.jpg", "Ronak Jain", "jain.ronak197@gmail.com", "+91 9879593420"),
            developerContainer("assets/sanket_developer.jpg", "Sanket Chaudhari", "sanket143@zoho.com", "+91 7359814667"),
          ],
        ),
      ),
    );
  }
}

Widget developerContainer(String imageLocation, String developerName, String emailId, String contactNo) {
  return Container(
     child: Row(
       children: <Widget>[
         Container(
           margin: EdgeInsets.only(left: 10.0, top: 12.0),
           height: 80.0,
           width: 80.0,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             image: DecorationImage(
               image: AssetImage(imageLocation),
               fit: BoxFit.cover
             ),
           ),
         ),
         Container(
           padding: EdgeInsets.only(left: 20.0),
           child: RichText(
             text: TextSpan(
               children: [
                 TextSpan(
                   text: "$developerName",
                   style: TextStyle(color: Colors.black87, fontSize: 16.0)
                 ),
                 TextSpan(
                   text: "\n$emailId",
                   style: TextStyle(
                     color: Colors.grey,
                     fontSize: 14.0
                   ),
                 ),
                 TextSpan(
                   text: "\n$contactNo",
                   style: TextStyle(
                       color: Colors.grey,
                       fontSize: 14.0
                   ),
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
  );
}