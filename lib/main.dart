import 'package:flutter/material.dart';
import 'package:gvtdahod/recruitment_details.dart';
import 'package:gvtdahod/company_registration.dart';
import 'package:gvtdahod/worker_registration.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WorkerRegistrationPage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xffada505),
        ),
        title: Text("Gramin Vikas Trust",style: TextStyle(color: Color(0xff5C5303)),),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: Container(
            color: Color(0xffFAF8D1),
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(padding: EdgeInsetsDirectional.only(top: 10.0)),
                      new CircleAvatar(
                        child: new Text("C",style: TextStyle(color: Colors.black87,fontSize: 20.0),),
                        backgroundColor: Color(0xffF7F071),
                        radius: 30.0,
                      ),
                      new Padding(padding: EdgeInsetsDirectional.only(top: 15.0)),
                      new Text("Contracter", style: TextStyle(color: Colors.black87),),
                      new Padding(padding: EdgeInsetsDirectional.only(top: 5.0)),
                      new Text("abcd@gmail.com",style: TextStyle(color: Colors.grey,fontSize: 11.0),),
                    ],
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed:() {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.account_circle, color: Color(0xffD9D24B), size: 22.0,),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Sign Up/Login"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed:() {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.account_circle, color: Color(0xffD9D24B), size: 22.0,),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Profile"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed:() {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.photo_library, color: Color(0xffD9D24B), size: 22.0,),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Gallery"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onPressed:() {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.info, color: Color(0xffD9D24B),size: 22.0,),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("About Us"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed:() {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.phone, color: Color(0xffD9D24B), size: 22.0,),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Contact Us"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset("assets/image1.png"),
              ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text.rich(
                  TextSpan(text: "Let's make our life successful, are you financially unemployed? Yes .. So let's go" ,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                      letterSpacing: 0.5,
                      height: 1.25
                    ),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0,left: 30.0, right: 30.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/imageIcon.png"),
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: RawMaterialButton(
                        onPressed: () {},
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10.0),
                        highlightColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffD9D24B),
                          child: Image.asset("assets/infoIcon.png",scale: 1.25,),
                          radius: 40.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100.0,left: 20.0, right: 20.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Get Info. about enrollment criteria and priveleges",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/imageIcon.png"),
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: RawMaterialButton(
                        onPressed: () {},
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10.0),
                        highlightColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffD9D24B),
                          child: Image.asset("assets/profilesIcon.png", scale: 1.25,),
                          radius: 40.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100.0,left: 20.0, right: 20.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Find the company best suited for your choice",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0,left: 30.0,right: 30.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/imageIcon.png"),
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: RawMaterialButton(
                        onPressed: () {},
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10.0),
                        highlightColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffD9D24B),
                          child: Image.asset("assets/workerIcon.png",scale: 1.25,),
                          radius: 40.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100.0,left: 20.0, right: 20.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Find suitable candidtate for your work",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/imageIcon.png"),
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: RawMaterialButton(
                        onPressed: () {},
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10.0),
                        highlightColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffD9D24B),
                          child: Image.asset("assets/supportIcon.png",scale: 1.25,),
                          radius: 40.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100.0,left: 20.0, right: 20.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Contact us to know further information",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
