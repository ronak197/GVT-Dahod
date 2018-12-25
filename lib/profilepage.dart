import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},  
          ),
        ],
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Column( //Main Column
            children: <Widget>[
              Container( // Green area
                color: Colors.greenAccent,
                constraints: BoxConstraints(
                  maxHeight: 150.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.greenAccent,
                      ),
                      child: Image.asset('assets/passportphoto.png',height: 100.0, width: 100.0)
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Ramgopal Verma"),
                        Text('Mason')
                      ],
                    )

                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}