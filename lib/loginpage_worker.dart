import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gvtdahod/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gvtdahod/candidateProfile.dart';

class LoginPageWorkerHome extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageWorkerHome> {

  GlobalKey scaffoldKey = new GlobalKey();

  String mobileNo;
  String smsCode;
  String verificationId;

  bool profileExists = false;

  signIn(){
    FirebaseAuth.instance.signInWithPhoneNumber(
      smsCode: this.smsCode,
      verificationId: this.verificationId
    ).then((user){
      print(user);
    }).catchError((e){
      dialogAfterFailure(e);
    });
  }

  Future<void> getSMS() async {

    print(mobileNo);

    DocumentReference documentReference = Firestore.instance.document("workers/$mobileNo");


    await documentReference.get().then((dataSnapshot){
      if(dataSnapshot.exists){
        CandidateProfile.candidateName = dataSnapshot.data['full name'];
        CandidateProfile.mobileNo = dataSnapshot.data['mobile no.'];
        CandidateProfile.dateOfBirth = dataSnapshot.data['date of birth'];
        CandidateProfile.address = dataSnapshot.data['address'];
        CandidateProfile.gender = dataSnapshot.data['gender'];
        CandidateProfile.work = dataSnapshot.data['work'];
        CandidateProfile.caste = dataSnapshot.data['caste'];
        CandidateProfile.worker = true;
        print(CandidateProfile.candidateName);
        setState(() {
          profileExists = true;
        });
      }
    });

      if (profileExists) {
        print("Profile exits");

        final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
          this.verificationId = verId;
        };

        final PhoneCodeSent smsCodeSent = (String verId,
            [int forceCodeResend]) {
          this.verificationId = verId;
        };

        final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
          print("Verified");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
                  (Route<dynamic> route) => false
          );
        };

        final PhoneVerificationFailed verifiedFailed = (
            AuthException exception) {
          dialogAfterFailure("${exception.message}");
        };

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: this.mobileNo,
          codeAutoRetrievalTimeout: autoRetrieve,
          codeSent: smsCodeSent,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verifiedSuccess,
          verificationFailed: verifiedFailed,
        );
      } else {
        dialogAfterFailure("You are not registered");
      }


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
      key: scaffoldKey,
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
                  child: TextField(
                    style: TextStyle(color: Color(0xffEBE06B), fontSize: 18.0),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff969B7F).withOpacity(0.5),
                      hintText: "Mobile No.",
                      hintStyle: TextStyle(color: Colors.yellow),
                      contentPadding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0, right: 15.0),
                      border: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onChanged: (value){
                      this.mobileNo = "+91 " + value;
                    },
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 8.0, top: 100.0),
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: TextField(
                    onChanged: (value) {
                      this.smsCode = value;
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Color(0xffEBE06B), fontSize: 18.0),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff969B7F).withOpacity(0.5),
                      hintText: "One Time Password",
                      hintStyle: TextStyle(color: Colors.yellow),
                      contentPadding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0, right: 15.0),
                      border: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CupertinoButton(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text("Get OTP",style: TextStyle(color: Colors.white, fontSize: 15.0),),
                    onPressed: getSMS,
                    pressedOpacity: 0.5,
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                  child: CupertinoButton(
                    padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Text("Login",style: TextStyle(color: Color(0xffAA9900)),),
                    onPressed: () {
                      FirebaseAuth.instance.currentUser().then((user){
                        print(user);
                        if(user!=null){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()
                              ),
                                  (Route<dynamic> route) => false
                          );
                        }else {
                          AlertDialog(
                            content: Text("Hello"),
                          );
                          signIn();
                        }
                      });
                    },
                    color: Color(0xffF5E44A),
                    pressedOpacity: 0.5,
                    borderRadius: BorderRadius.circular(40.0),
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