import 'package:flutter/material.dart';

class NomineeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NomineeListHome(),
    );
  }
}

class NomineeListHome extends StatefulWidget {
  @override
  _NomineeListHomeState createState() => _NomineeListHomeState();
}

class _NomineeListHomeState extends State<NomineeListHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Workers List", style: TextStyle(color: Color(0xffAA9900)),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 5.0),
          children: <Widget>[
            NomineeContainer(),
            NomineeContainer(),
          ],
        ),
      ),
    );
  }
}

class NomineeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      padding: EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
      decoration: BoxDecoration(
          color: Color(0xffF8ED85),
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 70.0,
            width: 70.0,
            margin: EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text("Ramgopal Verma", style: TextStyle(fontSize: 18.0, color: Colors.black54),),
                ),
                Container(
                  padding: EdgeInsets.only(top:5.0),
                  child: Text("Plumber", style: TextStyle(color: Colors.black45), textAlign: TextAlign.left,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


