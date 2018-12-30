import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
<<<<<<< HEAD
import 'select_work.dart';
import 'loginpage.dart';
import 'profilepage.dart';
import 'nominee_list.dart';
import 'gallery.dart';
=======
>>>>>>> 95d7de6f62270e39111483aafd583e9e1144cd0b

import 'package:gvtdahod/course_registration.dart';
import 'package:gvtdahod/loginpage_worker.dart';
import 'package:gvtdahod/loginpage_company.dart';

void main() => runApp(MyApp());
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
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

  List<String> carouselImages = new List();

  @override
  void initState() {
    carouselImages.add('assets/image1.png');
    carouselImages.add('assets/image2.png');
    carouselImages.add('assets/image3.png');
    carouselImages.add('assets/image4.png');
    carouselImages.add('assets/image5.png');
    carouselImages.add('assets/image6.png');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFFFDBB),
        iconTheme: IconThemeData(
          color: Color(0xffada505),
        ),
        title: Text("Gramin Vikas Trust",style: TextStyle(color: Color(0xffAA9900)),),
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
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => new LoginPageCompanyHome()),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Color(0xffD9D24B), size: 22.0,),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Sign In for Contracter"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => new LoginPageWorkerHome()));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person_pin, color: Color(0xffD9D24B), size: 22.0,),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Login for Candidate"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new CourseRegistrationPage()
                      ));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.receipt, color: Color(0xffD9D24B), size: 22.0,),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Register for the course"),
                      ),
                    ],
                  ),
                ),
<<<<<<< HEAD
                Container(
                  child: FlatButton(
                    onPressed:() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>new GalleryClass()
                        ));
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.photo_library, color: Color(0xffD9D24B), size: 22.0,),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Gallery"),
                        ),
                      ],
                    ),
=======
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
>>>>>>> 95d7de6f62270e39111483aafd583e9e1144cd0b
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
          color: Color(0xffFFFDBB),
//          decoration: BoxDecoration(
////            image: DecorationImage(
////              image: AssetImage("assets/bgimage.png"),
////              alignment: Alignment.topCenter,
////              repeat: ImageRepeat.repeatY
////            ),
//          ),
          padding: EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10.0, top: 5.0),
                child: CarouselSlider(
                  autoPlay: true,
                  interval: Duration(seconds: 3),
                  autoPlayDuration: Duration(milliseconds: 800),
                  items: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(carouselImages[0],scale: 2,fit: BoxFit.fill,),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(carouselImages[1], scale: 2, fit: BoxFit.fill,),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(carouselImages[2],scale: 2, fit: BoxFit.fill,),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(carouselImages[3],scale: 2, fit: BoxFit.fill,),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(carouselImages[4],scale: 2, fit: BoxFit.fill,),
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(carouselImages[5],scale: 2, fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text.rich(
                  TextSpan(text: "Let's make our life successful, are you financially unemployed? Yes .. So let's go" ,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
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