import 'package:flutter/material.dart';
import 'nominee_list.dart';

class ProfilePage extends StatelessWidget {

  WorkerDetails workerDetails = new WorkerDetails();
  CompanyDetails companyDetails = new CompanyDetails();
  bool isWorker;

  ProfilePage({this.workerDetails,this.companyDetails, this.isWorker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffF8ED85),
        title: Text("Profile", style: TextStyle(color: Color(0xffAA9900)),),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xffB7A400),
        elevation: 0.0,
        child: Icon(Icons.edit),
        foregroundColor: Colors.white,
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
                      Container(
                        child: Text(workerDetails.fullName, style: TextStyle(fontSize: 20.0, color: Colors.black54),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top:5.0),
                        child: Text(workerDetails.work, style: TextStyle(color: Colors.black45), textAlign: TextAlign.left,),
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
            child:
            isWorker == true?
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.phone, color: Color(0xffB7A400),),
                  title: Text(workerDetails.mobileNo),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Color(0xffB7A400),),
                  title: Text(workerDetails.gender),
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: Color(0xffB7A400),),
                  title: Text(workerDetails.address),
                ),
                ListTile(
                  leading: Icon(Icons.cake, color: Color(0xffB7A400),),
                  title: Text(workerDetails.dateOfBirth),
                ),
              ],
            ) :
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.phone, color: Color(0xffB7A400),),
                  title: Text(companyDetails.contactNo),
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: Color(0xffB7A400),),
                  title: Text(companyDetails.city),
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Color(0xffB7A400),),
                  title: Text(companyDetails.email),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}