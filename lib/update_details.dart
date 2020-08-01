import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/profile.dart';
import 'package:healthapp/main.dart' as main;

class UpdateDetails extends StatefulWidget {
  @override
  _UpdateDetailsState createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  TextEditingController ageController = TextEditingController();

  TextEditingController weightController = TextEditingController();

  TextEditingController heightController = TextEditingController();

  TextEditingController pulseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF76EAD7),
        centerTitle: true,
        title: Text(
          "Update Details",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
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
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF76EAD7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            main.prefs.put("age", ageController.text);
            main.prefs.put("weight", weightController.text);
            main.prefs.put("height", heightController.text);
            main.prefs.put("pulse", pulseController.text);
            ageController.text = "";
            weightController.text = "";
            heightController.text = "";
            pulseController.text = "";
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.check,
          color: Color(0xFF76EAD7),
        ),
      ),
      body: Column(
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
                Container(
                    width: 40,
                    child: TextField(
                      controller: ageController,
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF393E46),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      decoration:
                          InputDecoration(hintText: main.prefs.get("age")),
                    )),
                Text(
                  " yrs",
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
                Container(
                    width: 40,
                    child: TextField(
                      controller: weightController,
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF393E46),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      decoration:
                          InputDecoration(hintText: main.prefs.get("weight")),
                    )),
                Text(
                  " Kg",
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
                Container(
                    width: 40,
                    child: TextField(
                      controller: heightController,
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF393E46),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      decoration:
                          InputDecoration(hintText: main.prefs.get("height")),
                    )),
                Text(
                  " cm",
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
                Container(
                    width: 40,
                    child: TextField(
                      controller: pulseController,
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF393E46),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      decoration:
                          InputDecoration(hintText: main.prefs.get("pulse")),
                    )),
                Text(
                  " bpm",
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
      ),
    );
  }
}
