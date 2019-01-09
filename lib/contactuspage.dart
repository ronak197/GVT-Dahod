import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
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
        title: Text("Contact Us", style: TextStyle(color: Color(0xffaa9900)),),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(top: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Image(image: AssetImage("assets/gvticon.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
