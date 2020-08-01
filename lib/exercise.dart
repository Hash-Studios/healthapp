import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/profile.dart';
import 'package:healthapp/main.dart' as main;
import 'package:url_launcher/url_launcher.dart';

class Exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF76EAD7),
        centerTitle: true,
        title: Text(
          "Exercise",
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
          Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "Today",
                    style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: Color(0xFF393E46),
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "- 10 min Meditation",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Color(0xFF393E46),
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "- 4 km Running",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Color(0xFF393E46),
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "- 40 Pushups",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Color(0xFF393E46),
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "- 250 Jumping Jacks",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Color(0xFF393E46),
                        fontWeight: FontWeight.w300),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Spacer(
                //   flex: 1,
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(23, 0, 8, 0),
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/yoga.jpg")),
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onTap: () {
                      launch(
                          "https://www.nytimes.com/guides/well/beginner-yoga");
                    },
                  ),
                ),
                // Spacer(
                //   flex: 2,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/meditation.jpg")),
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onTap: () {
                      launch("https://www.mindful.org/how-to-meditate/");
                    },
                  ),
                ),
                // Spacer(
                //   flex: 1,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/yoga.jpg")),
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onTap: () {
                      launch(
                          "https://www.nytimes.com/guides/well/beginner-yoga");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/meditation.jpg")),
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onTap: () {
                      launch("https://www.mindful.org/how-to-meditate/");
                    },
                  ),
                ),
                // Spacer(
                //   flex: 1,
                // ),
              ],
            ),
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
                                image: AssetImage("assets/images/arms.png")),
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffeeeeee)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          "Arms",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Color(0xff393E46),
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    launch("https://www.coachmag.co.uk/fitness/arms-workouts");
                  }),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.258,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/legs.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Legs",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  launch("https://www.coachmag.co.uk/workouts/leg-workouts");
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
                              image: AssetImage("assets/images/abs.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Abs",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  launch("https://www.coachmag.co.uk/workouts/abs-workouts");
                },
              ),
            ],
          ),
          Spacer(
            flex: 1,
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
                              image: AssetImage("assets/images/chest.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Chest",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Color(0xff393E46),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  launch("https://www.coachmag.co.uk/workouts/chest-workouts");
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
                              image: AssetImage("assets/images/back.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Back",
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
                      "https://www.coachmag.co.uk/fitness/workouts/back-workouts");
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
                              image: AssetImage("assets/images/shoulders.png")),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffeeeeee)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        "Shoulders",
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
                      "https://www.coachmag.co.uk/fitness/workouts/shoulder-workouts");
                },
              ),
            ],
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
