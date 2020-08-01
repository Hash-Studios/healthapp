import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/main.dart' as main;
import 'package:healthapp/profile.dart';

class Medicines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF76EAD7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF76EAD7),
        centerTitle: true,
        title: Text(
          "Medicines",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Color(0xFF76EAD7),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffeeeeee),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Morning",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        Text(
                          "7:30 am",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 15 mg Metrozil x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 25 mg Iscorbin x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 15 mg IBruphen x2",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 45 mg Sinarest x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffeeeeee),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Evening",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        Text(
                          "5:30 pm",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 15 mg Metrozil x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 25 mg Iscorbin x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 15 mg IBruphen x2",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 45 mg Sinarest x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffeeeeee),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Night",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        Text(
                          "9:00 pm",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 15 mg Metrozil x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 25 mg Iscorbin x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 15 mg IBruphen x2",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "- 45 mg Sinarest x1",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
