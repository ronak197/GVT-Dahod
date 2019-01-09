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
            developerContainer("assets/sampleimage.jpg", "Dhruvam Panchal"),
            developerContainer("assets/sampleimage.jpg", "Hastin Modi"),
            developerContainer("assets/sampleimage.jpg", "Jaimin Vaghela"),
            developerContainer("assets/sampleimage.jpg", "Ronak Jain"),
            developerContainer("assets/sampleimage.jpg", "Sanket Chaudhari"),
          ],
        ),
      ),
    );
  }
}

Widget developerContainer(String imageLocation, String developerName) {
  return Container(
     child: Row(
       children: <Widget>[
         Container(
           margin: EdgeInsets.only(left: 10.0, top: 10.0),
           height: 100.0,
           width: 100.0,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             image: DecorationImage(
               image: AssetImage(imageLocation),
               fit: BoxFit.fill
             ),
           ),
         ),
         Container(
           padding: EdgeInsets.only(left: 20.0),
           child: Text(developerName, style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),),
         ),
       ],
     ),
  );
}