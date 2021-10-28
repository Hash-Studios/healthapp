import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/activity.dart';
import 'package:healthapp/exercise.dart';
import 'package:healthapp/main.dart' as main;
import 'package:healthapp/medicines.dart';
import 'package:healthapp/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final Function onMenuItemClicked;
  final onMenuTap;

  const Menu(
      {Key key,
      @required this.onMenuTap,
      this.slideAnimation,
      this.menuAnimation,
      this.selectedIndex,
      @required this.onMenuItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.33,
            height: MediaQuery.of(context).size.height * 0.67,
            decoration: BoxDecoration(
              color: Color(0x80FFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 28, 10, 0),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Color(0xFF393E46),
                ),
                onPressed: onMenuTap,
              ),
            )),
        SlideTransition(
          position: slideAnimation,
          child: ScaleTransition(
            scale: menuAnimation,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(main.prefs.get('userImage')),
                            backgroundColor: Colors.grey[200],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  main.prefs.get('username'),
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF393E46),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  '${main.prefs.get('age')} years',
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF393E46),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        onMenuTap();
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Profile()));
                      },
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.local_hospital,
                              color: Color(0xFF393E46),
                            ),
                          ),
                          Text(
                            "Medicines",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF393E46),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        onMenuTap();
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Medicines()));
                      },
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.assistant,
                              color: Color(0xFF393E46),
                            ),
                          ),
                          Text(
                            "Assistant",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF393E46),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        onMenuTap();
                        // Navigator.push(
                        //     context,
                        //     CupertinoPageRoute(
                        //         builder: (context) => CuristAssistant()));
                      },
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.fitness_center,
                              color: Color(0xFF393E46),
                            ),
                          ),
                          Text(
                            "Exercises",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF393E46),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        onMenuTap();
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Exercise()));
                      },
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.directions_run,
                              color: Color(0xFF393E46),
                            ),
                          ),
                          Text(
                            "Activity",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF393E46),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        onMenuTap();
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Activity()));
                      },
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.bug_report,
                              color: Color(0xFF393E46),
                            ),
                          ),
                          Text(
                            "COVID-19",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF393E46),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        onMenuTap();
                        launch(
                            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports");
                      },
                    ),
                    Spacer(flex: 2),
                    SizedBox(
                      height: 1,
                      width: 200,
                      child: Container(
                        color: Color(0x54393E46),
                      ),
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.settings,
                              color: Color(0xFF393E46),
                            ),
                          ),
                          Text(
                            "Settings",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF393E46),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        onMenuTap();
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Profile()));
                      },
                    ),
                    Spacer(flex: 2),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.help,
                              color: Color(0xFF393E46),
                            ),
                          ),
                          Text(
                            "Help",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.montserrat(
                              color: Color(0xFF393E46),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        onMenuTap();
                        launch("tel:102");
                      },
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
