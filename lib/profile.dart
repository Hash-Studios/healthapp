import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/main.dart' as main;
import 'package:healthapp/update_details.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF76EAD7),
        centerTitle: true,
        title: Text(
          main.prefs.get("username"),
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
            button: false,
          ),
          Spacer(flex: 1),
          ListButton(
            text: "Personal Details",
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => UpdateDetails()));
            },
          ),
          ListButton(
            text: "Notifications",
            onTap: () {},
          ),
          ListButton(
            text: "Account Settings",
            onTap: () {},
          ),
          ListButton(
            text: "Support",
            onTap: () {},
          ),
          ListButton(
            text: "Terms & Conditions",
            onTap: () {},
          ),
          ListButton(
            text: "Privacy Policy",
            onTap: () {},
          ),
          ListButton(
            text: "Logout",
            onTap: () {},
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }
}

class ListButton extends StatelessWidget {
  final String? text;
  final Function? onTap;
  const ListButton({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        color: Color(0xFFEEEEEE),
        child: ListTile(
          onTap: onTap as void Function()?,
          trailing:
              IconButton(icon: Icon(Icons.chevron_right), onPressed: onTap as void Function()?),
          title: Text(
            text!,
            style: GoogleFonts.montserrat(
              color: Color(0xFF393E46),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final bool button;
  TopSection({
    Key? key,
    required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(
          flex: 2,
        ),
        GestureDetector(
          child: Hero(
            tag: "User",
            child: Container(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(main.prefs.get('userImage')),
                backgroundColor: Colors.grey[200],
                radius: 50,
              ),
            ),
          ),
          onTap: button
              ? () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Profile()));
                }
              : null,
        ),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                main.prefs.get("stepsTotal"),
                style: GoogleFonts.montserrat(
                    color: Color(0xFF393E46),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "STEPS",
                style: GoogleFonts.montserrat(
                  color: Color(0xFF393E46),
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              main.prefs.get("calTotal"),
              style: GoogleFonts.montserrat(
                  color: Color(0xFF393E46),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "CALORIES",
              style: GoogleFonts.montserrat(
                color: Color(0xFF393E46),
                fontSize: 15,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                main.prefs.get("blood"),
                style: GoogleFonts.montserrat(
                    color: Color(0xFF393E46),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "BLOOD",
                style: GoogleFonts.montserrat(
                  color: Color(0xFF393E46),
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
