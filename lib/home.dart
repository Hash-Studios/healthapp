import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/activity.dart';
import 'package:healthapp/dialog_flow.dart';
import 'package:healthapp/exercise.dart';
import 'package:healthapp/main.dart' as main;
import 'package:healthapp/medicines.dart';
import 'package:healthapp/profile.dart';
import 'package:pedometer/pedometer.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final onMenuTap;
  Home({this.onMenuTap});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF76EAD7),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: widget.onMenuTap,
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => Profile()));
            },
            child: Hero(
              tag: "User",
              child: Container(
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(main.prefs.get('userImage')),
                  backgroundColor: Colors.grey[200],
                  // radius: 12,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF76EAD7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text(
                  "Sun, 2 Aug",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          ActivityRings(),
          Spacer(
            flex: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.258,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/2.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Medicines",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Medicines()));
                },
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.258,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/3.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Assistant",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => CuristAssistant()));
                },
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.258,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/4.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Exercises",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Exercise()));
                },
              ),
            ],
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.258,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/5.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Activity",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Activity()));
                },
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.258,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/6.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Contact",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  launch("tel:102");
                },
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.258,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/1.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "COVID-19",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  launch(
                      "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports");
                },
              ),
            ],
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class ActivityRings extends StatefulWidget {
  const ActivityRings({
    Key key,
  }) : super(key: key);

  @override
  _ActivityRingsState createState() => _ActivityRingsState();
}

class _ActivityRingsState extends State<ActivityRings> {
  Pedometer _pedometer;
  StreamSubscription<int> _subscription;
  int stepsToday = int.parse(main.prefs.get("stepsToday"));
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }

  Future<void> initPlatformState() async {
    startListening();
  }

  void onData(int stepCountValue) {
    print(stepCountValue);
  }

  void startListening() {
    _pedometer = new Pedometer();
    _subscription = _pedometer.pedometerStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void stopListening() {
    _subscription.cancel();
  }

  void _onData(int stepCountValue) async {
    setState(() {
      stepsToday = stepCountValue;
      main.prefs.put("stepsToday", "$stepCountValue");
      main.prefs.put("calToday", "${stepCountValue / 3}");
    });
  }

  void _onDone() => print("Finished pedometer tracking");

  void _onError(error) => print("Flutter Pedometer Error: $error");
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              strokeWidth: 16,
              value: stepsToday / 5000,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC4FB6D)),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              strokeWidth: 16,
              value: stepsToday / 6000,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEDFFD1)),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    decoration: BoxDecoration(
                        color: Color(0xFFC4FB6D),
                        borderRadius: BorderRadius.all(Radius.circular(500))),
                    child: Text(
                      "STEPS",
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF393E46),
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "$stepsToday",
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF393E46),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    decoration: BoxDecoration(
                        color: Color(0xFFEDFFD1),
                        borderRadius: BorderRadius.all(Radius.circular(500))),
                    child: Text(
                      "CALORIES",
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF393E46),
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "${(stepsToday / 3).round()} CAL",
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF393E46),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
