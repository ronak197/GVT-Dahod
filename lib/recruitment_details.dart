import 'package:flutter/material.dart';

class RecruitmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: RecruitmentPageDetails(),
    );
  }
}

class RecruitmentPageDetails extends StatefulWidget {
  @override
  _RecruitmentPageDetailsState createState() => _RecruitmentPageDetailsState();
}

class _RecruitmentPageDetailsState extends State<RecruitmentPageDetails> {
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
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/drawable-xxxhdpi/plumber_box.png"),
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
                      child: Image.asset("assets/drawable-xxxhdpi/painter_box.png"),
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
                      child: Image.asset("assets/drawable-xxxhdpi/mason_box.png"),
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
                      child: Image.asset("assets/drawable-xxxhdpi/pliers_box.png",filterQuality: FilterQuality.high,),
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
                              ),
                            ),
                          ],
                        ),
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
