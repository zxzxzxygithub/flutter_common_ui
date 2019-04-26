import 'package:flutter/material.dart';
import 'package:flutter_ui_common/bottomDialog/bottom_dialog.dart';
class BottomDialogTest extends StatefulWidget {
  @override
  _BottomDialogTestState createState() => _BottomDialogTestState();
}

class _BottomDialogTestState extends State<BottomDialogTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("title"),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext context) {
                  var list = List();
                  list.add('删除1');
                  list.add('删除2');
                  list.add('删除');
                  return CommonBottomSheet(
                    //uses the custom alert dialog
                    list: list,
                    onItemClickListener: (index) async {
                      Navigator.pop(context);
                    },
                  );
                });
          }),
          body: Container(
            margin: EdgeInsets.all(10),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'wo shi text',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        );;
  }
}
