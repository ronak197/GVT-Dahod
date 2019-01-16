import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class PhotoGalleryPage extends StatefulWidget {

  final String folderName;

  PhotoGalleryPage({this.folderName});

  @override
  PhotoGalleryPageState createState() {
    return new PhotoGalleryPageState(folderName: folderName);
  }
}

class PhotoGalleryPageState extends State<PhotoGalleryPage> {

  PhotoGalleryPageState({this.folderName});

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String folderName;
  List<String> photoImageUrls = new List<String>();
  FirebaseApp app;
  FirebaseStorage storage;
  bool imageUrlsFetched = false;

  Future<void> runGallery() async {

    app = await FirebaseApp.configure(
      name: 'gvt-dahod',
      options: FirebaseOptions(
        googleAppID: '1:930494475156:android:a0b17940cb01ac02',
        gcmSenderID: '930494475156',
        apiKey: 'AIzaSyAV6x7tH3l3xwSS1c1cMaBU-6WBWsb7LZs',
        projectID: 'gvt-dahod',
      ),
    );

    storage = FirebaseStorage(
        app: app,
        storageBucket: 'gs://gvt-dahod.appspot.com'
    );

    await fetchImageUrls();
  }

  Future<void> fetchImageUrls() async {
    for(int i=1; i<2; i+=1){
      StorageReference ref = storage.ref().child(folderName).child('$folderName ($i).jpg');

      String url = (await ref.getDownloadURL()).toString();

      setState(() {
        photoImageUrls.add(url);
      });
    }
  }

  Widget showLoading(BuildContext context)  {

    return Center(
      child: AlertDialog(
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
                    "Loading ...",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Color(0xFF5B69778)
                    ),
                  )
                ],
              )
          )
      ),
    );
  }

  @override
  void initState() {
    photoImageUrls = [];
    runGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffF8ED85),
        title: Text('Gallery', style: TextStyle(color: Color(0xffAA9900)),),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffaa9900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: imageUrlsFetched ? Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 7.0,
            spacing: 7.0,
            children: <Widget>[
              Hero(
                child: Wrap(
                  children: <Widget>[
                    Image.network(photoImageUrls[0]),
                  ],
                ),
                tag: folderName,
              ),
            ],
          ),
        ),
      ) :
      showLoading(context),
    );
  }
}