import 'package:flutter/material.dart';
import '../widgets/customnavigationbar.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        bottomNavigationBar: Custombar(index: 1,)
    );
  }
}
