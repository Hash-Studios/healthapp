import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/home.dart';
import 'package:healthapp/profile.dart';
import 'package:healthapp/main.dart' as main;

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF76EAD7),
        centerTitle: true,
        title: Text(
          "Activity",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF76EAD7),
      body: Column(
        children: <Widget>[
          TopSection(
            button: true,
          ),
          Spacer(),
          ActivityRings(),
          Spacer(),
          UserInfo(),
          Spacer(),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 3),
              Text(
                "Age",
                style: GoogleFonts.montserrat(
                  color: Color(0xFF393E46),
                  fontSize: 16,
                ),
              ),
              Spacer(flex: 1),
              Text(
                main.prefs.get("age") + " yrs",
                style: GoogleFonts.montserrat(
                    color: Color(0xFF393E46),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 3),
              Text(
                "Weight",
                style: GoogleFonts.montserrat(
                  color: Color(0xFF393E46),
                  fontSize: 16,
                ),
              ),
              Spacer(flex: 1),
              Text(
                main.prefs.get("weight") + " Kg",
                style: GoogleFonts.montserrat(
                    color: Color(0xFF393E46),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 3),
              Text(
                "Height",
                style: GoogleFonts.montserrat(
                  color: Color(0xFF393E46),
                  fontSize: 16,
                ),
              ),
              Spacer(flex: 1),
              Text(
                main.prefs.get("height") + " cm",
                style: GoogleFonts.montserrat(
                    color: Color(0xFF393E46),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 3),
              Text(
                "Pulse Rate",
                style: GoogleFonts.montserrat(
                  color: Color(0xFF393E46),
                  fontSize: 16,
                ),
              ),
              Spacer(flex: 1),
              Text(
                main.prefs.get("pulse") + " bpm",
                style: GoogleFonts.montserrat(
                    color: Color(0xFF393E46),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ],
    );
  }
}
