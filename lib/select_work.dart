import 'package:flutter/material.dart';

class SelectWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectWorkHome(),
    );
  }
}


class SelectWorkHome extends StatefulWidget {
  @override
  _SelectWorkHomeState createState() => _SelectWorkHomeState();
}

class _SelectWorkHomeState extends State<SelectWorkHome> {

  List<Color> colorList = [Colors.blue,Colors.yellow];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Select Work", style: TextStyle(color: Color(0xffAA9900)),),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 75.0,right: 75.0),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/plumber.jpg"),fit: BoxFit.cover,  colorFilter: ColorFilter.mode(Colors.black38, BlendMode.color)),
            ),
            height: 120.0,
            child: RaisedButton(
              onPressed: () {},
              splashColor: Colors.yellow.withOpacity(0.5),
              padding: EdgeInsets.all(0.0),
              color: Color(0x00ffffff),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text("Plumber", style: TextStyle(color: Colors.white, fontSize: 20.0),),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 75.0,right: 75.0, top: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/painter.jpg"),fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black38, BlendMode.color)),
            ),
            height: 120.0,
            child: RaisedButton(
              onPressed: () {},
              splashColor: Colors.yellow.withOpacity(0.5),
              padding: EdgeInsets.all(0.0),
              color: Color(0x00ffffff),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text("Painter", style: TextStyle(fontSize: 20.0, color: Colors.white),),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 75.0,right: 75.0, top: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bricks.jpg"),fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black38, BlendMode.color)),
            ),
            height: 120.0,
            child: RaisedButton(
              onPressed: () {},
              splashColor: Colors.yellow.withOpacity(0.5),
              padding: EdgeInsets.all(0.0),
              color: Color(0x00ffffff),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text("Mason", style: TextStyle(color: Colors.white, fontSize: 20.0),),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 75.0,right: 75.0, top: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/steelpipe.jpg"),fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black38,BlendMode.color)),
            ),
            height: 120.0,
            child: RaisedButton(
              onPressed: () {},
              splashColor: Colors.yellow.withOpacity(0.5),
              padding: EdgeInsets.all(0.0),
              color: Color(0x00ffffff),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                child: Text("Barbinder and Shuttering", style: TextStyle(color: Colors.white, fontSize: 20.0),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
