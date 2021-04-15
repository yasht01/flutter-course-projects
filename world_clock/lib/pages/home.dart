import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.green),),
                  onPressed: () async {
                    dynamic newData =
                        await Navigator.pushNamed(context, '/choose_location');
                    setState(() {
                      data = {
                        'url': newData['url'],
                        'time': newData['time'],
                        'location': newData['location'],
                        'flag': newData['flag'],
                        'isDaytime': newData['isDaytime'],
                      };
                    });
                  },
                  icon: Icon(Icons.map_rounded),
                  label: Text("Choose location"),
                ),
                SizedBox(
                  height: 30.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/${data['flag']}"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
