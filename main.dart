import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Flutter GSDC'),
          ),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int workshopAttendees = 2;
  bool currentUserApplied = false;
  bool isLoggedIn = false;
  String userName = "";
  List<String> attendees = ['Marko', 'Milan'];
  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_3,f_auto,g_center,h_150,q_auto:good,w_150/v1/gcs/platform-data-dsc/events/1_ilC2Aqp5sZd1wi0CopD1Hw_zT8WoJh.png'),
                    radius: 60,
                  ),
                  SizedBox(width: 0, height: 20),
                  Text(
                    'Flutter Workshop',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(width: 0, height: 20),
                  Container(
                      child: Text(
                        'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
                        textAlign: TextAlign.center,
                      ),
                      width: 350),
                  SizedBox(width: 0, height: 20),
                  Text(
                    'Attendees: ' + workshopAttendees.toString(),
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 0, height: 20),
                  ButtonTheme(
                    child: RaisedButton(
                      child: Text(
                        currentUserApplied ? 'Attending' : 'Not attending',
                        style: TextStyle(
                            color: currentUserApplied
                                ? Colors.white
                                : Colors.blue[600]),
                      ),
                      onPressed: () {
                        setState(() {
                          currentUserApplied = !currentUserApplied;
                          if (currentUserApplied) {
                            workshopAttendees++;
                            attendees.add(userName);
                          } else {
                            attendees.remove(userName);
                            workshopAttendees--;
                          }
                        });
                      },
                      color: currentUserApplied ? Colors.blue : Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: currentUserApplied
                              ? Colors.white
                              : Colors.blue[500],
                          width: 3),
                    ),
                  ),
                  Column(
                      children: attendees
                          .map(
                            (attendee) => Column(children: [
                              SizedBox(width: 0, height: 5),
                              Text(attendee),
                              SizedBox(width: 0, height: 5),
                            ]),
                          )
                          .toList())
                ],
              )
            ],
          )
        : Column(children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  setState(() {
                    isLoggedIn = true;
                  });
                }),
          ]);
  }
}
