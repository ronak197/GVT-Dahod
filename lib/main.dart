import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:gvtdahod/course_registration.dart';
import 'package:gvtdahod/loginpage_worker.dart';
import 'package:gvtdahod/loginpage_company.dart';
import 'package:gvtdahod/gallery.dart';
import 'package:gvtdahod/company_registration.dart';
import 'package:gvtdahod/profilepage.dart';
import 'package:gvtdahod/candidateProfile.dart';
import 'package:gvtdahod/nominee_list.dart';

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

  CandidateProfile profile = new CandidateProfile();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String username = CandidateProfile.drawerUsername;
  String usernameSignature = CandidateProfile.drawerUsernameSign;

  @override
  void initState() {
    print(FirebaseAuth.instance.signOut());
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
      key: _scaffoldKey,
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
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage())
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsetsDirectional.only(top: 10.0)),
                      CircleAvatar(
                        child: Icon(Icons.person_outline, color: Colors.black87, size: 20.0,),
                        backgroundColor: Color(0xffF7F071),
                        radius: 30.0,
                      ),
                      Padding(padding: EdgeInsetsDirectional.only(top: 15.0)),
                      Text(username, style: TextStyle(color: Colors.black87),),
                      Padding(padding: EdgeInsetsDirectional.only(top: 5.0)),
                      Text(usernameSignature,style: TextStyle(color: Colors.grey,fontSize: 11.0),),
                    ],
                  ),
                ),
              ),

              CandidateProfile.profileType == 'default' ?
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
                        child: Text("Log In for Contracter"),
                      ),
                    ],
                  ),
                ),
              ) : SizedBox(
                height: 0.0,
                width: 0.0,
              ),

              CandidateProfile.profileType == 'default' ?
              Container(
                child: FlatButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => new LoginPageWorkerHome()));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Color(0xffD9D24B), size: 22.0,),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Log In for Candidate"),
                      ),
                    ],
                  ),
                ),
              ) : SizedBox(
                width: 0.0,
                height: 0.0,
              ),

              CandidateProfile.profileType == 'default' ?
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
              ) : SizedBox(
                height: 0.0,
                width: 0.0,
              ),

              CandidateProfile.profileType == 'default' ?
              Container(
                child: FlatButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => new CompanyRegistrationPage()
                    ));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.receipt, color: Color(0xffD9D24B), size: 22.0,),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Register your company"),
                      ),
                    ],
                  ),
                ),
              ) : SizedBox(
                width: 0.0,
                height: 0.0,
              ),

              Container(
                child: FlatButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  GalleryPage()
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
              Divider(),
              CandidateProfile.profileType == 'company' || CandidateProfile.profileType == 'worker' ?
              Container(
                child: FlatButton(
                  onPressed:() {
                    FirebaseAuth.instance.signOut();
                    setState(() {
                      CandidateProfile.switchToDefault();
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app, color: Color(0xffD9D24B), size: 22.0,),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Sign Out"),
                      ),
                    ],
                  ),
                ),
              ) : SizedBox(
                height: 0.0,
                width: 0.0,
              ),
            ],
          ),
        ),
        ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffFFFDBB),
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
                      color: Colors.black54,
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
                        onPressed: () {
                          if(CandidateProfile.profileType == 'worker'){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NomineeList()));
                          } else {
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text("You need to log in as candidate"),
                                  duration: Duration(seconds: 3),
                                ),
                            );
                          }
                        },
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
                        onPressed: () {
                          if(CandidateProfile.profileType == 'company'){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NomineeList()));
                          } else {
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("You need to log in as contracter"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
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