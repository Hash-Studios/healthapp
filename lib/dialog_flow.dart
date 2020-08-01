import 'package:flutter/material.dart';

import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:google_fonts/google_fonts.dart';

import 'facts_message.dart';

class CuristAssistant extends StatefulWidget {
  CuristAssistant({Key key}) : super(key: key);

  @override
  _CuristAssistantState createState() => new _CuristAssistantState();
}

class _CuristAssistantState extends State<CuristAssistant> {
  final List<Facts> messageList = <Facts>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _queryInputWidget(BuildContext context) {
    return Card(
      color: Color(0xffffffff),
      elevation: 0,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration.collapsed(
                  hintText: "Talk to Curist Assistant",
                  hintStyle: GoogleFonts.montserrat(),
                ),
              ),
            ),
            Container(
              child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Color(0xFF76EAD7),
                  ),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void agentResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle = await AuthGoogle(
            fileJson: "assets/health-assistant-a5445-8d571f0f6b24.json")
        .build();
    Dialogflow dialogFlow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    Facts message = Facts(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title,
      name: "Flutter",
      type: false,
    );
    setState(() {
      messageList.insert(0, message);
    });
  }

  void _submitQuery(String text) {
    _textController.clear();
    Facts message = new Facts(
      text: text,
      name: "Akshay",
      type: true,
    );
    setState(() {
      messageList.insert(0, message);
    });
    agentResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff76EAD7),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Curist Assistant",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color(0xff76EAD7),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true, //To keep the latest messages at the bottom
          itemBuilder: (_, int index) => messageList[index],
          itemCount: messageList.length,
        )),
        _queryInputWidget(context),
      ]),
    );
  }
}
