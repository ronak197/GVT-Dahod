import 'package:flutter/material.dart';

class NotificationWorker extends StatefulWidget {
  @override
  _NotificationWorkerState createState() => _NotificationWorkerState();
}

class _NotificationWorkerState extends State<NotificationWorker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffF8ED85),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Text("Notifications for worker"),
    );
  }
}
