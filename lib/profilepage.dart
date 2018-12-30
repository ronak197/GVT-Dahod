import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffF8ED85),
        title: Text("Profile", style: TextStyle(color: Color(0xffAA9900)),),
        elevation: 0.0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xffB7A400),
        elevation: 0.0,
        child: Icon(Icons.edit),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xffF8ED85),
            padding: EdgeInsets.only(left: 20.0, bottom: 30.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 95.0,
                  width: 95.0,
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
                        child: Text("Ramgopal Verma", style: TextStyle(fontSize: 20.0, color: Colors.black54),),
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
          ),
          Container(
            padding: EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.phone, color: Color(0xffB7A400),),
                  title: Text("+91 98979 69594"),
                ),
                ListTile(
                  leading: Icon(Icons.book, color: Color(0xffB7A400),),
                  title: Text("10th Pass"),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Color(0xffB7A400),),
                  title: Text("Male"),
                ),
                ListTile(
                  leading: Icon(Icons.format_align_justify, color: Color(0xffB7A400),),
                  title: Text("PLUM/20/16"),
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: Color(0xffB7A400),),
                  title: Text("Dahod"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}