import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthapp/home.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Box prefs;
Directory dir;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getApplicationDocumentsDirectory().then(
    (dir) async {
      Hive.init(dir.path);
      prefs = await Hive.openBox('prefs');
      prefs.put('username', 'Abhay Maurya');
      prefs.put('userImage',
          'https://images.unsplash.com/photo-1593229874334-90d965f27c42?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=min-hius-r-ii4jKDL6Y-unsplash.jpg&w=1920');
      prefs.put('age', '20');
      prefs.put('weight', '85');
      prefs.put('height', '181');
      prefs.put('blood', 'O+');
      prefs.put('pulse', '75');
      prefs.put('stepsTotal', '58456');
      prefs.put('stepsToday', '2546');
      prefs.put('calTotal', '38456');
      prefs.put('calToday', '783');
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then(
        (value) => {
          runApp(
            MyApp(),
          ),
        },
      );
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
