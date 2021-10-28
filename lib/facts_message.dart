import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/main.dart' as main;

class Facts extends StatelessWidget {
  Facts({this.text, this.name, this.type});

  final String? text;
  final String? name;
  final bool? type;

  List<Widget> botMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/curist.png'),
          backgroundColor: Colors.white,
          radius: 11,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Text(this.name,
//                style: TextStyle(fontWeight: FontWeight.bold)),
            Card(
                color: Colors.white.withOpacity(0.6),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                  child: Text(
                    text!,
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF393E46),
                    ),
                  ),
                )),
          ],
        ),
      ),
    ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // Text(this.name, style: Theme.of(context).textTheme.subhead),
            Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                  child: Text(
                    text!,
                    style: GoogleFonts.montserrat(color: Color(0xFF393E46)),
                  ),
                )),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: CircleAvatar(
          child: new Text(
            main.prefs.get('username')[0],
            style: GoogleFonts.montserrat(
              color: Color(0xFF76EAD7),
            ),
          ),
          backgroundColor: Colors.white,
          radius: 11,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type! ? userMessage(context) : botMessage(context),
      ),
    );
  }
}
