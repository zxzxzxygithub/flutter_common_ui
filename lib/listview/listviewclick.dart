//主页要展示的内容
import 'package:flutter/material.dart';

class ListviewClickItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ListState();
}

//得到一个ListView
class ListState extends State {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemCount: 40, itemBuilder: buildItem);
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index) {
    //设置分割线
    if (index.isOdd) return new Divider(height:4,color: Colors.green,);
    //设置字体样式
    TextStyle textStyle =
    new TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0);
    //设置Padding
    return   new GestureDetector(
      onTap: () {
        //处理点击事件
        print('click item'+index.toString());
      },
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Text("xhu_ww", style: textStyle),
      ),
    );
  }
}