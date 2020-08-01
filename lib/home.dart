import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF76EAD7),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/curist.png'),
              backgroundColor: Colors.grey[200],
              // radius: 12,
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
                  "Sat, 1 Aug",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 16,
                    value: 0.8,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFC4FB6D)),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 16,
                    value: 0.5,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFEDFFD1)),
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
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Color(0xFFC4FB6D),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(500))),
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
                            "2546",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF393E46),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDFFD1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(500))),
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
                            "783 CAL",
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
          ),
        ],
      ),
    );
  }
}
