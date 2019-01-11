import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gvtdahod/candidateProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecruitmentPageDetails extends StatefulWidget {
  @override
  _RecruitmentPageDetailsState createState() => _RecruitmentPageDetailsState();
}

class _RecruitmentPageDetailsState extends State<RecruitmentPageDetails> {

  int nofmason;
  int wofmason;
  int nofpainter;
  int wofpainter;
  int nofplumber;
  int wofplumber;
  int nofbarbinder;
  int wofbarbinder;


  final formKey = new GlobalKey<FormState>();

  Future<void> saveForm() async {

    final DocumentReference documentReference = Firestore.instance.document("contracter/${CandidateProfile.username}");
    final DocumentReference documentReferenceProfileUpdate = Firestore.instance.document("contracter/${CandidateProfile.username}");

    Map<String,int> registrationProfile = <String,int>{
      "nofplumber" : nofplumber,
      "wofplumber" : wofplumber,
      "nofpainter" : nofpainter,
      "wofpainter" : wofpainter,
      "nofmason" : nofmason,
      "wofmason" : wofmason,
      "nofbarbinder" : nofbarbinder,
      "wofbarbinder" : wofbarbinder
    };
    await documentReference.updateData(registrationProfile).whenComplete((){
      print("Document updated");
    }).catchError((e) => print(e));

    await documentReferenceProfileUpdate.get().then((dataSnapshot){
      if(dataSnapshot.exists) {
        CandidateProfile.nofmason = dataSnapshot.data['nofmason'];
        CandidateProfile.wofmason = dataSnapshot.data['wofmason'];
        CandidateProfile.nofplumber = dataSnapshot.data['nofplumber'];
        CandidateProfile.wofplumber = dataSnapshot.data['wofplumber'];
        CandidateProfile.nofpainter = dataSnapshot.data['nofpainter'];
        CandidateProfile.wofpainter = dataSnapshot.data['wofpainter'];
        CandidateProfile.nofbarbinder = dataSnapshot.data['nofbarbinder'];
        CandidateProfile.wofbarbinder = dataSnapshot.data['wofbarbinder'];
      }
    });
  }

  void onSave(){
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      saveForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Recruitment Details",
          style: TextStyle(
            color: Color(0xff5C5303)
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 30.0, right: 30.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image.asset("assets/plumber_box.png"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 95.0, right: 30.0, top: 25.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "No. of Employees",
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffAA9900))),
                                  ),
                                  onSaved: (val) => nofplumber = int.parse(val),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Approx. Wage",
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffAA9900))),
                                  ),
                                  onSaved: (val) => wofplumber = int.parse(val),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image.asset("assets/painter_box.png"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 95.0, right: 30.0, top: 25.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "No. of Employees",
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffAA9900))),
                                  ),
                                  onSaved: (val) => nofpainter = int.parse(val),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Approx. Wage",
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffAA9900))),
                                  ),
                                  onSaved: (val) => wofpainter = int.parse(val),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image.asset("assets/mason_box.png"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 95.0, right: 30.0, top: 25.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "No. of Employees",
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffAA9900))),
                                  ),
                                  onSaved: (val) => nofmason = int.parse(val),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Approx. Wage",
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffAA9900))),
                                  ),
                                  onSaved: (val) => wofmason = int.parse(val),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image.asset("assets/pliers_box.png",filterQuality: FilterQuality.high,),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 95.0, right: 30.0, top: 25.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "No. of Employees",
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffAA9900))),
                                  ),
                                  onSaved: (val) => nofbarbinder = int.parse(val),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Approx. Wage",
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffAA9900))),
                                  ),
                                  onSaved: (val) => wofbarbinder = int.parse(val),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                  child: CupertinoButton(
                    padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Text("Save",style: TextStyle(color: Color(0xffAA9900)),),
                    onPressed: onSave,
                    color: Color(0xffF5E44A),
                    pressedOpacity: 0.5,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
