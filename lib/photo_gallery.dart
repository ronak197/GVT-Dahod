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

  Future<void> runGallery() async {
    try{

      final FirebaseApp app = await FirebaseApp.configure(
        name: 'gvt-dahod',
        options: FirebaseOptions(
          googleAppID: '1:930494475156:android:a0b17940cb01ac02',
          gcmSenderID: '930494475156',
          apiKey: 'AIzaSyAV6x7tH3l3xwSS1c1cMaBU-6WBWsb7LZs',
          projectID: 'gvt-dahod',
        ),
      );
      final FirebaseStorage storage = FirebaseStorage(
          app: app,
          storageBucket: 'gs://gvt-dahod.appspot.com'
      );

      for(int i=1; i<2; i+=1){
        StorageReference ref = storage.ref().child(folderName).child('$folderName ($i).jpg');

        String url = (await ref.getDownloadURL()).toString();

        photoImageUrls.add(url);
      }
    }catch(e){
      print(e);
    }
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
      body: Container(
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
      ),
    );
  }
}