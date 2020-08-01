import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
