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

  FirebaseApp app;
  FirebaseStorage storage;

  bool imagesFetched = false;

  Future<void> runGallery() async {
  try {
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

    await getImages();

  } catch(e){
    print(e);
  }
  }

  Future<void> getImages() async {
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
      imagesFetched = true;
    });
  }

  @override
  void initState(){
    coverImageUrls = [];
    runGallery();
    super.initState();
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
      body: imagesFetched ? Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 7.0,
            spacing: 7.0,
            children: <Widget>[
              folderBox(context,'Plumber',coverImageUrls[0]),
              folderBox(context,'Painter',coverImageUrls[1]),
              folderBox(context,'Mason',coverImageUrls[2]),
              folderBox(context,'Barbinder',coverImageUrls[3]),
            ]
          ),
        ),
      ) :
      showLoading(context),
    );
  }
}

Widget folderBox(BuildContext context,String folderName, String imageUrl){
  return Hero(
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoGalleryPage(folderName: folderName,)));
      },
      child: FractionallySizedBox(
        child: Container(
          child: Text(folderName,
            style: TextStyle(color: Colors.white, fontSize: 19.0),),
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
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
    tag: folderName,
  );
}