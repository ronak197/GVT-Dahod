import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:gvtdahod/photo_gallery.dart';


class GalleryPage extends StatefulWidget {

  @override
  GalleryPageState createState() {
    return new GalleryPageState();
  }
}

class GalleryPageState extends State<GalleryPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<String> coverImageUrls = new List<String>();

  Future<void> runGallery() async {
  try {
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

    StorageReference ref0 = storage.ref().child('mason').child(
        'mason_cover.jpg');
    StorageReference ref1 = storage.ref().child('plumber').child(
        'plumber_cover.jpg');
    StorageReference ref2 = storage.ref().child('painter').child(
        'painter_cover.jpg');
    StorageReference ref3 = storage.ref().child('barbinder').child(
        'barbinder_cover.jpg');

    String url0 = (await ref0.getDownloadURL()).toString();
    String url1 = (await ref1.getDownloadURL()).toString();
    String url2 = (await ref2.getDownloadURL()).toString();
    String url3 = (await ref3.getDownloadURL()).toString();

    setState(() {
      coverImageUrls.add(url0);
      coverImageUrls.add(url1);
      coverImageUrls.add(url2);
      coverImageUrls.add(url3);
    });
  } catch(e){
    print(e);
  }
  }

  @override
  void initState() {
    coverImageUrls = [];
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
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoGalleryPage(folderName: 'plumber',)));
                  },
                  child: FractionallySizedBox(
                    child: Container(
                      child: Text("Plumber",
                        style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(coverImageUrls[0]),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.srcOver)
                        ),
                      ),
                      height: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                    ),
                    widthFactor: 0.48,
                  ),
                ),
                tag: 'plumber',
              ),
              Hero(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoGalleryPage(folderName: 'painter',)));
                  },
                  child: FractionallySizedBox(
                    child: Container(
                      child: Text("Painter",
                        style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(coverImageUrls[1]),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.srcOver)
                        ),
                      ),
                      height: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                    ),
                    widthFactor: 0.48,
                  ),
                ),
                tag: 'painter',
              ),
              Hero(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoGalleryPage(folderName: 'mason',)));
                  },
                  child: FractionallySizedBox(
                    child: Container(
                      child: Text("Mason",
                        style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(coverImageUrls[2]),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.srcOver)
                        ),
                      ),
                      height: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                    ),
                    widthFactor: 0.48,
                  ),
                ),
                tag: 'mason',
              ),
              Hero(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoGalleryPage(folderName: 'barbinder',)));
                  },
                  child: FractionallySizedBox(
                    child: Container(
                      child: Text("Barbinder",
                        style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(coverImageUrls[3]),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.srcOver)
                        ),
                      ),
                      height: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                    ),
                    widthFactor: 0.48,
                  ),
                ),
                tag: 'barbinder',
              ),
            ],
          ),
        ),
      ),
    );
  }
}