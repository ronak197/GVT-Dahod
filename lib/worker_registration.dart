import 'package:flutter/material.dart';

class WorkerRegistrationPage extends StatefulWidget {
  @override
  _WorkerRegistrationPageState createState() => _WorkerRegistrationPageState();
}

class _WorkerRegistrationPageState extends State<WorkerRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gramin Vikas Trust",
          style: TextStyle(
            color: Color(0xFFAA9900)
          )
        ),
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xFFAA9900),
        ),
        backgroundColor: Color(0xFFF6F5E4),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Color(0xFFF6F5E4),
        child: ListView(
          children: <Widget>[
            TextFormField(
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
            ),
            TextFormField(
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
            ),
            TextFormField(
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
            TextFormField(
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.today,
                  color: Color(0xFFAA9900)
                ),
                hintText: "Date of Birth",
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
            SizedBox(
              height: 10.0
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFFF5E44A),
                  onPressed: (){},
                  elevation: 0.0,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Color(0xFFAA9900),
                      fontSize: 15.0
                    )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  )
                ),
              ]
            ),
          ],
        )
      )
    );
  }
}