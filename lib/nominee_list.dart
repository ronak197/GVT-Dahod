import 'package:flutter/material.dart';
import 'package:gvtdahod/profilepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gvtdahod/candidateProfile.dart';

class NomineeList extends StatefulWidget {
  @override
  _NomineeListState createState() => _NomineeListState();
}

class WorkerDetails {
  String fullName;
  String dateOfBirth;
  String address;
  String mobileNo;
  String gender;
  String work;
  String caste;
}

class CompanyDetails{

  String companyName;
  String city;
  String email;
  String contactNo;
  int nofbarbinder;
  int nofmason;
  int wofmason;
  int nofpainter;
  int wofpainter;
  int nofplumber;
  int wofplumber;
  int wofbarbinder;

}

class _NomineeListState extends State<NomineeList> {

  List<WorkerDetails> workerList = [];
  List<CompanyDetails> companyList;

  Future<void> fetchWorkerList() async {

    WorkerDetails details = new WorkerDetails();

    List<WorkerDetails> workerList;

    details.fullName = "Ronak Jain";
    details.mobileNo = "98742332";
    details.dateOfBirth = "adakfnanf";
    details.caste = "st";
    details.work = "plumber";
    details.address = "adsdasda";
    details.gender = "male";

    CollectionReference collectionReference = Firestore.instance.collection("workers");

//    collectionReference.getDocuments().then((dataSnapshots){
//      print(dataSnapshots);
//      for(int i=0; i< dataSnapshots.documents.length; i+=1){
//        WorkerDetails workerDetails = new WorkerDetails();
//        workerDetails.caste = dataSnapshots.documents[i].data['caste'];
//        workerDetails.fullName = dataSnapshots.documents[i].data['full name'];
//        workerDetails.mobileNo = dataSnapshots.documents[i].data['mobile no.'];
//        workerDetails.gender = dataSnapshots.documents[i].data['gender'];
//        workerDetails.work = dataSnapshots.documents[i].data['work'];
//        workerDetails.address = dataSnapshots.documents[i].data['address'];
//        workerDetails.dateOfBirth = dataSnapshots.documents[i].data['date of birth'];
//        workerList.add(workerDetails);
//      }
//    });

    workerList.insert(0,details);
    print(workerList[0].gender);
  }

  Future<void> fetchCompaniesList() async {

    CollectionReference collectionReference = Firestore.instance.collection("contracter");

    await collectionReference.getDocuments().then((dataSnapshots){
      for(int i=0; i<= dataSnapshots.documents.length; i+=1){
        CompanyDetails companyDetails;
        companyDetails.companyName = dataSnapshots.documents[i].data['company name'];
        companyDetails.city = dataSnapshots.documents[i].data['city'];
        companyDetails.email = dataSnapshots.documents[i].data['email'];
        companyDetails.contactNo = dataSnapshots.documents[i].data['contact no'];
        companyDetails.nofpainter = dataSnapshots.documents[i].data['nofpainter'];
        companyDetails.nofmason = dataSnapshots.documents[i].data['nofmason'];
        companyDetails.nofbarbinder = dataSnapshots.documents[i].data['nofbarbinder'];
        companyDetails.nofplumber = dataSnapshots.documents[i].data['nofplumber'];
        companyDetails.wofpainter = dataSnapshots.documents[i].data['wofpainter'];
        companyDetails.wofmason = dataSnapshots.documents[i].data['wofmason'];
        companyDetails.wofbarbinder = dataSnapshots.documents[i].data['wofbarbinder'];
        companyDetails.wofplumber = dataSnapshots.documents[i].data['wofplumber'];

        companyList.add(companyDetails);
      }
    });

  }

  @override
  void initState() {
    if(CandidateProfile.profileType == 'worker'){
      fetchWorkerList();
    } else if(CandidateProfile.profileType == 'company'){
      fetchCompaniesList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffaa9900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Workers List", style: TextStyle(color: Color(0xffAA9900)),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: FutureBuilder(
            future: fetchWorkerList(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (!snapshot.hasData)
                return new Container();
              return new ListView.builder(
                itemCount: workerList.length,
                itemBuilder: (BuildContext context, int index) {
                  return NomineeContainer(workerDetails: workerList[0],);
                },
              );
            }
        ),
      ),
    );
  }
}

class NomineeContainer extends StatelessWidget {

  final WorkerDetails workerDetails;

  NomineeContainer({this.workerDetails});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
        padding: EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
        decoration: BoxDecoration(
            color: Color(0xffF8ED85),
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 70.0,
              width: 70.0,
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
                    child: Text(workerDetails.fullName, style: TextStyle(fontSize: 18.0, color: Colors.black54),),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:5.0),
                    child: Text(workerDetails.mobileNo, style: TextStyle(color: Colors.black45), textAlign: TextAlign.left,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


