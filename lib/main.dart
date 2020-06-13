import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App Issue Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Chat App Issue Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textEditingController = TextEditingController();
  List<String> messages = ['Example message'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /// An expanded list of messages
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(50),
              physics: const AlwaysScrollableScrollPhysics(
                parent: const BouncingScrollPhysics(),
              ),
              itemCount: messages.length,
              itemBuilder: (context, index) => Center(
                child: Text(
                  messages[index],
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ),

          /// The text input field
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: 'Enter a message...',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    messages.add(textEditingController.text);
                    textEditingController.text = '';
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
