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
                      constraints: BoxConstraints(
                        maxHeight: 50.0,
                        maxWidth: 50.0,
                        minHeight: 50.0,
                        minWidth: 50.0
                      ),
                      child: Image.asset('assets/infoIcon.jpg',fit: BoxFit.cover),
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