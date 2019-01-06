import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gvtdahod/company_registration.dart';
import 'package:gvtdahod/candidateProfile.dart';

class LoginPageCompanyHome extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageCompanyHome> {

  String username;
  String password;
  bool profileExists = false;

  Future<void> login() async {
    DocumentReference documentReference = Firestore.instance.document("contracter/$username");

    await documentReference.get().then((dataSnapshot){
      if(dataSnapshot.exists){
        CandidateProfile.companyName = dataSnapshot.data['company name'];
        CandidateProfile.city = dataSnapshot.data['city'];
        CandidateProfile.email = dataSnapshot.data['email'];
        CandidateProfile.contactNo = dataSnapshot.data['contact no'];
        CandidateProfile.username = dataSnapshot.data['username'];
        CandidateProfile.nofmason = dataSnapshot.data['nofmason'];
        CandidateProfile.wofmason = dataSnapshot.data['wofmason'];
        CandidateProfile.nofplumber = dataSnapshot.data['nofplumber'];
        CandidateProfile.wofplumber = dataSnapshot.data['wofplumber'];
        CandidateProfile.nofpainter = dataSnapshot.data['nofpainter'];
        CandidateProfile.wofpainter = dataSnapshot.data['wofpainter'];
        CandidateProfile.nofbarbinder = dataSnapshot.data['nofbarbinder'];
        CandidateProfile.wofbarbinder = dataSnapshot.data['wofbarbinder'];
        CandidateProfile.switchToCompany();
      } else {
        dialogAfterFailure("You are not approved by ngo yet");
      }
    });
  }

  Future<Null> dialogAfterFailure(String msg) async {
    await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            title: Text(
              msg,
              style: TextStyle(
                  fontFamily: "OpenSans",
                  color: Color(0xFFAA9900)
              ),
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SimpleDialogOption(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Okay")
                  ),
                ],
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/loginbg.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
                    child: Text("Gramin Vikas Trust", style: TextStyle(color: Colors.white, fontSize: 50.0), textAlign: TextAlign.center,)
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: TextFormField(
                    onSaved: (val) {
                      username = val;
                    },
                    style: TextStyle(color: Color(0xffEBE06B), fontSize: 18.0),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff969B7F).withOpacity(0.5),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.yellow),
                      contentPadding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0, right: 15.0),
                      border: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 8.0, top: 100.0),
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: TextFormField(
                    obscureText: true,
                    onSaved: (val) {
                      password = val;
                    },
                    style: TextStyle(color: Color(0xffEBE06B), fontSize: 18.0),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff969B7F).withOpacity(0.5),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.yellow),
                      contentPadding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0, right: 15.0),
                      border: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 25.0),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                  child: CupertinoButton(
                    padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Text("Login",style: TextStyle(color: Color(0xffAA9900)),),
                    onPressed: login,
                    color: Color(0xffF5E44A),
                    pressedOpacity: 0.5,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                Container(
                  child: InkWell(
                    child: Text("Not a member? Register here", style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompanyRegistrationPage()
                          ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}