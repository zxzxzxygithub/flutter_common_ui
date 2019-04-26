import 'package:flutter/material.dart';

class ClipOvalTest extends StatefulWidget {
  @override
  _ClipOvalTestState createState() => _ClipOvalTestState();
}

class _ClipOvalTestState extends State<ClipOvalTest> {
  @override
  Widget build(BuildContext context) {
    var text = Text(
      'wo shi text',
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
    var borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12), topRight: Radius.circular(12));
    var border = Border(
        top: BorderSide(color: Colors.green, width: 3),
      );
    var container = new Container(
      width: 172.0,
      height: 72.0,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.rectangle,
        borderRadius: borderRadius,
        border: border,
      ),
    );
    var stack = Stack(
      alignment: Alignment.center,
      children: <Widget>[container, text],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: stack,
    );
  }
}
