import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gvtdahod/main.dart';

class CompanyRegistrationPage extends StatefulWidget {
  @override
  _CompanyRegistrationPageState createState() => _CompanyRegistrationPageState();
}

enum confirmationAnswer{YES, NO}

class _CompanyRegistrationPageState extends State<CompanyRegistrationPage> {

  final formKey = new GlobalKey<FormState>();

  static final DocumentReference documentReference = Firestore.instance.document("admin/company registration/company profiles/$companyName");

  static String companyName;
  static String city;
  static String email;
  static String contactNo;
  static String username;
  static String password;

  bool _obscureText = true;

  void toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      askForConfirmation();
    }
  }

  Future<void> performRegistration() async {
    Map<String,String> registrationProfile = <String,String>{
      "company name" : companyName,
      "city" : city,
      "email id" : email,
      "contact no" : contactNo,
      "username" : username,
      "password" : password
    };
    await documentReference.setData(registrationProfile).whenComplete((){
      print("Document Added");
    }).catchError((e) => print(e));
  }

  Future<Null> dialogAfterSuccess() async {
    switch(
    await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            title: Text(
              "Successfully Registered. You can login into your account once we verify you.",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  color: Color(0xFFaa9900)
              ),
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SimpleDialogOption(
                      onPressed: (){
                        Navigator.pop(context, confirmationAnswer.YES);
                      },
                      child: Text("Okay")
                  ),
                ],
              )
            ],
          );
        }
    )
    ){
      case confirmationAnswer.YES:
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()
            ),
                (Route<dynamic> route) => false
        );
        break;
    }
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
            title: Text(
              "Do you want to proceed?",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  color: Color(0xFFaa9900)
              ),
            ),
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
                      child: Text("No")
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
        dialogAfterSuccess();
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
                        "Registering, Please Wait..",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Color(0xFFaa9900)
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Gramin Vikas Trust",
          style: TextStyle(
            color: Color(0xFFAA9900)
          )
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffaa9900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFFF6F5E4),
        
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Color(0xFFF6F5E4),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  onSaved: (val) => companyName = val,
                  validator: (val) => val.length <= 4 ? 'Too Short' : null,
                  style: TextStyle(
                    color: Color(0xFFAA9900),
                  ),
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.people,
                      color: Color(0xFFAA9900)
                    ),
                    hintText: "Company Name",
                    hintStyle: TextStyle(
                      color: Color(0xFFAA9900)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFAA9900)
                      )
                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  onSaved: (val) => username = val,
                  validator: (val) => val.length <= 4 ? 'Too Short' : null,
                  style: TextStyle(
                    color: Color(0xFFAA9900),
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFFAA9900)
                      ),
                      hintText: "Username",
                      hintStyle: TextStyle(
                          color: Color(0xFFAA9900)
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFAA9900)
                          )
                      )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5.0, right: 10.0,  left: 10.0),
                child: TextFormField(
                  onSaved: (val) => city = val,
                  validator: (val) => val.length <= 2 ? 'Too Short' : null,
                  style: TextStyle(
                    color: Color(0xFFAA9900),
                  ),
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Color(0xFFAA9900)
                    ),
                    hintText: "City",
                    hintStyle: TextStyle(
                      color: Color(0xFFAA9900)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFAA9900)
                      )
                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  onSaved: (val) => email = val,
                  validator: (val) => val.length <= 5 ? 'Invalid' : null,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Color(0xFFAA9900),
                  ),
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color(0xFFAA9900)
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Color(0xFFAA9900)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFAA9900)
                      )
                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5.0, right: 10.0, left: 10.0),
                child: TextFormField(
                  onSaved: (val) => contactNo = val,
                  validator: (val) => val.length <= 2 ? 'Invalid' : null,
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
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  onSaved: (val) => password = val,
                  validator: (val) => val.length <= 8 ? 'Password should contain min eight characters' : null,
                  obscureText: _obscureText,
                  style: TextStyle(
                    color: Color(0xFFAA9900),
                  ),
                  decoration: new InputDecoration(
                    suffixIcon: IconButton(icon: Icon(Icons.lock, color: Color(0xFFAA9900),), onPressed: toggle),
                    prefixIcon: Icon(
                        Icons.security,
                        color: Color(0xFFAA9900)
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Color(0xFFAA9900)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFAA9900)
                        )
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 10.0
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0xFFF5E44A),
                    onPressed: _submit,
                    elevation: 0.0,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Color(0xFFAA9900),
                        fontSize: 15.0,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                  ),
                ]
              ),
            ],
          ),
        )
      )
    );
  }
}