import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/main.dart' as main;
import 'package:healthapp/profile.dart';
import 'package:hive/hive.dart';

late Box medicines;
Map? morning;
Map? evening;
Map? night;

class Medicines extends StatefulWidget {
  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  String? timeM;
  String? timeE;
  String? timeN;
  @override
  void initState() {
    medicines = Hive.box('medicines');
    morning = medicines.get('morning') ?? Map<String, String>();
    evening = medicines.get('evening') ?? Map<String, String>();
    night = medicines.get('night') ?? Map<String, String>();
    timeM = medicines.get('timeM') ??
        TimeOfDay.now()
            .toString()
            .replaceAll('TimeOfDay', "")
            .replaceAll('(', "")
            .replaceAll(')', "");
    timeE = medicines.get('timeE') ??
        TimeOfDay.now()
            .toString()
            .replaceAll('TimeOfDay', "")
            .replaceAll('(', "")
            .replaceAll(')', "");
    timeN = medicines.get('timeN') ??
        TimeOfDay.now()
            .toString()
            .replaceAll('TimeOfDay', "")
            .replaceAll('(', "")
            .replaceAll(')', "");
    super.initState();
  }

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
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => MedicinePanel());
        },
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
            morning!.length != 0
                ? Center(
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
                              GestureDetector(
                                child: Text(
                                  timeM.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                                onTap: () async {
                                  TimeOfDay? picked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: true),
                                        child: child!,
                                      );
                                    },
                                  );
                                  setState(() {
                                    timeM = picked
                                        .toString()
                                        .replaceAll('TimeOfDay', "")
                                        .replaceAll('(', "")
                                        .replaceAll(')', "");
                                    medicines.put('timeM', timeM);
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (var text in morning!.keys)
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "- $text x${morning![text]}",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20),
                                  ),
                                ),
                              // Padding(
                              //   padding: const EdgeInsets.all(4.0),
                              //   child: Text(
                              //     "- 25 mg Iscorbin x1",
                              //     style: GoogleFonts.montserrat(
                              //         fontWeight: FontWeight.w300,
                              //         fontSize: 20),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(4.0),
                              //   child: Text(
                              //     "- 15 mg IBruphen x2",
                              //     style: GoogleFonts.montserrat(
                              //         fontWeight: FontWeight.w300,
                              //         fontSize: 20),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(4.0),
                              //   child: Text(
                              //     "- 45 mg Sinarest x1",
                              //     style: GoogleFonts.montserrat(
                              //         fontWeight: FontWeight.w300,
                              //         fontSize: 20),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
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
                              GestureDetector(
                                child: Text(
                                  timeM.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                                onTap: () async {
                                  TimeOfDay? picked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: true),
                                        child: child!,
                                      );
                                    },
                                  );
                                  setState(() {
                                    timeM = picked
                                        .toString()
                                        .replaceAll('TimeOfDay', "")
                                        .replaceAll('(', "")
                                        .replaceAll(')', "");
                                    medicines.put('timeM', timeM);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            evening!.length != 0
                ? Center(
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
                              GestureDetector(
                                child: Text(
                                  timeE.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                                onTap: () async {
                                  TimeOfDay? picked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: true),
                                        child: child!,
                                      );
                                    },
                                  );
                                  setState(() {
                                    timeE = picked
                                        .toString()
                                        .replaceAll('TimeOfDay', "")
                                        .replaceAll('(', "")
                                        .replaceAll(')', "");
                                    medicines.put('timeE', timeE);
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (var text in evening!.keys)
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "- $text x${evening![text]}",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
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
                              GestureDetector(
                                child: Text(
                                  timeE.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                                onTap: () async {
                                  TimeOfDay? picked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: true),
                                        child: child!,
                                      );
                                    },
                                  );
                                  setState(() {
                                    timeE = picked
                                        .toString()
                                        .replaceAll('TimeOfDay', "")
                                        .replaceAll('(', "")
                                        .replaceAll(')', "");
                                    medicines.put('timeE', timeE);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            night!.length != 0
                ? Center(
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
                              GestureDetector(
                                child: Text(
                                  timeN.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                                onTap: () async {
                                  TimeOfDay? picked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: true),
                                        child: child!,
                                      );
                                    },
                                  );
                                  setState(() {
                                    timeN = picked
                                        .toString()
                                        .replaceAll('TimeOfDay', "")
                                        .replaceAll('(', "")
                                        .replaceAll(')', "");
                                    medicines.put('timeN', timeN);
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (var text in night!.keys)
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "- $text x${night![text]}",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
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
                              GestureDetector(
                                child: Text(
                                  timeN.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14),
                                ),
                                onTap: () async {
                                  TimeOfDay? picked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: true),
                                        child: child!,
                                      );
                                    },
                                  );
                                  setState(() {
                                    timeN = picked
                                        .toString()
                                        .replaceAll('TimeOfDay', "")
                                        .replaceAll('(', "")
                                        .replaceAll(')', "");
                                    medicines.put('timeN', timeN);
                                  });
                                },
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

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class MedicinePanel extends StatefulWidget {
  @override
  _MedicinePanelState createState() => _MedicinePanelState();
}

class _MedicinePanelState extends State<MedicinePanel> {
  Item? time;
  TextEditingController medicineName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  List<Item> users = <Item>[
    const Item(
      'Morning',
      Icon(
        Icons.wb_sunny,
        color: const Color(0xFF76EAD7),
      ),
    ),
    const Item(
      'Evening',
      Icon(
        Icons.cloud,
        color: const Color(0xFF76EAD7),
      ),
    ),
    const Item(
      'Night',
      Icon(
        Icons.brightness_3,
        color: const Color(0xFF76EAD7),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: GoogleFonts.montserrat(),
              controller: medicineName,
              autocorrect: false,
              autofocus: true,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Medicine Name",
                labelText: "Medicine Name",
                hintStyle: GoogleFonts.montserrat(),
                labelStyle: GoogleFonts.montserrat(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: GoogleFonts.montserrat(),
              controller: quantity,
              autocorrect: false,
              autofocus: true,
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Medicine Quantity",
                hintStyle: GoogleFonts.montserrat(),
                labelStyle: GoogleFonts.montserrat(),
                labelText: "Medicine Quantity",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Item>(
              hint: Text("Select item", style: GoogleFonts.montserrat()),
              value: time,
              onChanged: (Item? value) {
                setState(() {
                  time = value;
                });
              },
              items: users.map((Item user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      user.icon,
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.name,
                        style: GoogleFonts.montserrat(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF76EAD7),
              onPressed: () {
                if (medicineName.text != "" || medicineName.text != null) {
                  if (quantity.text != "" || quantity.text != null) {
                    if (time!.name != "" || time != null) {
                      if (time!.name == "Morning") {
                        morning![medicineName.text.toString()] =
                            quantity.text.toString();
                        medicines.put('morning', morning);
                      } else if (time!.name == "Evening") {
                        evening![medicineName.text.toString()] =
                            quantity.text.toString();
                        medicines.put('evening', evening);
                      } else if (time!.name == "Night") {
                        night![medicineName.text.toString()] =
                            quantity.text.toString();
                        medicines.put('night', night);
                      }
                    }
                  }
                }
                Navigator.pop(context);
              },
              child: Text("Add Medicine", style: GoogleFonts.montserrat()),
            ),
          ),
          SizedBox(height: 350),
        ],
      ),
    ));
  }
}
