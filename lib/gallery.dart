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
        ),
        body: Table(
          children: [
            TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset('assets/image1.png',scale: 2, fit: BoxFit.fill,)),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset('assets/image2.png',scale: 2, fit: BoxFit.fill,))
                  ],
                ),
              ),
            ]),
            TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset('assets/image3.png',scale: 2, fit: BoxFit.fill,)),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset('assets/image4.png',scale: 2, fit: BoxFit.fill,))
                  ],
                ),
              ),
            ]),
            TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset('assets/image5.png',scale: 2, fit: BoxFit.fill,)),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset('assets/image6.png',scale: 2, fit: BoxFit.fill,))
                  ],
                ),
              ),
            ]),
          ],
        )
    );
  }
}