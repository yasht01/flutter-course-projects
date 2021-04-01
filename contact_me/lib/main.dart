import 'package:flutter/material.dart';

void main() {
  runApp(ContactPage());
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Me',
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade400,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 10,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 10,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 10,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/yash.jpeg"),
                      radius: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Hey 👋 I am Yash Tiwari',
                      style: TextStyle(
                        fontFamily: 'PTSansNarrow',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      title: Text('+91 12345 67890'),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.red,
                      ),
                      title: Text('yasht01@email.com'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
