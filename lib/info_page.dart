import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffF8ED85),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffaa9900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Get Information", style: TextStyle(color: Color(0xffaa9900)),),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text("Gramin Vikas Trust", textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0),),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "The trainees qualifications and the evidence of bringing together: -",
                            style: TextStyle(color: Colors.black87, fontSize: 18.0)
                          ),
                          TextSpan(
                            text: "\n\n• Must be at least standard 5 pass"
                                "\n• Must be Scheduled Tribes (ST)"
                                "\n• The age limit will be 18 to 32 years"
                                "\n• Copy of School Living Certificate"
                                "\n• Caste pattern"
                                "\n• Copy of election, card ration card"
                                "\n• 3 photos of passport size"
                                "\n• Copy of the support card"
                                "\n• Copy of bank passbook",
                            style: TextStyle(fontSize: 16.0, height: 2.0, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Privileges during the training period",
                              style: TextStyle(color: Colors.black87, fontSize: 18.0)
                          ),
                          TextSpan(
                            text: "\n\n• Free accommodation will be available (hostel entertainment facilities are available)"
                                "\n• Provide tea, snacks and meals free"
                                "\n• Trainees will be given stipend (80% attendance required)"
                                "\n• Modules, stationery, identity cards, etc. will be given"
                                "\n• After the completion of the training, the trade-related equipment kit will be given"
                                "\n• The Government of India recognized certified NCVT certificate and will be employed for passing trainees"
                                "\n• Training Fee: Free for Scheduled Tribes (ST) for 12,000 people for free (free) other castes. Fees will be charged",
                            style: TextStyle(fontSize: 16.0, height: 2.0, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
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
