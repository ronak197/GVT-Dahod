import 'package:flutter/material.dart';

class CompanyVerification extends StatefulWidget {
  @override
  _CompanyVerificationState createState() => _CompanyVerificationState();
}

class _CompanyVerificationState extends State<CompanyVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Verification", style: TextStyle(color: Colors.black54),),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          InfoBox()
        ],
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0,right: 20.0, top: 10.0),
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("Company name : Ambuja Cement"),
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          Container(
            child: Text("City : Dahod"),
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          Container(
            child: Text("Email : ambuja@gmail.com "),
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          Container(
            child: Text("Contact No. : 9823233213"),
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          Container(
            child: Text("Username  : ambuja143 "),
          ),
          Center(
            child: RaisedButton(
              child: Text("Verify"),
              onPressed: () {},
              padding: EdgeInsets.only(top: 5.0),
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
