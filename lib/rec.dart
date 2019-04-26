import 'package:flutter/material.dart';

class UnfullSideRec extends StatefulWidget {
  @override
  _UnfullSideRecState createState() => _UnfullSideRecState();
}

class _UnfullSideRecState extends State<UnfullSideRec> {
  @override
  Widget build(BuildContext context) {
    var appscalfold = Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.pink,
            border: Border.all(color: Colors.yellow,width: 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(0),
        )),
        child: Center(
          child: Container(
            color: Colors.white,
            child: Text(
            'wo shi text',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),),
        ),
      ),
    );
    return appscalfold;
  }
}
