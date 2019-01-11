import 'package:flutter/material.dart';

class NotificationCompany extends StatefulWidget {
  @override
  _NotificationCompanyState createState() => _NotificationCompanyState();
}

class _NotificationCompanyState extends State<NotificationCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(color: Color(0xffaa9900)),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xffffF8ED85),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffaa9900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Text("Notifications for company"),
    );
  }
}
