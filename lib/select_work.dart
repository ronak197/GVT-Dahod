import 'package:flutter/material.dart';
import 'package:gvtdahod/nominee_list.dart';
import 'package:gvtdahod/selected_workers.dart';

class SelectWorkPage extends StatefulWidget {

  bool selectedWorkerPage = false;

  SelectWorkPage({this.selectedWorkerPage});
  @override
  _SelectWorkPageState createState() => _SelectWorkPageState();
}

class _SelectWorkPageState extends State<SelectWorkPage> {

  bool selectedWorkerPage;

  _SelectWorkPageState({this.selectedWorkerPage});

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffaa9900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              onPressed: () {
                if(selectedWorkerPage == false) {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          NomineeList(typeOfWorker: 'plumber',)));
                }
                else {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          SelectedWorkers(typeOfWorker: 'plumber',)));
                }
              },
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
              onPressed: () {if(selectedWorkerPage == false) {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        NomineeList(typeOfWorker: 'painter',)));
              }
              else {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        SelectedWorkers(typeOfWorker: 'painter',)));
              }
              },
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
              onPressed: () {if(selectedWorkerPage == false) {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        NomineeList(typeOfWorker: 'mason',)));
              }
              else {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        SelectedWorkers(typeOfWorker: 'mason',)));
              }},
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
              onPressed: () {if(selectedWorkerPage == false) {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        NomineeList(typeOfWorker: 'barbinder',)));
              }
              else {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        SelectedWorkers(typeOfWorker: 'barbinder',)));
              }},
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
