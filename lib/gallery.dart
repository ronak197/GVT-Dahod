import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                  child: FractionallySizedBox(
                    child: Container(
                      child: Text("Construction", style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image1.png"),
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver)
                        ),
                      ),
                      height: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                    ),
                    widthFactor: 0.48,
                  ),
                  tag: 'construction',
                ),
                Hero(
                  child: FractionallySizedBox(
                    child: Container(
                      child: Text("Construction", style: TextStyle(color: Colors.white, fontSize: 19.0),),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image1.png"),
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver)
                        ),
                      ),
                      height: 150.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                    ),
                    widthFactor: 0.48,
                  ),
                  tag: 'construction',
                ),
              ],
            ),
          ),
        ),
    );
  }
}