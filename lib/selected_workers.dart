import 'package:flutter/material.dart';
import 'package:gvtdahod/profilepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gvtdahod/candidateProfile.dart';
import 'package:gvtdahod/worker_company_details.dart';

class SelectedWorkers extends StatefulWidget {

  String typeOfWorker;

  SelectedWorkers({this.typeOfWorker});

  @override
  _SelectedWorkersState createState() => _SelectedWorkersState(typeOfWorker: typeOfWorker);
}

class _SelectedWorkersState extends State<SelectedWorkers> {

  String typeOfWorker;

  _SelectedWorkersState({this.typeOfWorker});

  List<WorkerDetails> selectedWorkerList = new List<WorkerDetails>();

  Future<WorkerDetails> fetchWorkerList(String mobileNo, WorkerDetails workerDetails) async {
    DocumentReference documentReference = Firestore.instance.document("workers/$mobileNo");

    await documentReference.get().then((dataSnapshot){
      setState(() {
        if(dataSnapshot.exists){
          workerDetails.caste = dataSnapshot.data['caste'];
          workerDetails.fullName = dataSnapshot.data['full name'];
          workerDetails.mobileNo = dataSnapshot.data['mobile no.'];
          workerDetails.gender = dataSnapshot.data['gender'];
          workerDetails.work = dataSnapshot.data['work'];
          workerDetails.address = dataSnapshot.data['address'];
          workerDetails.dateOfBirth = dataSnapshot.data['date of birth'];
          workerDetails.isSelected = true;
        }
      });
      if(workerDetails.work == typeOfWorker){
        selectedWorkerList.add(workerDetails);
      }
    });

    return workerDetails;
  }
  
  Future<List> fetchSelectedWorkerList() async {

    CollectionReference collectionReference = Firestore.instance.collection("contracter").document("${CandidateProfile.companyName}").collection("workers selected");

    await collectionReference.getDocuments().then((dataSnapshots) {
      for (int i = 0; i < dataSnapshots.documents.length ; i += 1) {
        if(dataSnapshots.documents[i].data['selected'] == true){
          WorkerDetails workerDetails = new WorkerDetails();
            fetchWorkerList(dataSnapshots.documents[i].documentID, workerDetails);
        }
      }
    });

    return selectedWorkerList;
  }


  @override
  void initState() {
    if(CandidateProfile.profileType == 'company'){
      selectedWorkerList = [];
      fetchSelectedWorkerList();
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
        title: CandidateProfile.profileType == 'company' ?
        Text("Selected Workers List", style: TextStyle(color: Color(0xffAA9900)),) :
        Text("Selected Company List", style: TextStyle(color: Color(0xffAA9900)),),
        backgroundColor: Colors.white,
      ),
      body: Container(
          child: ListView.builder(
            itemCount: CandidateProfile.profileType == 'company' ? selectedWorkerList.length : null,
            itemBuilder: (BuildContext context, int index) {
              if(CandidateProfile.profileType == 'company') {
                return NomineeContainer(workerDetails: selectedWorkerList[index],);
              }
            },
          )
      ),
    );
  }
}

class NomineeContainer extends StatelessWidget {

  WorkerDetails workerDetails = new WorkerDetails();

  NomineeContainer({this.workerDetails});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(workerDetails: workerDetails,)));
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
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(workerDetails.fullName, style: TextStyle(fontSize: 18.0, color: Colors.black54),),
                      ),
                      workerDetails.isSelected == true ?
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.check_circle, size: 18.0,  color: Color(0xffaa9900),),
                      ) :
                      SizedBox(
                        height: 0.0,
                        width: 0.0,
                      ),
                    ]
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