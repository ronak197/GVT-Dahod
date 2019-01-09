import 'package:flutter/material.dart';
import 'package:gvtdahod/candidateProfile.dart';

class SelfProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffF8ED85),
        title: Text(
          "Profile",
          style: TextStyle(color: Color(0xffAA9900)),
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffaa9900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xffF8ED85),
            padding: EdgeInsets.only(left: 20.0, bottom: 30.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 95.0,
                  width: 95.0,
                  margin: EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CandidateProfile.profileType == 'company'
                          ? Container(
                        child: Text(
                          CandidateProfile.companyName,
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.black54),
                        ),
                      )
                          : Container(
                        child: Text(
                          CandidateProfile.candidateName,
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.black54),
                        ),
                      ),
                      CandidateProfile.profileType == 'company'
                          ? Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          CandidateProfile.city,
                          style: TextStyle(color: Colors.black45),
                          textAlign: TextAlign.left,
                        ),
                      )
                          : Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          CandidateProfile.work,
                          style: TextStyle(color: Colors.black45),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: CandidateProfile.profileType == 'worker'
                ? Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color(0xffB7A400),
                  ),
                  title: Text(CandidateProfile.mobileNo),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Color(0xffB7A400),
                  ),
                  title: Text(CandidateProfile.gender),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Color(0xffB7A400),
                  ),
                  title: Text(CandidateProfile.address),
                ),
                ListTile(
                  leading: Icon(
                    Icons.cake,
                    color: Color(0xffB7A400),
                  ),
                  title: Text(CandidateProfile.dateOfBirth),
                ),
              ],
            )
                : Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color(0xffB7A400),
                  ),
                  title: Text(CandidateProfile.contactNo),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Color(0xffB7A400),
                  ),
                  title: Text(CandidateProfile.city),
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color(0xffB7A400),
                  ),
                  title: Text(CandidateProfile.email),
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/plumber_yellow.png",
                    scale: 6,
                  ),
                  title: Text("${CandidateProfile.nofplumber} plumbers with approx. wage ${CandidateProfile.wofplumber}"),
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/painter_yellow.png",
                    scale: 7,
                  ),
                  title: Text("${CandidateProfile.nofpainter} painters with approx. wage ${CandidateProfile.nofpainter}"),
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/mason_yellow.png",
                    scale: 5,
                  ),
                  title: Text("${CandidateProfile.nofmason} masons with approx. wage ${CandidateProfile.wofmason}"),
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/pliers_yellow.png",
                    scale: 7,
                  ),
                  title: Text("${CandidateProfile.nofbarbinder} barbinders with approx. wage ${CandidateProfile.wofbarbinder}"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
