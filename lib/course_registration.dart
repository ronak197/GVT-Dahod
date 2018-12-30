import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseRegistrationPage extends StatefulWidget {
  @override
  _CourseRegistrationPageState createState() => _CourseRegistrationPageState();
}

enum confirmationAnswer{YES, NO}
class _CourseRegistrationPageState extends State<CourseRegistrationPage> {

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  List<String> _workList = ["Plumber", "Painter", "Mason", "Barbinder or shuttering"];
  List<String> _casteList = ["SC", "ST", "OBC"];
  List<String> _genderList = ["Male","Female","Other"];

  static String candidateName;
  static String address;
  static String contactNo;
  static String dateOfBirth;
  static String selectedCaste = 'Select Caste';
  static String selectedWork = 'Select Work';
  static String selectedGender = 'Select Gender';

  static final DocumentReference documentReference = Firestore.instance.document("admin/course registration/trainees/$candidateName");

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      askForConfirmation();
    }
  }

  Future<void> performRegistration() async {
    Map<String,String> registrationProfile = <String,String>{
      "full name" : candidateName,
      "address" : address,
      "contact no." : contactNo,
      "date of birth" : dateOfBirth,
      "caste" : selectedCaste,
      "gender" : selectedGender,
      "work" : selectedWork
    };
    await documentReference.setData(registrationProfile).whenComplete((){
      print("Document Added");
    }).catchError((e) => print(e));
  }

  Future<Null> askForConfirmation() async {
    switch(
      await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            title: Text("Do you want to proceed?"),
            children: <Widget>[
              Row(
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: (){
                      Navigator.pop(context, confirmationAnswer.YES);
                    },
                    child: Text("Yes")
                  ),
                  SimpleDialogOption(
                    onPressed: (){
                      Navigator.pop(context, confirmationAnswer.NO);
                    },
                    child: Text("NO")
                  ),
                ],
              )
            ],
          );
        }
      )
    ){
      case confirmationAnswer.YES:
        showLoading();
        await performRegistration();
        Navigator.pop(context);
        break;
    }
  }

  void showLoading() async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          contentPadding: EdgeInsets.all(0.0),
          content: Container(
            width: 250.0,
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  width: 15.0
                ),
                Text(
                  "Sending, Please Wait..",
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    color: Color(0xFF5B69778)
                  ),
                )
              ],
            )
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xfff6f5e4),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Course Registration",
          style: TextStyle(
            color: Color(0xFFAA9900)
          )
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xffaa9900),
          ),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        backgroundColor: Color(0xFFF6F5E4),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
                  child: TextFormField(
                    style: TextStyle(
                      color: Color(0xFFAA9900),
                    ),
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFFAA9900)
                      ),
                      hintText: "Candidate Name",
                      hintStyle: TextStyle(
                        color: Color(0xFFAA9900)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFAA9900)
                        )
                      )
                    ),
                    validator: (val) => val.length <= 2 ? 'Too Short' : null,
                    onSaved: (val) => candidateName = val,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
                  child: TextFormField(
                    style: TextStyle(
                      color: Color(0xFFAA9900)
                    ),
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Color(0xFFAA9900)
                      ),
                      hintText: "Address",
                      hintStyle: TextStyle(
                        color: Color(0xFFAA9900)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFAA9900)
                        )
                      )
                    ),
                    validator: (val) => val.length <= 4 ? 'Too Short' : null,
                    onSaved: (val) => address = val,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5.0, right: 10.0, left: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Color(0xFFAA9900),
                    ),
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xFFAA9900)
                      ),
                      hintText: "Contact Number",
                      hintStyle: TextStyle(
                        color: Color(0xFFAA9900)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFAA9900)
                        )
                      )
                    ),
                    validator: (val) => val.length !=10 ? 'Type 10 digit mobile no.' : null,
                    onSaved: (val) => contactNo = val,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0, bottom: 5.0),
                  child: TextFormField(
                    style: TextStyle(
                      color: Color(0xFFAA9900)
                    ),
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.today,
                        color: Color(0xFFAA9900)
                      ),
                      hintText: "Date of Birth (dd/mm/yyyy)",
                      hintStyle: TextStyle(
                        color: Color(0xFFAA9900)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFAA9900)
                        )
                      )
                    ),
                    validator: (val) => val.length <= 5 ? 'Invalid Format' : null,
                    onSaved: (val) => dateOfBirth = val,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10.0,
                  runAlignment: WrapAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: DropdownButton<String>(
                        isExpanded: false,
                        items: _workList.map((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: new Text(val),
                          );
                        }).toList(),
                        hint: Text(selectedWork,style: new TextStyle(color: Color(0xffaa9900)),),
                        onChanged: (newVal) {
                          selectedWork = newVal;
                          this.setState(() {});
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: DropdownButton<String>(
                        isExpanded: false,
                        items: _casteList.map((String val) {
                          return new DropdownMenuItem<String>(
                            value: val,
                            child: new Text(val),
                          );
                        }).toList(),
                        hint: Text(selectedCaste,style: new TextStyle(color: Color(0xffaa9900)),),
                        onChanged: (newVal) {
                          selectedCaste = newVal;
                          this.setState(() {});
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: DropdownButton<String>(
                        isExpanded: false,
                        items: _genderList.map((String val) {
                          return new DropdownMenuItem<String>(
                            value: val,
                            child: new Text(val),
                          );
                        }).toList(),
                        hint: Text(selectedGender,style: new TextStyle(color: Color(0xffaa9900)),),
                        onChanged: (newVal) {
                          selectedGender = newVal;
                          this.setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                  child: CupertinoButton(
                    padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Text("Register",style: TextStyle(color: Color(0xffAA9900)),),
                    onPressed: _submit,
                    color: Color(0xffF5E44A),
                    pressedOpacity: 0.5,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}